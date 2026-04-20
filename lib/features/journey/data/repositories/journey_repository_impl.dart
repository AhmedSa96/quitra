import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../home/data/datasources/home_local_data_source.dart';
import '../../domain/entities/journey_day.dart';
import '../../domain/repositories/journey_repository.dart';

@LazySingleton(as: JourneyRepository)
class JourneyRepositoryImpl implements JourneyRepository {
  final HomeLocalDataSource localDataSource;

  JourneyRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<JourneyDay>>> getJourneyHistory() async {
    try {
      final profile = await localDataSource.getUserProfile();
      if (profile == null) {
        return const Left(Failure.databaseError());
      }

      final dailyLogs = await localDataSource.getDailyLogs();
      final cravingEvents = await localDataSource.getCravingEvents();

      final now = DateTime.now();
      final startDate = profile.quitStartDate;
      
      // Normalize dates to start of day for comparison
      final normalizedNow = DateTime(now.year, now.month, now.day);
      final normalizedStart = DateTime(startDate.year, startDate.month, startDate.day);

      final List<JourneyDay> history = [];

      // Iterate from today back to start date
      for (var date = normalizedNow; 
           date.isAfter(normalizedStart.subtract(const Duration(seconds: 1))); 
           date = date.subtract(const Duration(days: 1))) {
        
        final daysLogs = dailyLogs.where((l) => 
          l.date.year == date.year && l.date.month == date.month && l.date.day == date.day).toList();
        
        final daysCravings = cravingEvents.where((e) => 
          e.timestamp.year == date.year && e.timestamp.month == date.month && e.timestamp.day == date.day).toList();

        final hasSmokedManual = daysLogs.any((l) => l.wasSmoked);
        final hasSmokedEvent = daysCravings.any((e) => e.wasSmoked);

        JourneyStatus status = JourneyStatus.clean;
        String? note;
        int? cravingLevel;

        if (hasSmokedManual || hasSmokedEvent) {
          status = JourneyStatus.setback;
        } else if (daysCravings.isNotEmpty) {
          status = JourneyStatus.craving;
        }

        if (daysLogs.isNotEmpty) {
          note = daysLogs.first.note;
          cravingLevel = daysLogs.first.cravingLevel;
        }

        history.add(JourneyDay(
          date: date,
          status: status,
          note: note,
          cravingLevel: cravingLevel,
        ));
      }

      return Right(history);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateJourneyDay({
    required DateTime date,
    bool? wasSmoked,
    int? cravingLevel,
    String? note,
  }) async {
    try {
      await localDataSource.updateDailyLog(
        date: date,
        wasSmoked: wasSmoked,
        cravingLevel: cravingLevel,
        note: note,
      );
      return const Right(unit);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }
}
