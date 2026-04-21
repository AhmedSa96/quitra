import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:isar/isar.dart';
import 'package:injectable/injectable.dart';
import 'package:quitra/main.dart';
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
      dailyReminderTime: clearReminderTime
          ? null
          : (dailyReminderTime ?? this.dailyReminderTime),
      milestoneCelebrationsEnabled:
          milestoneCelebrationsEnabled ?? this.milestoneCelebrationsEnabled,
    );
  }
}

abstract class NotificationLocalDataSource {
  Future<NotificationSettingsEntity> getNotificationSettings();
  Future<void> saveNotificationSettings(NotificationSettingsEntity settings);
  Future<void> scheduleDailyReminder({
    required TimeOfDay time,
    required String title,
    required String body,
  });
  Future<void> cancelDailyReminder();
  Future<void> showMilestoneNotification({
    required int days,
    required String title,
    required String body,
  });
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
  Future<void> saveNotificationSettings(
    NotificationSettingsEntity settings,
  ) async {
    await isar.writeTxn(() async {
      final existing =
          await isar.userSettingsIsars.get(0) ?? UserSettingsIsar();
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
  Future<void> scheduleDailyReminder({
    required TimeOfDay time,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'daily_reminder_channel',
      'Daily Check-in',
      channelDescription: 'Daily check-in reminder',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      title,
      body,
      RepeatInterval.daily,
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  @override
  Future<void> cancelDailyReminder() async {
    await flutterLocalNotificationsPlugin.cancel(1);
  }

  @override
  Future<void> showMilestoneNotification({
    required int days,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'milestone_channel',
      'Milestone Celebration',
      channelDescription: 'Milestone celebrations',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      100 + days,
      title,
      body,
      details,
    );
  }
}
