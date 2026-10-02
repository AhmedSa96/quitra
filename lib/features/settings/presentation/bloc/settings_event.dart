part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class LocaleChanged extends SettingsEvent {
  final Locale locale;

  const LocaleChanged(this.locale);
}

class LoadSettings extends SettingsEvent {
  const LoadSettings();
}

class StreakModeChanged extends SettingsEvent {
  final StreakMode mode;

  const StreakModeChanged(this.mode);
}

class StreakRemindersToggled extends SettingsEvent {
  final bool enabled;

  const StreakRemindersToggled(this.enabled);
}

class DailyReminderToggled extends SettingsEvent {
  final bool enabled;
  final String notificationTitle;
  final String notificationBody;

  DailyReminderToggled({
    required this.enabled,
    required this.notificationTitle,
    required this.notificationBody,
  });
}

class DailyReminderTimeChanged extends SettingsEvent {
  final TimeOfDay time;
  final String notificationTitle;
  final String notificationBody;

  DailyReminderTimeChanged({
    required this.time,
    required this.notificationTitle,
    required this.notificationBody,
  });
}

class MilestoneCelebrationsToggled extends SettingsEvent {
  final bool enabled;

  MilestoneCelebrationsToggled(this.enabled);
}

class ExportDataRequested extends SettingsEvent {}