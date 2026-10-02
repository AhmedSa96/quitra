import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/streak/data/datasources/streak_local_data_source.dart';
import 'package:quitra/features/streak/data/models/streak_isar.dart';
import 'package:quitra/features/streak/data/repositories/streak_repository_impl.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';

class MockStreakLocalDataSource extends Mock implements StreakLocalDataSource {}

void main() {
  late StreakRepositoryImpl repository;
  late MockStreakLocalDataSource mockDataSource;

  setUpAll(() {
    registerFallbackValue(StreakIsar());
  });

  setUp(() {
    mockDataSource = MockStreakLocalDataSource();
    repository = StreakRepositoryImpl(mockDataSource);
  });

  test('getStreak returns default streak if none stored', () async {
    when(() => mockDataSource.getStreakModel()).thenAnswer((_) async => null);
    when(() => mockDataSource.saveStreakModel(any())).thenAnswer((_) async {});

    final result = await repository.getStreak();

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('should succeed'),
      (streak) {
        expect(streak.currentCount, 0);
        expect(streak.mode, StreakMode.strict);
      },
    );
  });

  test('incrementStreak increases current count and updates longestCount', () async {
    final model = StreakIsar()
      ..currentCount = 4
      ..longestCount = 4
      ..modeIndex = StreakMode.strict.index;

    when(() => mockDataSource.getStreakModel()).thenAnswer((_) async => model);
    when(() => mockDataSource.saveStreakModel(any())).thenAnswer((_) async {});

    final result = await repository.incrementStreak();

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('should succeed'),
      (streak) {
        expect(streak.currentCount, 5);
        expect(streak.longestCount, 5);
      },
    );
  });
}
