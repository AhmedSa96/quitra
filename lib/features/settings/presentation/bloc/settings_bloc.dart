import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:quitra/core/di/injection.dart';
import 'package:quitra/features/settings/data/models/user_settings_isar.dart';
import 'package:quitra/features/settings/data/datasources/notification_local_data_source.dart';
import 'package:quitra/features/settings/domain/usecases/export_data_use_case.dart';
import 'package:quitra/core/error/failures.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final NotificationLocalDataSource _notificationDataSource;
  final ExportDataUseCase _exportDataUseCase;

  SettingsBloc({
    NotificationLocalDataSource? notificationDataSource,
    ExportDataUseCase? exportDataUseCase,
  })  : _notificationDataSource = notificationDataSource ?? getIt<NotificationLocalDataSource>(),
        _exportDataUseCase = exportDataUseCase ?? getIt<ExportDataUseCase>(),
        super(const SettingsState()) {
    on<LocaleChanged>(_onLocaleChanged);
    on<LoadSettings>(_onLoadSettings);
    on<DailyReminderToggled>(_onDailyReminderToggled);
    on<DailyReminderTimeChanged>(_onDailyReminderTimeChanged);
    on<MilestoneCelebrationsToggled>(_onMilestoneCelebrationsToggled);
    on<ExportDataRequested>(_onExportDataRequested);
  }

  Future<void> _onExportDataRequested(ExportDataRequested event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(isExporting: true, exportFailure: null));
    final result = await _exportDataUseCase();
    result.fold(
      (failure) => emit(state.copyWith(isExporting: false, exportFailure: failure)),
      (_) => emit(state.copyWith(isExporting: false)),
    );
  }

  Future<void> _onLoadSettings(LoadSettings event, Emitter<SettingsState> emit) async {
    final isar = getIt<Isar>();
    final settings = await isar.userSettingsIsars.get(0);
    
    Locale? locale;
    if (settings?.locale != null) {
      final parts = settings!.locale!.split('_');
      locale = Locale(parts[0], parts.length > 1 ? parts[1] : null);
    }
    
    TimeOfDay? reminderTime;
    if (settings?.dailyReminderTime != null) {
      final parts = settings!.dailyReminderTime!.split(':');
      reminderTime = TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }
    
    emit(SettingsState(
      locale: locale,
      dailyReminderEnabled: settings?.dailyReminderEnabled ?? false,
      dailyReminderTime: reminderTime,
      milestoneCelebrationsEnabled: settings?.milestoneCelebrationsEnabled ?? true,
    ));
  }

  Future<void> _onLocaleChanged(LocaleChanged event, Emitter<SettingsState> emit) async {
    final isar = getIt<Isar>();
    final existing = await isar.userSettingsIsars.get(0);
    final settings = UserSettingsIsar()
      ..id = 0
      ..locale = event.locale.toString()
      ..dailyReminderEnabled = existing?.dailyReminderEnabled ?? false
      ..dailyReminderTime = existing?.dailyReminderTime
      ..milestoneCelebrationsEnabled = existing?.milestoneCelebrationsEnabled ?? true;
    
    await isar.writeTxn(() async {
      await isar.userSettingsIsars.put(settings);
    });
    
    emit(SettingsState(
      locale: event.locale,
      dailyReminderEnabled: settings.dailyReminderEnabled,
      dailyReminderTime: state.dailyReminderTime,
      milestoneCelebrationsEnabled: settings.milestoneCelebrationsEnabled,
    ));
  }

  Future<void> _onDailyReminderToggled(DailyReminderToggled event, Emitter<SettingsState> emit) async {
    final isar = getIt<Isar>();
    final existing = await isar.userSettingsIsars.get(0);
    
    final settings = UserSettingsIsar()
      ..id = 0
      ..locale = existing?.locale
      ..dailyReminderEnabled = event.enabled
      ..dailyReminderTime = existing?.dailyReminderTime
      ..milestoneCelebrationsEnabled = existing?.milestoneCelebrationsEnabled ?? true;
    
    await isar.writeTxn(() async {
      await isar.userSettingsIsars.put(settings);
    });
    
    if (event.enabled) {
      await _notificationDataSource.scheduleDailyReminder(
        time: state.dailyReminderTime ?? const TimeOfDay(hour: 9, minute: 0),
        title: event.notificationTitle,
        body: event.notificationBody,
      );
    } else {
      await _notificationDataSource.cancelDailyReminder();
    }
    
    emit(SettingsState(
      locale: state.locale,
      dailyReminderEnabled: event.enabled,
      dailyReminderTime: state.dailyReminderTime,
      milestoneCelebrationsEnabled: settings.milestoneCelebrationsEnabled,
    ));
  }

  Future<void> _onDailyReminderTimeChanged(DailyReminderTimeChanged event, Emitter<SettingsState> emit) async {
    final isar = getIt<Isar>();
    final existing = await isar.userSettingsIsars.get(0);
    
    final timeString = '${event.time.hour.toString().padLeft(2, '0')}:${event.time.minute.toString().padLeft(2, '0')}';
    
    final settings = UserSettingsIsar()
      ..id = 0
      ..locale = existing?.locale
      ..dailyReminderEnabled = existing?.dailyReminderEnabled ?? false
      ..dailyReminderTime = timeString
      ..milestoneCelebrationsEnabled = existing?.milestoneCelebrationsEnabled ?? true;
    
    await isar.writeTxn(() async {
      await isar.userSettingsIsars.put(settings);
    });
    
    if (settings.dailyReminderEnabled) {
      await _notificationDataSource.scheduleDailyReminder(
        time: event.time,
        title: event.notificationTitle,
        body: event.notificationBody,
      );
    }
    
    emit(SettingsState(
      locale: state.locale,
      dailyReminderEnabled: settings.dailyReminderEnabled,
      dailyReminderTime: event.time,
      milestoneCelebrationsEnabled: settings.milestoneCelebrationsEnabled,
    ));
  }

  Future<void> _onMilestoneCelebrationsToggled(MilestoneCelebrationsToggled event, Emitter<SettingsState> emit) async {
    final isar = getIt<Isar>();
    final existing = await isar.userSettingsIsars.get(0);
    
    final settings = UserSettingsIsar()
      ..id = 0
      ..locale = existing?.locale
      ..dailyReminderEnabled = existing?.dailyReminderEnabled ?? false
      ..dailyReminderTime = existing?.dailyReminderTime
      ..milestoneCelebrationsEnabled = event.enabled;
    
    await isar.writeTxn(() async {
      await isar.userSettingsIsars.put(settings);
    });
    
    emit(SettingsState(
      locale: state.locale,
      dailyReminderEnabled: settings.dailyReminderEnabled,
      dailyReminderTime: state.dailyReminderTime,
      milestoneCelebrationsEnabled: event.enabled,
    ));
  }
}