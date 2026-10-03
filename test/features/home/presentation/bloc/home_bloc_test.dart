import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/core/events/app_event_bus.dart';
import 'package:quitra/features/home/domain/entities/user_stats.dart';
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart';
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart';
import 'package:quitra/features/home/domain/usecases/save_daily_log.dart';
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart';
import 'package:quitra/features/home/presentation/bloc/home_event.dart';
import 'package:quitra/features/home/presentation/bloc/home_state.dart';
import 'package:quitra/features/journey/domain/entities/journey_day.dart';
import 'package:quitra/features/journey/domain/usecases/get_journey_history.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/features/streak/domain/usecases/get_streak.dart';
import 'package:quitra/features/streak/domain/usecases/process_check_in.dart';

import 'package:quitra/features/home/domain/entities/today_check_in_status.dart';
import 'package:quitra/features/home/domain/usecases/get_today_check_in_status.dart';
import 'package:quitra/features/milestones/domain/usecases/check_milestones.dart';

class MockGetHomeStatsUseCase extends Mock implements GetHomeStatsUseCase {}
class MockLogCravingUseCase extends Mock implements LogCravingUseCase {}
class MockSaveDailyLog extends Mock implements SaveDailyLog {}
class MockGetStreak extends Mock implements GetStreak {}
class MockProcessCheckIn extends Mock implements ProcessCheckIn {}
class MockCheckMilestones extends Mock implements CheckMilestones {}
class MockGetTodayCheckInStatus extends Mock implements GetTodayCheckInStatus {}
class MockGetJourneyHistory extends Mock implements GetJourneyHistory {}

void main() {
  late HomeBloc bloc;
  late MockGetHomeStatsUseCase mockStatsUseCase;
  late MockLogCravingUseCase mockCravingUseCase;
  late MockSaveDailyLog mockSaveDailyLog;
  late MockGetStreak mockGetStreak;
  late MockProcessCheckIn mockProcessCheckIn;
  late MockCheckMilestones mockCheckMilestones;
  late MockGetTodayCheckInStatus mockGetTodayCheckInStatus;
  late MockGetJourneyHistory mockGetJourneyHistory;
  late AppEventBus appEventBus;

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

  final List<JourneyDay> mockHistory = [
    JourneyDay(
      date: DateTime(2026, 10, 3),
      status: JourneyStatus.clean,
    ),
  ];

  setUp(() {
    mockStatsUseCase = MockGetHomeStatsUseCase();
    mockCravingUseCase = MockLogCravingUseCase();
    mockSaveDailyLog = MockSaveDailyLog();
    mockGetStreak = MockGetStreak();
    mockProcessCheckIn = MockProcessCheckIn();
    mockCheckMilestones = MockCheckMilestones();
    mockGetTodayCheckInStatus = MockGetTodayCheckInStatus();
    mockGetJourneyHistory = MockGetJourneyHistory();
    appEventBus = AppEventBus();

    when(() => mockGetTodayCheckInStatus()).thenAnswer(
      (_) async => const Right(TodayCheckInStatus(
        hasCheckedIn: false,
        wasSmoked: false,
        cravingLevel: 1,
        notesCount: 0,
      )),
    );
    when(() => mockGetJourneyHistory()).thenAnswer((_) async => Right(mockHistory));

    bloc = HomeBloc(
      mockStatsUseCase,
      mockCravingUseCase,
      mockSaveDailyLog,
      mockGetStreak,
      mockProcessCheckIn,
      mockCheckMilestones,
      mockGetTodayCheckInStatus,
      mockGetJourneyHistory,
      appEventBus,
    );
  });

  tearDown(() {
    bloc.close();
    appEventBus.dispose();
  });

  test('initial state is HomeState.initial()', () {
    expect(bloc.state, const HomeState.initial());
  });

  test('LoadStats emits [Loading, Loaded] when stats, streak, and history succeed', () async {
    when(() => mockStatsUseCase()).thenAnswer((_) async => const Right(mockStats));
    when(() => mockGetStreak()).thenAnswer((_) async => const Right(mockStreak));

    final expectedStates = [
      const HomeState.loading(),
      HomeState.loaded(
        stats: mockStats,
        streak: mockStreak,
        journeyHistory: mockHistory,
        todayStatus: const TodayCheckInStatus(
          hasCheckedIn: false,
          wasSmoked: false,
          cravingLevel: 1,
          notesCount: 0,
        ),
      ),
    ];

    expectLater(bloc.stream, emitsInOrder(expectedStates));
    bloc.add(const HomeEvent.loadStats());
  });

  test('AppendNote saves daily log, emits NoteAddedEvent, and reloads stats', () async {
    registerFallbackValue(
      SaveDailyLogParams(
        wasSmoked: false,
        cravingLevel: 1,
      ),
    );

    when(() => mockGetTodayCheckInStatus()).thenAnswer(
      (_) async => const Right(TodayCheckInStatus(
        hasCheckedIn: true,
        wasSmoked: false,
        cravingLevel: 2,
        notesCount: 1,
      )),
    );
    when(() => mockSaveDailyLog(any())).thenAnswer((_) async => const Right(unit));
    when(() => mockStatsUseCase()).thenAnswer((_) async => const Right(mockStats));
    when(() => mockGetStreak()).thenAnswer((_) async => const Right(mockStreak));

    expectLater(
      appEventBus.on<NoteAddedEvent>(),
      emits(isA<NoteAddedEvent>()),
    );

    bloc.add(const HomeEvent.appendNote(note: 'Felt stronger today'));

    await untilCalled(() => mockSaveDailyLog(any()));

    verify(
      () => mockSaveDailyLog(
        any(
          that: isA<SaveDailyLogParams>()
              .having((p) => p.wasSmoked, 'wasSmoked', isFalse)
              .having((p) => p.cravingLevel, 'cravingLevel', 2)
              .having((p) => p.note, 'note', 'Felt stronger today'),
        ),
      ),
    ).called(1);
  });

  test('LogCraving emits CheckInUpdatedEvent to AppEventBus', () async {
    when(() => mockCravingUseCase(wasSmoked: any(named: 'wasSmoked')))
        .thenAnswer((_) async => const Right(unit));
    when(() => mockProcessCheckIn(wasSmoked: any(named: 'wasSmoked')))
        .thenAnswer((_) async => const Right(ProcessCheckInResult(streak: mockStreak, wasForgiven: false)));
    when(() => mockStatsUseCase()).thenAnswer((_) async => const Right(mockStats));
    when(() => mockGetStreak()).thenAnswer((_) async => const Right(mockStreak));

    expectLater(
      appEventBus.on<CheckInUpdatedEvent>(),
      emits(const CheckInUpdatedEvent(wasSmoked: true)),
    );

    bloc.add(const HomeEvent.logCraving(wasSmoked: true));
  });

  test('External JourneyDayUpdatedEvent triggers LoadStats on HomeBloc', () async {
    when(() => mockStatsUseCase()).thenAnswer((_) async => const Right(mockStats));
    when(() => mockGetStreak()).thenAnswer((_) async => const Right(mockStreak));

    final expectedStates = [
      const HomeState.loading(),
      HomeState.loaded(
        stats: mockStats,
        streak: mockStreak,
        journeyHistory: mockHistory,
        todayStatus: const TodayCheckInStatus(
          hasCheckedIn: false,
          wasSmoked: false,
          cravingLevel: 1,
          notesCount: 0,
        ),
      ),
    ];

    expectLater(bloc.stream, emitsInOrder(expectedStates));
    appEventBus.emit(JourneyDayUpdatedEvent(date: DateTime(2026, 10, 3)));
  });
}
