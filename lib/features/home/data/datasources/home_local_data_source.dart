import 'package:isar/isar.dart';
import 'package:injectable/injectable.dart';

import '../../../../features/onboarding/data/models/user_profile_isar.dart';
import '../models/user_stats_isar.dart';
import '../models/craving_event_isar.dart';
import '../models/daily_log_isar.dart';

abstract class HomeLocalDataSource {
  Future<UserStatsIsar?> getHomeStats();
  Future<void> cacheHomeStats(UserStatsIsar stats);
  Future<UserProfileIsar?> getUserProfile();
  Future<void> logCravingEvent(CravingEventIsar event);
  Future<int> getSmokedCigarettesCount();
  Future<void> saveDailyLog(DailyLogIsar log);
  Future<List<DailyLogIsar>> getDailyLogs();
  Future<List<CravingEventIsar>> getCravingEvents();
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

  @override
  Future<int> getSmokedCigarettesCount() async {
    return isar.cravingEventIsars.filter().wasSmokedEqualTo(true).count();
  }

  @override
  Future<void> saveDailyLog(DailyLogIsar log) async {
    await isar.writeTxn(() async {
      await isar.dailyLogIsars.put(log);
    });
  }

  @override
  Future<List<DailyLogIsar>> getDailyLogs() async {
    return isar.dailyLogIsars.where().sortByDateDesc().findAll();
  }

  @override
  Future<List<CravingEventIsar>> getCravingEvents() async {
    return isar.cravingEventIsars.where().sortByTimestampDesc().findAll();
  }
}
