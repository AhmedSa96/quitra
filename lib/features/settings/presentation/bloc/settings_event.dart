part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class LocaleChanged extends SettingsEvent {
  final Locale locale;

  LocaleChanged(this.locale);
}

class LoadSettings extends SettingsEvent {}

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