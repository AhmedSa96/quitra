import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/core/events/app_event_bus.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';
import 'package:quitra/features/milestones/domain/usecases/get_all_milestones.dart';
import 'package:quitra/features/progress/domain/entities/progress_stats.dart';
import 'package:quitra/features/progress/domain/usecases/get_progress_stats.dart';
import 'package:quitra/features/progress/presentation/bloc/progress_bloc.dart';
import 'package:quitra/features/progress/presentation/bloc/progress_event.dart';
import 'package:quitra/features/progress/presentation/bloc/progress_state.dart';

class MockGetProgressStats extends Mock implements GetProgressStats {}
class MockGetAllMilestones extends Mock implements GetAllMilestones {}

void main() {
  late ProgressBloc bloc;
  late MockGetProgressStats mockGetProgressStats;
  late MockGetAllMilestones mockGetAllMilestones;
  late AppEventBus appEventBus;

  const mockStats = ProgressStats(
    daysSmokeFree: 5,
    heartRateProgress: 0.5,
    circulationProgress: 0.6,
    lungFunctionProgress: 0.7,
    moneySaved: 100.0,
    cigarettesAvoided: 50,
    lifeRegainedMinutes: 550,
    currentStreak: 5,
  );

  final List<Milestone> mockMilestones = [
    const Milestone(
      id: '1',
      titleKey: 'day1',
      descriptionKey: 'day1_desc',
      category: MilestoneCategory.time,
      iconName: 'timer',
      threshold: 1,
      isUnlocked: true,
    ),
  ];

  setUp(() {
    mockGetProgressStats = MockGetProgressStats();
    mockGetAllMilestones = MockGetAllMilestones();
    appEventBus = AppEventBus();

    when(() => mockGetProgressStats())
        .thenAnswer((_) async => const Right(mockStats));
    when(() => mockGetAllMilestones())
        .thenAnswer((_) async => Right(mockMilestones));

    bloc = ProgressBloc(mockGetProgressStats, mockGetAllMilestones, appEventBus);
  });

  tearDown(() {
    bloc.close();
    appEventBus.dispose();
  });

  test('initial state is ProgressState.initial()', () {
    expect(bloc.state, const ProgressState.initial());
  });

  test('LoadProgress loads stats and milestones into Loaded state', () async {
    final expectedStates = [
      const ProgressState.loading(),
      ProgressState.loaded(stats: mockStats, milestones: mockMilestones),
    ];

    expectLater(bloc.stream, emitsInOrder(expectedStates));
    bloc.add(const ProgressEvent.loadProgress());
  });

  test('AppEventBus emission triggers automatic LoadProgress reload', () async {
    final expectedStates = [
      const ProgressState.loading(),
      ProgressState.loaded(stats: mockStats, milestones: mockMilestones),
    ];

    expectLater(bloc.stream, emitsInOrder(expectedStates));
    appEventBus.emit(const CheckInUpdatedEvent(wasSmoked: false));
  });
}
