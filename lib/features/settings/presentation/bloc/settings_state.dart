part of 'settings_bloc.dart';

class SettingsState {
  final Locale? locale;
  final bool dailyReminderEnabled;
  final TimeOfDay? dailyReminderTime;
  final bool milestoneCelebrationsEnabled;

  const SettingsState({
    this.locale,
    this.dailyReminderEnabled = false,
    this.dailyReminderTime,
    this.milestoneCelebrationsEnabled = true,
  });

  SettingsState copyWith({
    Locale? locale,
    bool? dailyReminderEnabled,
    TimeOfDay? dailyReminderTime,
    bool? milestoneCelebrationsEnabled,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      dailyReminderEnabled: dailyReminderEnabled ?? this.dailyReminderEnabled,
      dailyReminderTime: dailyReminderTime ?? this.dailyReminderTime,
      milestoneCelebrationsEnabled: milestoneCelebrationsEnabled ?? this.milestoneCelebrationsEnabled,
    );
  }
}