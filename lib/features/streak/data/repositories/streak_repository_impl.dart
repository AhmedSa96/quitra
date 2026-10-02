import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/streak.dart';
import '../../domain/repositories/streak_repository.dart';
import '../datasources/streak_local_data_source.dart';
import '../models/streak_isar.dart';

@LazySingleton(as: StreakRepository)
class StreakRepositoryImpl implements StreakRepository {
  final StreakLocalDataSource localDataSource;

  StreakRepositoryImpl(this.localDataSource);

  DateTime _getMondayOfCurrentWeek(DateTime date) {
    return DateTime(date.year, date.month, date.day).subtract(Duration(days: date.weekday - 1));
  }

  Streak _toEntity(StreakIsar model) {
    final now = DateTime.now();
    final currentWeekStart = _getMondayOfCurrentWeek(now);

    bool forgivenessUsed = model.forgivenessUsedThisWeek;
    if (model.weekStartDate != null && model.weekStartDate!.isBefore(currentWeekStart)) {
      forgivenessUsed = false;
    }

    return Streak(
      currentCount: model.currentCount,
      longestCount: model.longestCount,
      lastCheckInDate: model.lastCheckInDate,
      mode: StreakMode.values[model.modeIndex],
      forgivenessUsedThisWeek: forgivenessUsed,
    );
  }

  Future<StreakIsar> _getOrCreate() async {
    final existing = await localDataSource.getStreakModel();
    if (existing != null) {
      final now = DateTime.now();
      final currentWeekStart = _getMondayOfCurrentWeek(now);
      if (existing.weekStartDate == null || existing.weekStartDate!.isBefore(currentWeekStart)) {
        existing.forgivenessUsedThisWeek = false;
        existing.weekStartDate = currentWeekStart;
        await localDataSource.saveStreakModel(existing);
      }
      return existing;
    }
    final initial = StreakIsar()
      ..currentCount = 0
      ..longestCount = 0
      ..modeIndex = 0
      ..forgivenessUsedThisWeek = false
      ..weekStartDate = _getMondayOfCurrentWeek(DateTime.now());
    await localDataSource.saveStreakModel(initial);
    return initial;
  }

  @override
  Future<Either<Failure, Streak>> getStreak() async {
    try {
      final model = await _getOrCreate();
      return Right(_toEntity(model));
    } catch (_) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, Streak>> incrementStreak() async {
    try {
      final model = await _getOrCreate();
      model.currentCount += 1;
      if (model.currentCount > model.longestCount) {
        model.longestCount = model.currentCount;
      }
      model.lastCheckInDate = DateTime.now();
      await localDataSource.saveStreakModel(model);
      return Right(_toEntity(model));
    } catch (_) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, Streak>> resetStreak() async {
    try {
      final model = await _getOrCreate();
      model.currentCount = 0;
      model.lastCheckInDate = DateTime.now();
      await localDataSource.saveStreakModel(model);
      return Right(_toEntity(model));
    } catch (_) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, Streak>> updateStreakMode(StreakMode mode) async {
    try {
      final model = await _getOrCreate();
      model.modeIndex = mode.index;
      await localDataSource.saveStreakModel(model);
      return Right(_toEntity(model));
    } catch (_) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, Streak>> useForgivenessToken() async {
    try {
      final model = await _getOrCreate();
      model.forgivenessUsedThisWeek = true;
      model.lastCheckInDate = DateTime.now();
      await localDataSource.saveStreakModel(model);
      return Right(_toEntity(model));
    } catch (_) {
      return const Left(Failure.databaseError());
    }
  }
}
