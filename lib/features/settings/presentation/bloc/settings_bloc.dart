import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:quitra/core/di/injection.dart';
import 'package:quitra/features/settings/data/models/user_settings_isar.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<LocaleChanged>(_onLocaleChanged);
    on<LoadSettings>(_onLoadSettings);
  }

  Future<void> _onLoadSettings(LoadSettings event, Emitter<SettingsState> emit) async {
    final isar = getIt<Isar>();
    final settings = await isar.userSettingsIsars.get(0);
    if (settings?.locale != null) {
      final parts = settings!.locale!.split('_');
      emit(SettingsState(locale: Locale(parts[0], parts.length > 1 ? parts[1] : null)));
    }
  }

  Future<void> _onLocaleChanged(LocaleChanged event, Emitter<SettingsState> emit) async {
    final isar = getIt<Isar>();
    final settings = UserSettingsIsar()
      ..id = 0
      ..locale = event.locale.toString();
    
    await isar.writeTxn(() async {
      await isar.userSettingsIsars.put(settings);
    });
    
    emit(SettingsState(locale: event.locale));
  }
}