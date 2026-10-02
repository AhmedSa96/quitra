import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/home/domain/entities/user_stats.dart';
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart';
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart';
import 'package:quitra/features/home/domain/usecases/save_daily_log.dart';
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart';
import 'package:quitra/features/home/presentation/bloc/home_event.dart';
import 'package:quitra/features/home/presentation/bloc/home_state.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/features/streak/domain/usecases/get_streak.dart';
import 'package:quitra/features/streak/domain/usecases/process_check_in.dart';

import 'package:quitra/features/milestones/domain/usecases/check_milestones.dart';

class MockGetHomeStatsUseCase extends Mock implements GetHomeStatsUseCase {}
class MockLogCravingUseCase extends Mock implements LogCravingUseCase {}
class MockSaveDailyLog extends Mock implements SaveDailyLog {}
class MockGetStreak extends Mock implements GetStreak {}
class MockProcessCheckIn extends Mock implements ProcessCheckIn {}
class MockCheckMilestones extends Mock implements CheckMilestones {}

void main() {
  late HomeBloc bloc;
  late MockGetHomeStatsUseCase mockStatsUseCase;
  late MockLogCravingUseCase mockCravingUseCase;
  late MockSaveDailyLog mockSaveDailyLog;
  late MockGetStreak mockGetStreak;
  late MockProcessCheckIn mockProcessCheckIn;
  late MockCheckMilestones mockCheckMilestones;

  const mockStats = UserStats(
    daysSmokeFree: 10,
    cigarettesAvoided: 100,
    moneySaved: 50.0,
    cravingsLogged: 5,
  );

  const mockStreak = Streak(
    currentCount: 3,
    longestCount: 5,
    lastCheckInDate: null,
    mode: StreakMode.strict,
  );

  setUp(() {
    mockStatsUseCase = MockGetHomeStatsUseCase();
    mockCravingUseCase = MockLogCravingUseCase();
    mockSaveDailyLog = MockSaveDailyLog();
    mockGetStreak = MockGetStreak();
    mockProcessCheckIn = MockProcessCheckIn();
    mockCheckMilestones = MockCheckMilestones();

    bloc = HomeBloc(
      mockStatsUseCase,
      mockCravingUseCase,
      mockSaveDailyLog,
      mockGetStreak,
      mockProcessCheckIn,
      mockCheckMilestones,
    );
  });

  test('initial state is HomeState.initial()', () {
    expect(bloc.state, const HomeState.initial());
  });

  test('LoadStats emits [Loading, Loaded] when stats and streak succeed', () async {
    when(() => mockStatsUseCase()).thenAnswer((_) async => const Right(mockStats));
    when(() => mockGetStreak()).thenAnswer((_) async => const Right(mockStreak));

    final expectedStates = [
      const HomeState.loading(),
      const HomeState.loaded(stats: mockStats, streak: mockStreak),
    ];

    expectLater(bloc.stream, emitsInOrder(expectedStates));
    bloc.add(const HomeEvent.loadStats());
  });
}
