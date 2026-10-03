import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/events/app_event_bus.dart';
import '../../../milestones/domain/usecases/get_all_milestones.dart';
import '../../domain/usecases/add_journey_note.dart';
import '../../domain/usecases/get_journey_history.dart';
import '../../domain/usecases/update_journey_day.dart';
import 'journey_event.dart';
import 'journey_state.dart';

@injectable
class JourneyBloc extends Bloc<JourneyEvent, JourneyState> {
  final GetJourneyHistory getJourneyHistory;
  final UpdateJourneyDay updateJourneyDay;
  final AddJourneyNote addJourneyNote;
  final GetAllMilestones getAllMilestones;
  final AppEventBus appEventBus;
  StreamSubscription<AppEvent>? _busSubscription;

  JourneyBloc(
    this.getJourneyHistory,
    this.updateJourneyDay,
    this.addJourneyNote,
    this.getAllMilestones,
    this.appEventBus,
  ) : super(const JourneyState.initial()) {
    on<LoadHistory>(_onLoadHistory);
    on<UpdateDay>(_onUpdateDay);
    on<AddNote>(_onAddNote);

    _busSubscription = appEventBus.stream.listen((event) {
      if (event is CheckInUpdatedEvent || event is NoteAddedEvent) {
        add(const JourneyEvent.loadHistory());
      }
    });
  }

  Future<void> _onLoadHistory(
    LoadHistory event,
    Emitter<JourneyState> emit,
  ) async {
    emit(const JourneyState.loading());
    final result = await getJourneyHistory();
    final milestonesResult = await getAllMilestones();

    result.fold(
      (failure) => emit(const JourneyState.error('Failed to load history')),
      (history) {
        final milestones = milestonesResult.getOrElse(() => []);
        emit(JourneyState.loaded(history: history, milestones: milestones));
      },
    );
  }

  Future<void> _onUpdateDay(
    UpdateDay event,
    Emitter<JourneyState> emit,
  ) async {
    final result = await updateJourneyDay(UpdateJourneyDayParams(
      date: event.date,
      wasSmoked: event.wasSmoked,
      cravingLevel: event.cravingLevel,
      note: event.note,
    ));

    result.fold(
      (failure) => emit(const JourneyState.error('Failed to update day')),
      (_) {
        appEventBus.emit(JourneyDayUpdatedEvent(date: event.date));
        add(const JourneyEvent.loadHistory());
      },
    );
  }

  Future<void> _onAddNote(
    AddNote event,
    Emitter<JourneyState> emit,
  ) async {
    final result = await addJourneyNote(AddJourneyNoteParams(
      date: event.date,
      text: event.text,
    ));

    result.fold(
      (failure) => emit(const JourneyState.error('Failed to add note')),
      (_) {
        appEventBus.emit(NoteAddedEvent(date: event.date));
        add(const JourneyEvent.loadHistory());
      },
    );
  }

  @override
  Future<void> close() {
    _busSubscription?.cancel();
    return super.close();
  }
}
