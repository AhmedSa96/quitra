import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../models/user_profile_isar.dart';

abstract class OnboardingLocalDataSource {
  Future<void> saveUserProfile(UserProfileIsar profile);
  Future<bool> hasUserProfile();
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
}
