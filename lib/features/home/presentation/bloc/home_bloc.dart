import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/today_check_in_status.dart';
import '../../domain/usecases/get_home_stats_usecase.dart';
import '../../domain/usecases/get_today_check_in_status.dart';
import '../../domain/usecases/log_craving_usecase.dart';
import '../../domain/usecases/save_daily_log.dart';
import '../../../streak/domain/usecases/get_streak.dart';
import '../../../streak/domain/usecases/process_check_in.dart';
import '../../../milestones/domain/usecases/check_milestones.dart';
import '../../../milestones/domain/entities/milestone.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeStatsUseCase getHomeStatsUseCase;
  final LogCravingUseCase logCravingUseCase;
  final SaveDailyLog saveDailyLog;
  final GetStreak getStreak;
  final ProcessCheckIn processCheckIn;
  final CheckMilestones checkMilestones;
  final GetTodayCheckInStatus getTodayCheckInStatus;

  HomeBloc(
    this.getHomeStatsUseCase,
    this.logCravingUseCase,
    this.saveDailyLog,
    this.getStreak,
    this.processCheckIn,
    this.checkMilestones,
    this.getTodayCheckInStatus,
  ) : super(const HomeState.initial()) {
    on<LoadStats>(_onLoadStats);
    on<LogCraving>(_onLogCraving);
    on<SaveDailyCheckIn>(_onSaveDailyCheckIn);
  }

  Future<void> _onLoadStats(LoadStats event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    final statsResult = await getHomeStatsUseCase();
    final streakResult = await getStreak();
    final todayStatusResult = await getTodayCheckInStatus();
    final todayStatus = todayStatusResult.getOrElse(() => const TodayCheckInStatus(
          hasCheckedIn: false,
          wasSmoked: false,
          cravingLevel: 1,
          notesCount: 0,
        ));

    statsResult.fold(
      (failure) => emit(const HomeState.error('Failed to load stats')),
      (stats) {
        streakResult.fold(
          (failure) => emit(const HomeState.error('Failed to load streak')),
          (streak) => emit(HomeState.loaded(
            stats: stats,
            streak: streak,
            todayStatus: todayStatus,
          )),
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

    final statsResult = await getHomeStatsUseCase();
    final streakResult = await getStreak();
    final todayStatusResult = await getTodayCheckInStatus();
    final todayStatus = todayStatusResult.fold((_) => null, (status) => status);

    if (statsResult.isRight() && streakResult.isRight()) {
      final stats = statsResult.getOrElse(() => throw Exception());
      final streak = streakResult.getOrElse(() => throw Exception());

      Milestone? unlockedMilestone;
      final checkResult = await checkMilestones(
        daysSmokeFree: stats.daysSmokeFree,
        moneySaved: stats.moneySaved,
        currentStreak: streak.currentCount,
        cravingsResisted: 0,
        totalCheckIns: stats.daysSmokeFree,
        heartProgress: 0.0,
        circulationProgress: 0.0,
        lungProgress: 0.0,
      );

      checkResult.fold((_) {}, (unlockedList) {
        if (unlockedList.isNotEmpty) {
          unlockedMilestone = unlockedList.first;
        }
      });

      emit(HomeState.loaded(
        stats: stats,
        streak: streak,
        newlyUnlockedMilestone: unlockedMilestone,
        todayStatus: todayStatus,
      ));
      return;
    }

    add(const HomeEvent.loadStats());
  }
}
