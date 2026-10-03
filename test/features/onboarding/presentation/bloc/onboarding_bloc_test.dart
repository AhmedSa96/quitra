import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:quitra/features/settings/domain/usecases/import_data_use_case.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';

class MockCompleteOnboardingUseCase extends Mock implements CompleteOnboardingUseCase {}
class MockImportDataUseCase extends Mock implements ImportDataUseCase {}

void main() {
  late MockCompleteOnboardingUseCase mockCompleteOnboarding;
  late MockImportDataUseCase mockImportData;
  late OnboardingBloc bloc;

  setUpAll(() {
    registerFallbackValue(StreakMode.forgiving);
  });

  setUp(() {
    mockCompleteOnboarding = MockCompleteOnboardingUseCase();
    mockImportData = MockImportDataUseCase();
    bloc = OnboardingBloc(mockCompleteOnboarding, mockImportData);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state is OnboardingState.initial', () {
    expect(bloc.state, const OnboardingState.initial());
  });

  final testDate = DateTime(2026, 1, 1);

  test('emits [loading, success] when completeOnboarding succeeds with streakMode', () async {
    when(() => mockCompleteOnboarding(
          cigarettesPerDay: any(named: 'cigarettesPerDay'),
          yearsSmoking: any(named: 'yearsSmoking'),
          quitMethod: any(named: 'quitMethod'),
          quitStartDate: any(named: 'quitStartDate'),
          cigarettePrice: any(named: 'cigarettePrice'),
          packetPrice: any(named: 'packetPrice'),
          cigarettesPerPacket: any(named: 'cigarettesPerPacket'),
          streakMode: any(named: 'streakMode'),
        )).thenAnswer((_) async => const Right(unit));

    expectLater(
      bloc.stream,
      emitsInOrder([
        const OnboardingState.loading(),
        const OnboardingState.success(),
      ]),
    );

    bloc.add(OnboardingStarted(
      cigarettesPerDay: 10,
      yearsSmoking: 5,
      quitMethod: 'cold_turkey',
      quitStartDate: testDate,
      streakMode: StreakMode.forgiving,
    ));

    await untilCalled(() => mockCompleteOnboarding(
          cigarettesPerDay: 10,
          yearsSmoking: 5,
          quitMethod: 'cold_turkey',
          quitStartDate: testDate,
          cigarettePrice: null,
          packetPrice: null,
          cigarettesPerPacket: null,
          streakMode: StreakMode.forgiving,
        ));
  });
}
