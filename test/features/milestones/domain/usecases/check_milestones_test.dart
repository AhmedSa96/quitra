import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';
import 'package:quitra/features/milestones/domain/repositories/milestone_repository.dart';
import 'package:quitra/features/milestones/domain/usecases/check_milestones.dart';

class MockMilestoneRepository extends Mock implements MilestoneRepository {}

void main() {
  late MockMilestoneRepository repository;
  late CheckMilestones useCase;

  setUp(() {
    repository = MockMilestoneRepository();
    useCase = CheckMilestones(repository);
  });

  test('unlocks milestone when threshold met and was locked', () async {
    const lockedMilestone = Milestone(
      id: 'time_1d',
      titleKey: 'title',
      descriptionKey: 'desc',
      category: MilestoneCategory.time,
      iconName: 'icon',
      threshold: 1,
      isUnlocked: false,
    );

    const unlockedMilestone = Milestone(
      id: 'time_1d',
      titleKey: 'title',
      descriptionKey: 'desc',
      category: MilestoneCategory.time,
      iconName: 'icon',
      threshold: 1,
      isUnlocked: true,
    );

    when(() => repository.getAllMilestones()).thenAnswer((_) async => const Right([lockedMilestone]));
    when(() => repository.unlockMilestone('time_1d')).thenAnswer((_) async => const Right(unlockedMilestone));

    final result = await useCase(
      daysSmokeFree: 1,
      moneySaved: 5.0,
      currentStreak: 1,
      cravingsResisted: 0,
      totalCheckIns: 1,
      heartProgress: 0.1,
      circulationProgress: 0.1,
      lungProgress: 0.1,
    );

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('should succeed'),
      (newlyUnlocked) {
        expect(newlyUnlocked.length, 1);
        expect(newlyUnlocked.first.id, 'time_1d');
      },
    );
    verify(() => repository.unlockMilestone('time_1d')).called(1);
  });

  test('does not unlock already unlocked milestone', () async {
    const alreadyUnlocked = Milestone(
      id: 'time_1d',
      titleKey: 'title',
      descriptionKey: 'desc',
      category: MilestoneCategory.time,
      iconName: 'icon',
      threshold: 1,
      isUnlocked: true,
    );

    when(() => repository.getAllMilestones()).thenAnswer((_) async => const Right([alreadyUnlocked]));

    final result = await useCase(
      daysSmokeFree: 5,
      moneySaved: 50.0,
      currentStreak: 5,
      cravingsResisted: 2,
      totalCheckIns: 5,
      heartProgress: 0.5,
      circulationProgress: 0.5,
      lungProgress: 0.5,
    );

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('should succeed'),
      (newlyUnlocked) {
        expect(newlyUnlocked.isEmpty, isTrue);
      },
    );
    verifyNever(() => repository.unlockMilestone(any()));
  });
}
