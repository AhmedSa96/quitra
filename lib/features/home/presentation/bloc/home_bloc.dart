import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_home_stats_usecase.dart';
import '../../domain/usecases/log_craving_usecase.dart';
import '../../domain/usecases/save_daily_log.dart';
import '../../../streak/domain/usecases/get_streak.dart';
import '../../../streak/domain/usecases/process_check_in.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeStatsUseCase getHomeStatsUseCase;
  final LogCravingUseCase logCravingUseCase;
  final SaveDailyLog saveDailyLog;
  final GetStreak getStreak;
  final ProcessCheckIn processCheckIn;

  HomeBloc(
    this.getHomeStatsUseCase,
    this.logCravingUseCase,
    this.saveDailyLog,
    this.getStreak,
    this.processCheckIn,
  ) : super(const HomeState.initial()) {
    on<LoadStats>(_onLoadStats);
    on<LogCraving>(_onLogCraving);
    on<SaveDailyCheckIn>(_onSaveDailyCheckIn);
  }

  Future<void> _onLoadStats(LoadStats event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    final statsResult = await getHomeStatsUseCase();
    final streakResult = await getStreak();

    statsResult.fold(
      (failure) => emit(const HomeState.error('Failed to load stats')),
      (stats) {
        streakResult.fold(
          (failure) => emit(const HomeState.error('Failed to load streak')),
          (streak) => emit(HomeState.loaded(stats: stats, streak: streak)),
        );
      },
    );
  }

  Future<void> _onLogCraving(LogCraving event, Emitter<HomeState> emit) async {
    await logCravingUseCase(wasSmoked: event.wasSmoked);
    if (event.wasSmoked) {
      await processCheckIn(wasSmoked: true);
    }
    add(const HomeEvent.loadStats());
  }

  Future<void> _onSaveDailyCheckIn(
    SaveDailyCheckIn event,
    Emitter<HomeState> emit,
  ) async {
    await saveDailyLog(
      SaveDailyLogParams(
        wasSmoked: event.wasSmoked,
        cravingLevel: event.cravingLevel,
        note: event.note,
      ),
    );
    await processCheckIn(wasSmoked: event.wasSmoked);
    add(const HomeEvent.loadStats());
  }
}
