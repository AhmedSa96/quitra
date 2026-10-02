import 'package:isar/isar.dart';

part 'user_settings_isar.g.dart';

@collection
class UserSettingsIsar {
  Id id = 0;

  String? locale;
  bool dailyReminderEnabled = false;
  String? dailyReminderTime;
  bool milestoneCelebrationsEnabled = true;
  int streakModeIndex = 0; // 0: strict, 1: forgiving
  bool streakRemindersEnabled = true;
}
