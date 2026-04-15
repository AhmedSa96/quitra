import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quitra/features/onboarding/data/models/user_profile_isar.dart';

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
      final smokedCount = await localDataSource.getSmokedCigarettesCount();
      
      final daysSmokeFree = _calculateDaysSmokeFree(userProfile.quitStartDate, now);
      final theoreticalAvoided = _calculateCigarettesAvoided(daysSmokeFree, userProfile.cigarettesPerDay);
      final effectiveAvoided = theoreticalAvoided - smokedCount;
      final pricePerCigarette = _calculatePricePerCigarette(userProfile);
      final moneySaved = _calculateMoneySaved(effectiveAvoided, pricePerCigarette);

      final existingLocal = await localDataSource.getHomeStats();
      
      final stats = UserStats(
        daysSmokeFree: daysSmokeFree,
        cigarettesAvoided: effectiveAvoided > 0 ? effectiveAvoided : 0,
        moneySaved: moneySaved > 0 ? moneySaved : 0.0,
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
  Future<Either<Failure, Unit>> logCraving({required bool wasSmoked}) async {
    try {
      // 1. Log craving event specifically to the new table
      final event = CravingEventIsar()
        ..timestamp = DateTime.now()
        ..wasSmoked = wasSmoked;
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

// Pure functions for stats calculations

int _calculateDaysSmokeFree(DateTime quitStartDate, DateTime now) {
  final difference = now.difference(quitStartDate);
  return difference.inDays > 0 ? difference.inDays : 0;
}

int _calculateCigarettesAvoided(int daysSmokeFree, int cigarettesPerDay) {
  return daysSmokeFree * cigarettesPerDay;
}

double _calculatePricePerCigarette(UserProfileIsar profile) {
  if (profile.cigarettePrice != null) {
    return profile.cigarettePrice!;
  }

  if (profile.packetPrice != null &&
      profile.cigarettesPerPacket != null &&
      profile.cigarettesPerPacket! > 0) {
    return profile.packetPrice! / profile.cigarettesPerPacket!;
  }

  return 0.50; // Default fallback price
}

double _calculateMoneySaved(int effectiveAvoided, double pricePerCigarette) {
  return effectiveAvoided * pricePerCigarette;
}
