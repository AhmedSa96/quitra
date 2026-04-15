import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user_stats.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';
import '../models/user_stats_isar.dart';
import '../models/craving_event_isar.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, UserStats>> getHomeStats() async {
    try {
      final userProfile = await localDataSource.getUserProfile();
      if (userProfile == null) {
        return const Left(Failure.databaseError());
      }

      final now = DateTime.now();
      final difference = now.difference(userProfile.quitStartDate);
      final daysSmokeFree = difference.inDays > 0 ? difference.inDays : 0;
      final cigarettesAvoided = daysSmokeFree * userProfile.cigarettesPerDay;
      double pricePerCigarette = 0.50;
      if (userProfile.cigarettePrice != null) {
        pricePerCigarette = userProfile.cigarettePrice!;
      } else if (userProfile.packetPrice != null && userProfile.cigarettesPerPacket != null && userProfile.cigarettesPerPacket! > 0) {
        pricePerCigarette = userProfile.packetPrice! / userProfile.cigarettesPerPacket!;
      }
      final moneySaved = cigarettesAvoided * pricePerCigarette;

      final existingLocal = await localDataSource.getHomeStats();
      
      final stats = UserStats(
        daysSmokeFree: daysSmokeFree,
        cigarettesAvoided: cigarettesAvoided,
        moneySaved: moneySaved,
        cravingsLogged: existingLocal?.cravingsLogged ?? 0,
      );

      // Cache updated local stats wrapper
      await localDataSource.cacheHomeStats(UserStatsIsar()
        ..daysSmokeFree = stats.daysSmokeFree
        ..cigarettesAvoided = stats.cigarettesAvoided
        ..moneySaved = stats.moneySaved
        ..cravingsLogged = stats.cravingsLogged
        ..lastUpdated = now);

      return Right(stats);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, Unit>> logCraving() async {
    try {
      // 1. Log craving event specifically to the new table
      final event = CravingEventIsar()..timestamp = DateTime.now();
      await localDataSource.logCravingEvent(event);

      // 2. Increment local summary stats directly
      final localStats = await localDataSource.getHomeStats();
      if (localStats != null) {
        localStats.cravingsLogged += 1;
        await localDataSource.cacheHomeStats(localStats);
      } else {
        await localDataSource.cacheHomeStats(UserStatsIsar()
          ..cravingsLogged = 1
          ..lastUpdated = DateTime.now());
      }

      return const Right(unit);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }
}

