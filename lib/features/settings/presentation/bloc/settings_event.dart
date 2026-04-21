part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class LocaleChanged extends SettingsEvent {
  final Locale locale;

  LocaleChanged(this.locale);
}

class LoadSettings extends SettingsEvent {}

class DailyReminderToggled extends SettingsEvent {
  final bool enabled;

  DailyReminderToggled(this.enabled);
}

class DailyReminderTimeChanged extends SettingsEvent {
  final TimeOfDay time;

  DailyReminderTimeChanged(this.time);
}

class MilestoneCelebrationsToggled extends SettingsEvent {
  final bool enabled;

  MilestoneCelebrationsToggled(this.enabled);
}