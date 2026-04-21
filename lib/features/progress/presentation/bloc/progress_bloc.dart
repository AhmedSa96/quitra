import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_progress_stats.dart';
import 'progress_event.dart';
import 'progress_state.dart';

@injectable
class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  final GetProgressStats getProgressStats;

  ProgressBloc(this.getProgressStats) : super(const ProgressState.initial()) {
    on<LoadProgress>(_onLoadProgress);
  }

  Future<void> _onLoadProgress(
    LoadProgress event,
    Emitter<ProgressState> emit,
  ) async {
    emit(const ProgressState.loading());

    final result = await getProgressStats();

    result.fold(
      (failure) => emit(ProgressState.error(failure.toString())),
      (stats) => emit(ProgressState.loaded(stats)),
    );
  }
}
