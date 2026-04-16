import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_journey_history.dart';
import 'journey_event.dart';
import 'journey_state.dart';

@injectable
class JourneyBloc extends Bloc<JourneyEvent, JourneyState> {
  final GetJourneyHistory getJourneyHistory;

  JourneyBloc(this.getJourneyHistory) : super(const JourneyState.initial()) {
    on<LoadHistory>(_onLoadHistory);
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
}
