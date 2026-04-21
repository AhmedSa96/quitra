import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:injectable/injectable.dart';
import '../models/user_settings_isar.dart';

class NotificationSettingsEntity {
  final bool dailyReminderEnabled;
  final TimeOfDay? dailyReminderTime;
  final bool milestoneCelebrationsEnabled;

  const NotificationSettingsEntity({
    this.dailyReminderEnabled = false,
    this.dailyReminderTime,
    this.milestoneCelebrationsEnabled = true,
  });

  NotificationSettingsEntity copyWith({
    bool? dailyReminderEnabled,
    TimeOfDay? dailyReminderTime,
    bool? milestoneCelebrationsEnabled,
    bool clearReminderTime = false,
  }) {
    return NotificationSettingsEntity(
      dailyReminderEnabled: dailyReminderEnabled ?? this.dailyReminderEnabled,
      dailyReminderTime: clearReminderTime ? null : (dailyReminderTime ?? this.dailyReminderTime),
      milestoneCelebrationsEnabled: milestoneCelebrationsEnabled ?? this.milestoneCelebrationsEnabled,
    );
  }
}

abstract class NotificationLocalDataSource {
  Future<NotificationSettingsEntity> getNotificationSettings();
  Future<void> saveNotificationSettings(NotificationSettingsEntity settings);
  Future<void> scheduleDailyReminder(TimeOfDay time);
  Future<void> cancelDailyReminder();
  Future<void> showMilestoneNotification(int days);
}

@LazySingleton(as: NotificationLocalDataSource)
class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  final Isar isar;

  NotificationLocalDataSourceImpl(this.isar);

  @override
  Future<NotificationSettingsEntity> getNotificationSettings() async {
    final settings = await isar.userSettingsIsars.get(0);
    if (settings == null) {
      return const NotificationSettingsEntity();
    }
    
    TimeOfDay? reminderTime;
    if (settings.dailyReminderTime != null) {
      final parts = settings.dailyReminderTime!.split(':');
      reminderTime = TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }
    
    return NotificationSettingsEntity(
      dailyReminderEnabled: settings.dailyReminderEnabled,
      dailyReminderTime: reminderTime,
      milestoneCelebrationsEnabled: settings.milestoneCelebrationsEnabled,
    );
  }

  @override
  Future<void> saveNotificationSettings(NotificationSettingsEntity settings) async {
    await isar.writeTxn(() async {
      final existing = await isar.userSettingsIsars.get(0) ?? UserSettingsIsar();
      final newSettings = UserSettingsIsar()
        ..id = 0
        ..locale = existing.locale
        ..dailyReminderEnabled = settings.dailyReminderEnabled
        ..dailyReminderTime = settings.dailyReminderTime != null
            ? '${settings.dailyReminderTime!.hour.toString().padLeft(2, '0')}:${settings.dailyReminderTime!.minute.toString().padLeft(2, '0')}'
            : null
        ..milestoneCelebrationsEnabled = settings.milestoneCelebrationsEnabled;
      await isar.userSettingsIsars.put(newSettings);
    });
  }

  @override
  Future<void> scheduleDailyReminder(TimeOfDay time) async {
  }

  @override
  Future<void> cancelDailyReminder() async {
  }

  @override
  Future<void> showMilestoneNotification(int days) async {
  }
}