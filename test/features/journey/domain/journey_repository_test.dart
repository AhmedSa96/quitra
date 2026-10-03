import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart';
import 'package:quitra/features/home/data/models/daily_log_isar.dart';
import 'package:quitra/features/journey/data/models/journal_note_isar.dart';
import 'package:quitra/features/journey/data/repositories/journey_repository_impl.dart';
import 'package:quitra/features/onboarding/data/models/user_profile_isar.dart';

class MockHomeLocalDataSource extends Mock implements HomeLocalDataSource {}

void main() {
  late MockHomeLocalDataSource mockDataSource;
  late JourneyRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockHomeLocalDataSource();
    repository = JourneyRepositoryImpl(mockDataSource);
  });

  test('getJourneyHistory maps multiple notes chronologically for the same day', () async {
    final now = DateTime.now();
    final profile = UserProfileIsar()
      ..quitStartDate = now
      ..cigarettesPerDay = 10;

    final note1 = JournalNoteIsar()
      ..id = 1
      ..date = DateTime(now.year, now.month, now.day)
      ..createdAt = DateTime(now.year, now.month, now.day, 9, 30)
      ..text = 'Morning reflection';

    final note2 = JournalNoteIsar()
      ..id = 2
      ..date = DateTime(now.year, now.month, now.day)
      ..createdAt = DateTime(now.year, now.month, now.day, 15, 0)
      ..text = 'Afternoon reflection';

    final dailyLog = DailyLogIsar()
      ..date = DateTime(now.year, now.month, now.day)
      ..wasSmoked = false
      ..cravingLevel = 2;

    when(() => mockDataSource.getUserProfile()).thenAnswer((_) async => profile);
    when(() => mockDataSource.getDailyLogs()).thenAnswer((_) async => [dailyLog]);
    when(() => mockDataSource.getCravingEvents()).thenAnswer((_) async => []);
    when(() => mockDataSource.getAllJournalNotes()).thenAnswer((_) async => [note2, note1]); // purposefully reversed

    final result = await repository.getJourneyHistory();

    expect(result.isRight(), true);
    result.fold((_) => fail('should be right'), (history) {
      expect(history.isNotEmpty, true);
      final today = history.first;
      expect(today.notes.length, 2);
      expect(today.notes[0].text, 'Morning reflection');
      expect(today.notes[1].text, 'Afternoon reflection');
    });
  });
}
