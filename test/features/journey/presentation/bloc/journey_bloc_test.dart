import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/core/events/app_event_bus.dart';
import 'package:quitra/features/journey/domain/entities/journey_day.dart';
import 'package:quitra/features/journey/domain/usecases/add_journey_note.dart';
import 'package:quitra/features/journey/domain/usecases/get_journey_history.dart';
import 'package:quitra/features/journey/domain/usecases/update_journey_day.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_event.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_state.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';
import 'package:quitra/features/milestones/domain/usecases/get_all_milestones.dart';

class MockGetJourneyHistory extends Mock implements GetJourneyHistory {}
class MockUpdateJourneyDay extends Mock implements UpdateJourneyDay {}
class MockAddJourneyNote extends Mock implements AddJourneyNote {}
class MockGetAllMilestones extends Mock implements GetAllMilestones {}

void main() {
  late JourneyBloc bloc;
  late MockGetJourneyHistory mockGetJourneyHistory;
  late MockUpdateJourneyDay mockUpdateJourneyDay;
  late MockAddJourneyNote mockAddJourneyNote;
  late MockGetAllMilestones mockGetAllMilestones;
  late AppEventBus appEventBus;

  final testDate = DateTime(2026, 10, 3);

  final List<JourneyDay> mockHistory = [
    JourneyDay(
      date: testDate,
      status: JourneyStatus.clean,
    ),
  ];

  final List<Milestone> mockMilestones = [
    const Milestone(
      id: 'm1',
      titleKey: 'title',
      descriptionKey: 'desc',
      category: MilestoneCategory.strength,
      iconName: 'shield',
      threshold: 1,
      isUnlocked: true,
    ),
  ];

  setUp(() {
    mockGetJourneyHistory = MockGetJourneyHistory();
    mockUpdateJourneyDay = MockUpdateJourneyDay();
    mockAddJourneyNote = MockAddJourneyNote();
    mockGetAllMilestones = MockGetAllMilestones();
    appEventBus = AppEventBus();

    when(() => mockGetJourneyHistory(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => Right(mockHistory));
    when(() => mockGetAllMilestones())
        .thenAnswer((_) async => Right(mockMilestones));

    bloc = JourneyBloc(
      mockGetJourneyHistory,
      mockUpdateJourneyDay,
      mockAddJourneyNote,
      mockGetAllMilestones,
      appEventBus,
    );
  });

  tearDown(() {
    bloc.close();
    appEventBus.dispose();
  });

  test('initial state is JourneyState.initial()', () {
    expect(bloc.state, const JourneyState.initial());
  });

  test('LoadHistory loads history and milestones into Loaded state', () async {
    final expectedStates = [
      const JourneyState.loading(),
      JourneyState.loaded(
        history: mockHistory,
        milestones: mockMilestones,
        hasReachedMax: true,
        isLoadingMore: false,
      ),
    ];

    expectLater(bloc.stream, emitsInOrder(expectedStates));
    bloc.add(const JourneyEvent.loadHistory());
  });

  test('LoadMoreHistory appends new days to existing history', () async {
    final secondPageDate = DateTime(2026, 10, 2);
    final secondPageHistory = [
      JourneyDay(date: secondPageDate, status: JourneyStatus.clean),
    ];

    when(() => mockGetJourneyHistory(limit: 20, offset: 0))
        .thenAnswer((_) async => Right(List.generate(20, (i) => JourneyDay(
              date: testDate.subtract(Duration(days: i)),
              status: JourneyStatus.clean,
            ))));
    when(() => mockGetJourneyHistory(limit: 20, offset: 20))
        .thenAnswer((_) async => Right(secondPageHistory));

    // First load initial 20 items
    bloc.add(const JourneyEvent.loadHistory());
    await expectLater(
      bloc.stream,
      emitsThrough(predicate<JourneyState>((s) => s.maybeMap(
            loaded: (l) => l.history.length == 20 && !l.hasReachedMax,
            orElse: () => false,
          ))),
    );

    // Now trigger load more
    bloc.add(const JourneyEvent.loadMoreHistory());
    await expectLater(
      bloc.stream,
      emitsInOrder([
        predicate<JourneyState>((s) => s.maybeMap(
              loaded: (l) => l.isLoadingMore == true,
              orElse: () => false,
            )),
        predicate<JourneyState>((s) => s.maybeMap(
              loaded: (l) =>
                  l.history.length == 21 &&
                  l.hasReachedMax == true &&
                  l.isLoadingMore == false,
              orElse: () => false,
            )),
      ]),
    );
  });

  test('LoadMoreHistory does nothing if hasReachedMax is true', () async {
    // Initial load returns 1 item (< 20), so hasReachedMax is true
    bloc.add(const JourneyEvent.loadHistory());
    await expectLater(
      bloc.stream,
      emitsThrough(predicate<JourneyState>((s) => s.maybeMap(
            loaded: (l) => l.hasReachedMax == true,
            orElse: () => false,
          ))),
    );

    // Call loadMoreHistory - no further states should be emitted
    var emitted = false;
    final sub = bloc.stream.listen((_) => emitted = true);
    bloc.add(const JourneyEvent.loadMoreHistory());
    await Future.delayed(const Duration(milliseconds: 50));
    expect(emitted, false);
    await sub.cancel();
  });

  test('CheckInUpdatedEvent on AppEventBus triggers automatic LoadHistory reload', () async {
    final expectedStates = [
      const JourneyState.loading(),
      JourneyState.loaded(
        history: mockHistory,
        milestones: mockMilestones,
        hasReachedMax: true,
        isLoadingMore: false,
      ),
    ];

    expectLater(bloc.stream, emitsInOrder(expectedStates));
    appEventBus.emit(const CheckInUpdatedEvent(wasSmoked: false));
  });

  test('UpdateDay emits JourneyDayUpdatedEvent to AppEventBus', () async {
    registerFallbackValue(
      UpdateJourneyDayParams(date: testDate),
    );
    when(() => mockUpdateJourneyDay(any()))
        .thenAnswer((_) async => const Right(unit));

    expectLater(
      appEventBus.on<JourneyDayUpdatedEvent>(),
      emits(predicate<JourneyDayUpdatedEvent>((e) => e.date == testDate)),
    );

    bloc.add(JourneyEvent.updateDay(date: testDate, wasSmoked: false));
  });

  test('AddNote emits NoteAddedEvent to AppEventBus', () async {
    registerFallbackValue(
      AddJourneyNoteParams(date: testDate, text: 'test note'),
    );
    when(() => mockAddJourneyNote(any()))
        .thenAnswer((_) async => const Right(unit));

    expectLater(
      appEventBus.on<NoteAddedEvent>(),
      emits(predicate<NoteAddedEvent>((e) => e.date == testDate)),
    );

    bloc.add(JourneyEvent.addNote(date: testDate, text: 'test note'));
  });
}
