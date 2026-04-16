import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_home_stats_usecase.dart';
import '../../domain/usecases/log_craving_usecase.dart';
import '../../domain/usecases/save_daily_log.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SaveDailyLog saveDailyLog;
  final GetHomeStatsUseCase getHomeStatsUseCase;
  final LogCravingUseCase logCravingUseCase;

  HomeBloc(this.getHomeStatsUseCase, this.logCravingUseCase, this.saveDailyLog)
    : super(const HomeState.initial()) {
    on<LoadStats>(_onLoadStats);
    on<LogCraving>(_onLogCraving);
    on<SaveDailyCheckIn>(_onSaveDailyCheckIn);
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
    final result = await logCravingUseCase(wasSmoked: event.wasSmoked);
    result.fold(
      (failure) {
        // Handle failure if needed
      },
      (_) {
        add(const HomeEvent.loadStats());
      },
    );
  }

  Future<void> _onSaveDailyCheckIn(
    SaveDailyCheckIn event,
    Emitter<HomeState> emit,
  ) async {
    final result = await saveDailyLog(
      SaveDailyLogParams(
        wasSmoked: event.wasSmoked,
        cravingLevel: event.cravingLevel,
        note: event.note,
      ),
    );

    result.fold(
      (failure) {
        // Handle failure if needed
      },
      (_) {
        add(const HomeEvent.loadStats());
      },
    );
  }
}
