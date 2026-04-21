part of 'settings_bloc.dart';

class SettingsState {
  final Locale? locale;
  final bool dailyReminderEnabled;
  final TimeOfDay? dailyReminderTime;
  final bool milestoneCelebrationsEnabled;
  final bool isExporting;
  final Failure? exportFailure;

  const SettingsState({
    this.locale,
    this.dailyReminderEnabled = false,
    this.dailyReminderTime,
    this.milestoneCelebrationsEnabled = true,
    this.isExporting = false,
    this.exportFailure,
  });

  SettingsState copyWith({
    Locale? locale,
    bool? dailyReminderEnabled,
    TimeOfDay? dailyReminderTime,
    bool? milestoneCelebrationsEnabled,
    bool? isExporting,
    Failure? exportFailure,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      dailyReminderEnabled: dailyReminderEnabled ?? this.dailyReminderEnabled,
      dailyReminderTime: dailyReminderTime ?? this.dailyReminderTime,
      milestoneCelebrationsEnabled: milestoneCelebrationsEnabled ?? this.milestoneCelebrationsEnabled,
      isExporting: isExporting ?? this.isExporting,
      exportFailure: exportFailure,
    );
  }
}