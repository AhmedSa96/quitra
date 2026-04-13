import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_home_stats_usecase.dart';
import '../../domain/usecases/log_craving_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeStatsUseCase getHomeStatsUseCase;
  final LogCravingUseCase logCravingUseCase;

  HomeBloc(this.getHomeStatsUseCase, this.logCravingUseCase)
    : super(const HomeState.initial()) {
    on<LoadStats>(_onLoadStats);
    on<LogCraving>(_onLogCraving);
  }

  Future<void> _onLoadStats(LoadStats event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    final result = await getHomeStatsUseCase();
    result.fold(
      (failure) => emit(const HomeState.error('Failed to load stats')),
      (stats) => emit(HomeState.loaded(stats)),
    );
  }

  Future<void> _onLogCraving(LogCraving event, Emitter<HomeState> emit) async {
    // Wait for use logic - this does not need to change the states directly
    // from stats loaded. Best would be handling it gracefully.
    final currentState = state;
    final result = await logCravingUseCase();
    result.fold(
      (failure) {
        // Log error or maybe emit error state, let's just stick to what was there.
        if (currentState is Loaded) {
          emit(currentState); // fallback
        }
      },
      (_) {
        if (currentState is Loaded) {
          emit(currentState);
        }
      },
    );
  }
}
