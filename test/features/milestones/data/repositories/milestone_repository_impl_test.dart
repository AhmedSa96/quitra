import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/milestones/data/datasources/milestone_local_data_source.dart';
import 'package:quitra/features/milestones/data/repositories/milestone_repository_impl.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';

class MockMilestoneLocalDataSource extends Mock implements MilestoneLocalDataSource {}

void main() {
  late MilestoneRepositoryImpl repository;
  late MockMilestoneLocalDataSource mockDataSource;

  setUpAll(() {
    registerFallbackValue(DateTime.now());
  });

  setUp(() {
    mockDataSource = MockMilestoneLocalDataSource();
    repository = MilestoneRepositoryImpl(mockDataSource);
  });

  test('getAllMilestones returns 23 predefined milestones with unlock status', () async {
    when(() => mockDataSource.getUnlockedMilestoneIds()).thenAnswer((_) async => {'time_1d'});

    final result = await repository.getAllMilestones();

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('should succeed'),
      (milestones) {
        expect(milestones.length, 23);
        final firstDay = milestones.firstWhere((m) => m.id == 'time_1d');
        expect(firstDay.isUnlocked, isTrue);
        final oneWeek = milestones.firstWhere((m) => m.id == 'time_1w');
        expect(oneWeek.isUnlocked, isFalse);
      },
    );
  });

  test('unlockMilestone marks milestone as unlocked', () async {
    when(() => mockDataSource.saveUnlockedMilestone('time_1d', any())).thenAnswer((_) async {});

    final result = await repository.unlockMilestone('time_1d');

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('should succeed'),
      (milestone) {
        expect(milestone.id, 'time_1d');
        expect(milestone.isUnlocked, isTrue);
        expect(milestone.unlockedAt, isNotNull);
      },
    );
  });
}
