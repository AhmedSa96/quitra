import 'package:isar/isar.dart';
import 'package:injectable/injectable.dart';

import '../../../../features/onboarding/data/models/user_profile_isar.dart';
import '../models/user_stats_isar.dart';
import '../models/craving_event_isar.dart';

abstract class HomeLocalDataSource {
  Future<UserStatsIsar?> getHomeStats();
  Future<void> cacheHomeStats(UserStatsIsar stats);
  Future<UserProfileIsar?> getUserProfile();
  Future<void> logCravingEvent(CravingEventIsar event);
}

@LazySingleton(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Isar isar;

  HomeLocalDataSourceImpl(this.isar);

  @override
  Future<UserStatsIsar?> getHomeStats() async {
    return isar.userStatsIsars.get(0);
  }

  @override
  Future<void> cacheHomeStats(UserStatsIsar stats) async {
    await isar.writeTxn(() async {
      await isar.userStatsIsars.put(stats);
    });
  }

  @override
  Future<UserProfileIsar?> getUserProfile() async {
    return isar.userProfileIsars.where().findFirst();
  }

  @override
  Future<void> logCravingEvent(CravingEventIsar event) async {
    await isar.writeTxn(() async {
      await isar.cravingEventIsars.put(event);
    });
  }
}
