import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../home/data/datasources/home_local_data_source.dart';
import '../models/journal_note_isar.dart';
import '../../domain/entities/journey_day.dart';
import '../../domain/entities/journey_note.dart';
import '../../domain/repositories/journey_repository.dart';

@LazySingleton(as: JourneyRepository)
class JourneyRepositoryImpl implements JourneyRepository {
  final HomeLocalDataSource localDataSource;

  JourneyRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<JourneyDay>>> getJourneyHistory({int? limit, int? offset}) async {
    try {
      final profile = await localDataSource.getUserProfile();
      if (profile == null) {
        return const Left(Failure.databaseError());
      }

      final dailyLogs = await localDataSource.getDailyLogs();
      final cravingEvents = await localDataSource.getCravingEvents();
      final journalNotes = await localDataSource.getAllJournalNotes();

      final now = DateTime.now();
      final startDate = profile.quitStartDate;
      
      // Normalize dates to start of day for comparison
      final normalizedNow = DateTime(now.year, now.month, now.day);
      final normalizedStart = DateTime(startDate.year, startDate.month, startDate.day);

      if (normalizedStart.isAfter(normalizedNow)) {
        return const Right([]);
      }

      final totalDays = (normalizedNow.difference(normalizedStart).inMinutes / (24 * 60)).round() + 1;
      final startOffset = offset ?? 0;
      if (startOffset >= totalDays) {
        return const Right([]);
      }

      final count = limit != null
          ? ((startOffset + limit > totalDays) ? totalDays - startOffset : limit)
          : (totalDays - startOffset);
      if (count <= 0) {
        return const Right([]);
      }

      final List<JourneyDay> history = [];

      // Iterate for the paginated slice
      for (var i = 0; i < count; i++) {
        final date = DateTime(normalizedNow.year, normalizedNow.month, normalizedNow.day - (startOffset + i));
        
        final daysLogs = dailyLogs.where((l) => 
          l.date.year == date.year && l.date.month == date.month && l.date.day == date.day).toList();
        
        final daysCravings = cravingEvents.where((e) => 
          e.timestamp.year == date.year && e.timestamp.month == date.month && e.timestamp.day == date.day).toList();

        final daysNotes = journalNotes.where((n) =>
          n.date.year == date.year && n.date.month == date.month && n.date.day == date.day).toList()
          ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

        final domainNotes = daysNotes.map((n) => JourneyNote(
          id: n.id,
          createdAt: n.createdAt,
          text: n.text,
        )).toList();

        final hasSmokedManual = daysLogs.any((l) => l.wasSmoked);
        final hasSmokedEvent = daysCravings.any((e) => e.wasSmoked);

        JourneyStatus status = JourneyStatus.clean;
        String? legacyNote;
        int? cravingLevel;

        if (hasSmokedManual || hasSmokedEvent) {
          status = JourneyStatus.setback;
        } else if (daysCravings.isNotEmpty) {
          status = JourneyStatus.craving;
        }

        if (daysLogs.isNotEmpty) {
          legacyNote = daysLogs.first.note;
          cravingLevel = daysLogs.first.cravingLevel;
        }

        history.add(JourneyDay(
          date: date,
          status: status,
          notes: domainNotes,
          note: domainNotes.isNotEmpty ? domainNotes.last.text : legacyNote,
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

  @override
  Future<Either<Failure, Unit>> addJourneyNote({
    required DateTime date,
    required String text,
  }) async {
    try {
      final normalizedDate = DateTime(date.year, date.month, date.day);
      final note = JournalNoteIsar()
        ..date = normalizedDate
        ..createdAt = DateTime.now()
        ..text = text;
      await localDataSource.addJournalNote(note);
      return const Right(unit);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }
}
