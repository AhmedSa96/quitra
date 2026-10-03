import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart';
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart';
import 'package:quitra/features/journey/data/models/journal_note_isar.dart';

class MockHomeLocalDataSource extends Mock implements HomeLocalDataSource {}

class FakeJournalNoteIsar extends Fake implements JournalNoteIsar {}

void main() {
  late MockHomeLocalDataSource mockDataSource;
  late HomeRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(FakeJournalNoteIsar());
  });

  setUp(() {
    mockDataSource = MockHomeLocalDataSource();
    repository = HomeRepositoryImpl(mockDataSource);
  });

  test('saveDailyCheckIn updates daily log and adds journal note when note provided', () async {
    when(() => mockDataSource.updateDailyLog(
          date: any(named: 'date'),
          wasSmoked: any(named: 'wasSmoked'),
          cravingLevel: any(named: 'cravingLevel'),
          note: any(named: 'note'),
        )).thenAnswer((_) async {});

    when(() => mockDataSource.addJournalNote(any())).thenAnswer((_) async {});

    final result = await repository.saveDailyCheckIn(
      wasSmoked: false,
      cravingLevel: 3,
      note: 'Deep breathing helped',
    );

    expect(result.isRight(), true);
    verify(() => mockDataSource.updateDailyLog(
          date: any(named: 'date'),
          wasSmoked: false,
          cravingLevel: 3,
          note: 'Deep breathing helped',
        )).called(1);
    verify(() => mockDataSource.addJournalNote(any(that: isA<JournalNoteIsar>()))).called(1);
  });

  test('saveDailyCheckIn does not add journal note when note is null or empty', () async {
    when(() => mockDataSource.updateDailyLog(
          date: any(named: 'date'),
          wasSmoked: any(named: 'wasSmoked'),
          cravingLevel: any(named: 'cravingLevel'),
          note: any(named: 'note'),
        )).thenAnswer((_) async {});

    final result = await repository.saveDailyCheckIn(
      wasSmoked: false,
      cravingLevel: 1,
      note: null,
    );

    expect(result.isRight(), true);
    verify(() => mockDataSource.updateDailyLog(
          date: any(named: 'date'),
          wasSmoked: false,
          cravingLevel: 1,
          note: null,
        )).called(1);
    verifyNever(() => mockDataSource.addJournalNote(any()));
  });
}
