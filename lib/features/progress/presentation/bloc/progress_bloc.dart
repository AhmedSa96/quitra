import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/events/app_event_bus.dart';
import '../../../milestones/domain/usecases/get_all_milestones.dart';
import '../../domain/usecases/get_progress_stats.dart';
import 'progress_event.dart';
import 'progress_state.dart';

@injectable
class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  final GetProgressStats getProgressStats;
  final GetAllMilestones getAllMilestones;
  final AppEventBus appEventBus;
  StreamSubscription<AppEvent>? _busSubscription;

  ProgressBloc(
    this.getProgressStats,
    this.getAllMilestones,
    this.appEventBus,
  ) : super(const ProgressState.initial()) {
    on<LoadProgress>(_onLoadProgress);

    _busSubscription = appEventBus.stream.listen((_) {
      add(const ProgressEvent.loadProgress());
    });
  }

  Future<void> _onLoadProgress(
    LoadProgress event,
    Emitter<ProgressState> emit,
  ) async {
    emit(const ProgressState.loading());

    final statsResult = await getProgressStats();
    final milestonesResult = await getAllMilestones();

    statsResult.fold(
      (failure) => emit(ProgressState.error(failure.toString())),
      (stats) {
        final milestones = milestonesResult.getOrElse(() => []);
        emit(ProgressState.loaded(stats: stats, milestones: milestones));
      },
    );
  }

  @override
  Future<void> close() {
    _busSubscription?.cancel();
    return super.close();
  }
}
