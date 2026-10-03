import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:quitra/features/onboarding/data/models/user_profile_isar.dart';
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';

class MockOnboardingLocalDataSource extends Mock implements OnboardingLocalDataSource {}

void main() {
  late MockOnboardingLocalDataSource mockLocalDataSource;
  late OnboardingRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(UserProfileIsar());
  });

  setUp(() {
    mockLocalDataSource = MockOnboardingLocalDataSource();
    repository = OnboardingRepositoryImpl(mockLocalDataSource);
  });

  final testDate = DateTime(2026, 1, 1);

  test('completeOnboarding saves user profile and streak mode to localDataSource', () async {
    when(() => mockLocalDataSource.saveUserProfile(any())).thenAnswer((_) async {});
    when(() => mockLocalDataSource.saveStreakMode(any())).thenAnswer((_) async {});

    final result = await repository.completeOnboarding(
      cigarettesPerDay: 20,
      yearsSmoking: 10,
      quitMethod: 'cold_turkey',
      quitStartDate: testDate,
      streakMode: StreakMode.strict,
    );

    expect(result.isRight(), isTrue);
    verify(() => mockLocalDataSource.saveUserProfile(any())).called(1);
    verify(() => mockLocalDataSource.saveStreakMode(StreakMode.strict.index)).called(1);
  });
}
