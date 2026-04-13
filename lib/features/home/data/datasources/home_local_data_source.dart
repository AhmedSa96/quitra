import 'package:isar/isar.dart';
import 'package:injectable/injectable.dart';
import '../models/user_stats_isar.dart';

abstract class HomeLocalDataSource {
  Future<UserStatsIsar?> getHomeStats();
  Future<void> cacheHomeStats(UserStatsIsar stats);
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
}
