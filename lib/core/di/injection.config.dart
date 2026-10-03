// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;
import 'package:quitra/core/di/injection.dart' as _i50;
import 'package:quitra/core/events/app_event_bus.dart' as _i3;
import 'package:quitra/core/services/notification_trigger_service.dart' as _i9;
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart'
    as _i30;
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart'
    as _i32;
import 'package:quitra/features/home/domain/repositories/home_repository.dart'
    as _i31;
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart'
    as _i45;
import 'package:quitra/features/home/domain/usecases/get_today_check_in_status.dart'
    as _i47;
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart'
    as _i37;
import 'package:quitra/features/home/domain/usecases/save_daily_log.dart'
    as _i42;
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart' as _i48;
import 'package:quitra/features/journey/data/repositories/journey_repository_impl.dart'
    as _i36;
import 'package:quitra/features/journey/domain/repositories/journey_repository.dart'
    as _i35;
import 'package:quitra/features/journey/domain/usecases/add_journey_note.dart'
    as _i44;
import 'package:quitra/features/journey/domain/usecases/get_journey_history.dart'
    as _i46;
import 'package:quitra/features/journey/domain/usecases/update_journey_day.dart'
    as _i43;
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart'
    as _i49;
import 'package:quitra/features/milestones/data/datasources/milestone_local_data_source.dart'
    as _i5;
import 'package:quitra/features/milestones/data/repositories/milestone_repository_impl.dart'
    as _i7;
import 'package:quitra/features/milestones/domain/repositories/milestone_repository.dart'
    as _i6;
import 'package:quitra/features/milestones/domain/usecases/check_milestones.dart'
    as _i22;
import 'package:quitra/features/milestones/domain/usecases/get_all_milestones.dart'
    as _i27;
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart'
    as _i10;
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i12;
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i11;
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart'
    as _i23;
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i38;
import 'package:quitra/features/progress/data/datasources/progress_local_data_source.dart'
    as _i13;
import 'package:quitra/features/progress/data/repositories/progress_repository_impl.dart'
    as _i15;
import 'package:quitra/features/progress/domain/repositories/progress_repository.dart'
    as _i14;
import 'package:quitra/features/progress/domain/usecases/get_progress_stats.dart'
    as _i28;
import 'package:quitra/features/progress/presentation/bloc/progress_bloc.dart'
    as _i40;
import 'package:quitra/features/settings/data/datasources/notification_local_data_source.dart'
    as _i8;
import 'package:quitra/features/settings/data/repositories/data_portability_repository_impl.dart'
    as _i25;
import 'package:quitra/features/settings/domain/repositories/data_portability_repository.dart'
    as _i24;
import 'package:quitra/features/settings/domain/usecases/export_data_use_case.dart'
    as _i26;
import 'package:quitra/features/settings/domain/usecases/import_data_use_case.dart'
    as _i33;
import 'package:quitra/features/settings/presentation/bloc/settings_bloc.dart'
    as _i16;
import 'package:quitra/features/streak/data/datasources/streak_local_data_source.dart'
    as _i17;
import 'package:quitra/features/streak/data/repositories/streak_repository_impl.dart'
    as _i19;
import 'package:quitra/features/streak/domain/repositories/streak_repository.dart'
    as _i18;
import 'package:quitra/features/streak/domain/usecases/get_streak.dart' as _i29;
import 'package:quitra/features/streak/domain/usecases/increment_streak.dart'
    as _i34;
import 'package:quitra/features/streak/domain/usecases/process_check_in.dart'
    as _i39;
import 'package:quitra/features/streak/domain/usecases/reset_streak.dart'
    as _i41;
import 'package:quitra/features/streak/domain/usecases/update_streak_mode.dart'
    as _i20;
