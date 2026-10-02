import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/features/streak/domain/repositories/streak_repository.dart';
import 'package:quitra/features/streak/domain/usecases/process_check_in.dart';

class MockStreakRepository extends Mock implements StreakRepository {}

void main() {
  late MockStreakRepository repository;
  late ProcessCheckIn useCase;

  setUp(() {
    repository = MockStreakRepository();
    useCase = ProcessCheckIn(repository);
  });

  test('increments streak when smokeFree is true', () async {
    const streak = Streak(
      currentCount: 2,
      longestCount: 2,
      lastCheckInDate: null,
      mode: StreakMode.strict,
    );
    when(() => repository.incrementStreak()).thenAnswer((_) async => const Right(streak));

    final result = await useCase(wasSmoked: false);

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('should succeed'),
      (res) {
        expect(res.streak.currentCount, 2);
        expect(res.wasForgiven, isFalse);
      },
    );
    verify(() => repository.incrementStreak()).called(1);
    verifyNever(() => repository.resetStreak());
  });

  test('strict mode resets streak when smoked', () async {
    const streak = Streak(
      currentCount: 5,
      longestCount: 5,
      lastCheckInDate: null,
      mode: StreakMode.strict,
    );
    const resetStreak = Streak(
      currentCount: 0,
      longestCount: 5,
      lastCheckInDate: null,
      mode: StreakMode.strict,
    );
    when(() => repository.getStreak()).thenAnswer((_) async => const Right(streak));
    when(() => repository.resetStreak()).thenAnswer((_) async => const Right(resetStreak));

    final result = await useCase(wasSmoked: true);

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('should succeed'),
      (res) {
        expect(res.streak.currentCount, 0);
        expect(res.wasForgiven, isFalse);
      },
    );
    verify(() => repository.resetStreak()).called(1);
  });

  test('forgiving mode uses forgiveness token on first setback of the week', () async {
    const streak = Streak(
      currentCount: 5,
      longestCount: 5,
      lastCheckInDate: null,
      mode: StreakMode.forgiving,
      forgivenessUsedThisWeek: false,
    );
    const forgivenStreak = Streak(
      currentCount: 5,
      longestCount: 5,
      lastCheckInDate: null,
      mode: StreakMode.forgiving,
      forgivenessUsedThisWeek: true,
    );
    when(() => repository.getStreak()).thenAnswer((_) async => const Right(streak));
    when(() => repository.useForgivenessToken()).thenAnswer((_) async => const Right(forgivenStreak));

    final result = await useCase(wasSmoked: true);

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('should succeed'),
      (res) {
        expect(res.streak.currentCount, 5);
        expect(res.wasForgiven, isTrue);
      },
    );
    verify(() => repository.useForgivenessToken()).called(1);
    verifyNever(() => repository.resetStreak());
  });
}
