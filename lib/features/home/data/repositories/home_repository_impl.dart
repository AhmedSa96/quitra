import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user_stats.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/user_stats_isar.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, UserStats>> getHomeStats() async {
    try {
      // 1. Try to get from local source first
      final localStats = await localDataSource.getHomeStats();
      
      if (localStats != null) {
        // Return local data immediately (Offline-First)
        final entity = UserStats(
          daysSmokeFree: localStats.daysSmokeFree,
          cigarettesAvoided: localStats.cigarettesAvoided,
          moneySaved: localStats.moneySaved,
        );

        // Optional: Trigger background sync in a real app
        _syncWithRemoteInBackground();

        return Right(entity);
      }

      // 2. If no local data, fallback to remote
      final remoteData = await remoteDataSource.getHomeStats();
      if (remoteData == null) {
        return const Left(Failure.serverError());
      }

      // Calculate stats (logic moved here from old implementation)
      final stats = _calculateStatsFromRemote(remoteData);
      
      // Cache the result
      await localDataSource.cacheHomeStats(UserStatsIsar()
        ..daysSmokeFree = stats.daysSmokeFree
        ..cigarettesAvoided = stats.cigarettesAvoided
        ..moneySaved = stats.moneySaved
        ..lastUpdated = DateTime.now());

      return Right(stats);
    } catch (e) {
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> logCraving() async {
    try {
      // Optimistic UI: Update local state if needed (not shown for brevity in this reference)
      
      // Push to remote
      await remoteDataSource.logCraving();
      
      return const Right(unit);
    } catch (e) {
      // In a real Optimistic UI, we might need to rollback local changes here
      return const Left(Failure.serverError());
    }
  }

  UserStats _calculateStatsFromRemote(Map<String, dynamic> response) {
    final quitStartDateStr = response['quit_start_date'] as String?;
    final cigarettesPerDay = response['cigarettes_per_day'] as int? ?? 0;

    if (quitStartDateStr == null) {
      return const UserStats(daysSmokeFree: 0, cigarettesAvoided: 0, moneySaved: 0);
    }

    final quitStartDate = DateTime.parse(quitStartDateStr);
    final now = DateTime.now();

    final difference = now.difference(quitStartDate);
    final daysSmokeFree = difference.inDays > 0 ? difference.inDays : 0;

    final cigarettesAvoided = daysSmokeFree * cigarettesPerDay;
    const pricePerCigarette = 0.50;
    final moneySaved = cigarettesAvoided * pricePerCigarette;

    return UserStats(
      daysSmokeFree: daysSmokeFree,
      cigarettesAvoided: cigarettesAvoided,
      moneySaved: moneySaved,
    );
  }

  void _syncWithRemoteInBackground() async {
    try {
      final remoteData = await remoteDataSource.getHomeStats();
      if (remoteData != null) {
        final stats = _calculateStatsFromRemote(remoteData);
        await localDataSource.cacheHomeStats(UserStatsIsar()
          ..daysSmokeFree = stats.daysSmokeFree
          ..cigarettesAvoided = stats.cigarettesAvoided
          ..moneySaved = stats.moneySaved
          ..lastUpdated = DateTime.now());
      }
    } catch (_) {
      // Background sync failures are typically ignored or retried silently
    }
  }
}
