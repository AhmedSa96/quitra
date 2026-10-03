import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../settings/data/models/user_settings_isar.dart';
import '../../../streak/data/models/streak_isar.dart';
import '../models/user_profile_isar.dart';

abstract class OnboardingLocalDataSource {
  Future<void> saveUserProfile(UserProfileIsar profile);
  Future<bool> hasUserProfile();
  Future<UserProfileIsar?> getUserProfile();
  Future<void> saveStreakMode(int streakModeIndex);
}

@LazySingleton(as: OnboardingLocalDataSource)
class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final Isar isar;

  OnboardingLocalDataSourceImpl(this.isar);

  @override
  Future<void> saveUserProfile(UserProfileIsar profile) async {
    await isar.writeTxn(() async {
      await isar.userProfileIsars.put(profile);
    });
  }

  @override
  Future<bool> hasUserProfile() async {
    final count = await isar.userProfileIsars.count();
    return count > 0;
  }

  @override
  Future<UserProfileIsar?> getUserProfile() async {
    return isar.userProfileIsars.where().findFirst();
  }

  @override
  Future<void> saveStreakMode(int streakModeIndex) async {
    await isar.writeTxn(() async {
      final existingSettings = await isar.userSettingsIsars.get(0);
      final settings = UserSettingsIsar()
        ..id = 0
        ..locale = existingSettings?.locale
        ..dailyReminderEnabled = existingSettings?.dailyReminderEnabled ?? false
        ..dailyReminderTime = existingSettings?.dailyReminderTime
        ..milestoneCelebrationsEnabled = existingSettings?.milestoneCelebrationsEnabled ?? true
        ..streakModeIndex = streakModeIndex
        ..streakRemindersEnabled = existingSettings?.streakRemindersEnabled ?? true;
      await isar.userSettingsIsars.put(settings);

      final streakModel = await isar.streakIsars.where().findFirst();
      if (streakModel != null) {
        streakModel.modeIndex = streakModeIndex;
        await isar.streakIsars.put(streakModel);
      } else {
        final now = DateTime.now();
        final monday = DateTime(now.year, now.month, now.day).subtract(Duration(days: now.weekday - 1));
        final initial = StreakIsar()
          ..id = 0
          ..currentCount = 0
          ..longestCount = 0
          ..modeIndex = streakModeIndex
          ..forgivenessUsedThisWeek = false
          ..weekStartDate = monday;
        await isar.streakIsars.put(initial);
      }
    });
  }
}
