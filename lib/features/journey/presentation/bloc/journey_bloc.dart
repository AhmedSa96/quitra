import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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

  JourneyBloc(
    this.getJourneyHistory,
    this.updateJourneyDay,
    this.addJourneyNote,
  ) : super(const JourneyState.initial()) {
    on<LoadHistory>(_onLoadHistory);
    on<UpdateDay>(_onUpdateDay);
    on<AddNote>(_onAddNote);
  }

  Future<void> _onLoadHistory(
    LoadHistory event,
    Emitter<JourneyState> emit,
  ) async {
    emit(const JourneyState.loading());
    final result = await getJourneyHistory();
    result.fold(
      (failure) => emit(const JourneyState.error('Failed to load history')),
      (history) => emit(JourneyState.loaded(history)),
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
      (_) => add(const JourneyEvent.loadHistory()),
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
      (_) => add(const JourneyEvent.loadHistory()),
    );
  }
}