import 'package:quitra/features/streak/domain/usecases/use_forgiveness_token.dart'
    as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final registerSettingsModule = _$RegisterSettingsModule();
    gh.lazySingleton<_i3.AppEventBus>(() => _i3.AppEventBus());
    await gh.singletonAsync<_i4.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i5.MilestoneLocalDataSource>(
        () => _i5.MilestoneLocalDataSourceImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i6.MilestoneRepository>(
        () => _i7.MilestoneRepositoryImpl(gh<_i5.MilestoneLocalDataSource>()));
    gh.lazySingleton<_i8.NotificationLocalDataSource>(
        () => _i8.NotificationLocalDataSourceImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i9.NotificationTriggerService>(() =>
        _i9.NotificationTriggerService(gh<_i8.NotificationLocalDataSource>()));
    gh.lazySingleton<_i10.OnboardingLocalDataSource>(
        () => _i10.OnboardingLocalDataSourceImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i11.OnboardingRepository>(() =>
        _i12.OnboardingRepositoryImpl(gh<_i10.OnboardingLocalDataSource>()));
    gh.lazySingleton<_i13.ProgressLocalDataSource>(
        () => _i13.ProgressLocalDataSourceImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i14.ProgressRepository>(
        () => _i15.ProgressRepositoryImpl(gh<_i13.ProgressLocalDataSource>()));
    gh.factory<_i16.SettingsBloc>(() => registerSettingsModule.settingsBloc);
    gh.lazySingleton<_i17.StreakLocalDataSource>(
        () => _i17.StreakLocalDataSourceImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i18.StreakRepository>(
        () => _i19.StreakRepositoryImpl(gh<_i17.StreakLocalDataSource>()));
    gh.lazySingleton<_i20.UpdateStreakMode>(
        () => _i20.UpdateStreakMode(gh<_i18.StreakRepository>()));
    gh.lazySingleton<_i21.UseForgivenessToken>(
        () => _i21.UseForgivenessToken(gh<_i18.StreakRepository>()));
    gh.lazySingleton<_i22.CheckMilestones>(
        () => _i22.CheckMilestones(gh<_i6.MilestoneRepository>()));
    gh.lazySingleton<_i23.CompleteOnboardingUseCase>(
        () => _i23.CompleteOnboardingUseCase(gh<_i11.OnboardingRepository>()));
    gh.lazySingleton<_i24.DataPortabilityRepository>(
        () => _i25.DataPortabilityRepositoryImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i26.ExportDataUseCase>(
        () => _i26.ExportDataUseCase(gh<_i24.DataPortabilityRepository>()));
    gh.lazySingleton<_i27.GetAllMilestones>(
        () => _i27.GetAllMilestones(gh<_i6.MilestoneRepository>()));
    gh.factory<_i28.GetProgressStats>(
        () => _i28.GetProgressStats(gh<_i14.ProgressRepository>()));
    gh.lazySingleton<_i29.GetStreak>(
        () => _i29.GetStreak(gh<_i18.StreakRepository>()));
    gh.lazySingleton<_i30.HomeLocalDataSource>(
        () => _i30.HomeLocalDataSourceImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i31.HomeRepository>(
        () => _i32.HomeRepositoryImpl(gh<_i30.HomeLocalDataSource>()));
    gh.lazySingleton<_i33.ImportDataUseCase>(
        () => _i33.ImportDataUseCase(gh<_i24.DataPortabilityRepository>()));
    gh.lazySingleton<_i34.IncrementStreak>(
        () => _i34.IncrementStreak(gh<_i18.StreakRepository>()));
    gh.lazySingleton<_i35.JourneyRepository>(
        () => _i36.JourneyRepositoryImpl(gh<_i30.HomeLocalDataSource>()));
    gh.factory<_i37.LogCravingUseCase>(
        () => _i37.LogCravingUseCase(gh<_i31.HomeRepository>()));
    gh.factory<_i38.OnboardingBloc>(() => _i38.OnboardingBloc(
          gh<_i23.CompleteOnboardingUseCase>(),
          gh<_i33.ImportDataUseCase>(),
        ));
    gh.lazySingleton<_i39.ProcessCheckIn>(
        () => _i39.ProcessCheckIn(gh<_i18.StreakRepository>()));
    gh.factory<_i40.ProgressBloc>(() => _i40.ProgressBloc(
          gh<_i28.GetProgressStats>(),
          gh<_i27.GetAllMilestones>(),
          gh<_i3.AppEventBus>(),
        ));
    gh.lazySingleton<_i41.ResetStreak>(
        () => _i41.ResetStreak(gh<_i18.StreakRepository>()));
    gh.lazySingleton<_i42.SaveDailyLog>(
        () => _i42.SaveDailyLog(gh<_i31.HomeRepository>()));
    gh.lazySingleton<_i43.UpdateJourneyDay>(
        () => _i43.UpdateJourneyDay(gh<_i35.JourneyRepository>()));
    gh.lazySingleton<_i44.AddJourneyNote>(
        () => _i44.AddJourneyNote(gh<_i35.JourneyRepository>()));
    gh.factory<_i45.GetHomeStatsUseCase>(
        () => _i45.GetHomeStatsUseCase(gh<_i31.HomeRepository>()));
    gh.lazySingleton<_i46.GetJourneyHistory>(
        () => _i46.GetJourneyHistory(gh<_i35.JourneyRepository>()));
    gh.factory<_i47.GetTodayCheckInStatus>(
        () => _i47.GetTodayCheckInStatus(gh<_i31.HomeRepository>()));
    gh.factory<_i48.HomeBloc>(() => _i48.HomeBloc(
          gh<_i45.GetHomeStatsUseCase>(),
          gh<_i37.LogCravingUseCase>(),
          gh<_i42.SaveDailyLog>(),
          gh<_i29.GetStreak>(),
          gh<_i39.ProcessCheckIn>(),
          gh<_i22.CheckMilestones>(),
          gh<_i47.GetTodayCheckInStatus>(),
          gh<_i46.GetJourneyHistory>(),
          gh<_i3.AppEventBus>(),
        ));
    gh.factory<_i49.JourneyBloc>(() => _i49.JourneyBloc(
          gh<_i46.GetJourneyHistory>(),
          gh<_i43.UpdateJourneyDay>(),
          gh<_i44.AddJourneyNote>(),
          gh<_i27.GetAllMilestones>(),
          gh<_i3.AppEventBus>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i50.RegisterModule {}

class _$RegisterSettingsModule extends _i50.RegisterSettingsModule {}
