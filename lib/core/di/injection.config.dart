// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i3;
import 'package:quitra/core/di/injection.dart' as _i46;
import 'package:quitra/core/services/notification_trigger_service.dart' as _i8;
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart'
    as _i28;
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart'
    as _i30;
import 'package:quitra/features/home/domain/repositories/home_repository.dart'
    as _i29;
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart'
    as _i42;
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart'
    as _i35;
import 'package:quitra/features/home/domain/usecases/save_daily_log.dart'
    as _i40;
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart' as _i44;
import 'package:quitra/features/journey/data/repositories/journey_repository_impl.dart'
    as _i34;
import 'package:quitra/features/journey/domain/repositories/journey_repository.dart'
    as _i33;
import 'package:quitra/features/journey/domain/usecases/get_journey_history.dart'
    as _i43;
import 'package:quitra/features/journey/domain/usecases/update_journey_day.dart'
    as _i41;
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart'
    as _i45;
import 'package:quitra/features/milestones/data/datasources/milestone_local_data_source.dart'
    as _i4;
import 'package:quitra/features/milestones/data/repositories/milestone_repository_impl.dart'
    as _i6;
import 'package:quitra/features/milestones/domain/repositories/milestone_repository.dart'
    as _i5;
import 'package:quitra/features/milestones/domain/usecases/check_milestones.dart'
    as _i21;
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart'
    as _i9;
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i11;
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i10;
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart'
    as _i22;
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i36;
import 'package:quitra/features/progress/data/datasources/progress_local_data_source.dart'
    as _i12;
import 'package:quitra/features/progress/data/repositories/progress_repository_impl.dart'
    as _i14;
import 'package:quitra/features/progress/domain/repositories/progress_repository.dart'
    as _i13;
import 'package:quitra/features/progress/domain/usecases/get_progress_stats.dart'
    as _i26;
import 'package:quitra/features/progress/presentation/bloc/progress_bloc.dart'
    as _i38;
import 'package:quitra/features/settings/data/datasources/notification_local_data_source.dart'
    as _i7;
import 'package:quitra/features/settings/data/repositories/data_portability_repository_impl.dart'
    as _i24;
import 'package:quitra/features/settings/domain/repositories/data_portability_repository.dart'
    as _i23;
import 'package:quitra/features/settings/domain/usecases/export_data_use_case.dart'
    as _i25;
import 'package:quitra/features/settings/domain/usecases/import_data_use_case.dart'
    as _i31;
import 'package:quitra/features/settings/presentation/bloc/settings_bloc.dart'
    as _i15;
import 'package:quitra/features/streak/data/datasources/streak_local_data_source.dart'
    as _i16;
import 'package:quitra/features/streak/data/repositories/streak_repository_impl.dart'
    as _i18;
import 'package:quitra/features/streak/domain/repositories/streak_repository.dart'
    as _i17;
import 'package:quitra/features/streak/domain/usecases/get_streak.dart' as _i27;
import 'package:quitra/features/streak/domain/usecases/increment_streak.dart'
    as _i32;
import 'package:quitra/features/streak/domain/usecases/process_check_in.dart'
    as _i37;
import 'package:quitra/features/streak/domain/usecases/reset_streak.dart'
    as _i39;
import 'package:quitra/features/streak/domain/usecases/update_streak_mode.dart'
    as _i19;
import 'package:quitra/features/streak/domain/usecases/use_forgiveness_token.dart'
    as _i20;

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
    await gh.singletonAsync<_i3.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i4.MilestoneLocalDataSource>(
        () => _i4.MilestoneLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i5.MilestoneRepository>(
        () => _i6.MilestoneRepositoryImpl(gh<_i4.MilestoneLocalDataSource>()));
    gh.lazySingleton<_i7.NotificationLocalDataSource>(
        () => _i7.NotificationLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i8.NotificationTriggerService>(() =>
        _i8.NotificationTriggerService(gh<_i7.NotificationLocalDataSource>()));
    gh.lazySingleton<_i9.OnboardingLocalDataSource>(
        () => _i9.OnboardingLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i10.OnboardingRepository>(() =>
        _i11.OnboardingRepositoryImpl(gh<_i9.OnboardingLocalDataSource>()));
    gh.lazySingleton<_i12.ProgressLocalDataSource>(
        () => _i12.ProgressLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i13.ProgressRepository>(
        () => _i14.ProgressRepositoryImpl(gh<_i12.ProgressLocalDataSource>()));
    gh.factory<_i15.SettingsBloc>(() => registerSettingsModule.settingsBloc);
    gh.lazySingleton<_i16.StreakLocalDataSource>(
        () => _i16.StreakLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i17.StreakRepository>(
        () => _i18.StreakRepositoryImpl(gh<_i16.StreakLocalDataSource>()));
    gh.lazySingleton<_i19.UpdateStreakMode>(
        () => _i19.UpdateStreakMode(gh<_i17.StreakRepository>()));
    gh.lazySingleton<_i20.UseForgivenessToken>(
        () => _i20.UseForgivenessToken(gh<_i17.StreakRepository>()));
    gh.lazySingleton<_i21.CheckMilestones>(
        () => _i21.CheckMilestones(gh<_i5.MilestoneRepository>()));
    gh.lazySingleton<_i22.CompleteOnboardingUseCase>(
        () => _i22.CompleteOnboardingUseCase(gh<_i10.OnboardingRepository>()));
    gh.lazySingleton<_i23.DataPortabilityRepository>(
        () => _i24.DataPortabilityRepositoryImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i25.ExportDataUseCase>(
        () => _i25.ExportDataUseCase(gh<_i23.DataPortabilityRepository>()));
    gh.factory<_i26.GetProgressStats>(
        () => _i26.GetProgressStats(gh<_i13.ProgressRepository>()));
    gh.lazySingleton<_i27.GetStreak>(
        () => _i27.GetStreak(gh<_i17.StreakRepository>()));
    gh.lazySingleton<_i28.HomeLocalDataSource>(
        () => _i28.HomeLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i29.HomeRepository>(
        () => _i30.HomeRepositoryImpl(gh<_i28.HomeLocalDataSource>()));
    gh.lazySingleton<_i31.ImportDataUseCase>(
        () => _i31.ImportDataUseCase(gh<_i23.DataPortabilityRepository>()));
    gh.lazySingleton<_i32.IncrementStreak>(
        () => _i32.IncrementStreak(gh<_i17.StreakRepository>()));
    gh.lazySingleton<_i33.JourneyRepository>(
        () => _i34.JourneyRepositoryImpl(gh<_i28.HomeLocalDataSource>()));
    gh.factory<_i35.LogCravingUseCase>(
        () => _i35.LogCravingUseCase(gh<_i29.HomeRepository>()));
    gh.factory<_i36.OnboardingBloc>(() => _i36.OnboardingBloc(
          gh<_i22.CompleteOnboardingUseCase>(),
          gh<_i31.ImportDataUseCase>(),
        ));
    gh.lazySingleton<_i37.ProcessCheckIn>(
        () => _i37.ProcessCheckIn(gh<_i17.StreakRepository>()));
    gh.factory<_i38.ProgressBloc>(
        () => _i38.ProgressBloc(gh<_i26.GetProgressStats>()));
    gh.lazySingleton<_i39.ResetStreak>(
        () => _i39.ResetStreak(gh<_i17.StreakRepository>()));
    gh.lazySingleton<_i40.SaveDailyLog>(
        () => _i40.SaveDailyLog(gh<_i29.HomeRepository>()));
    gh.lazySingleton<_i41.UpdateJourneyDay>(
        () => _i41.UpdateJourneyDay(gh<_i33.JourneyRepository>()));
    gh.factory<_i42.GetHomeStatsUseCase>(
        () => _i42.GetHomeStatsUseCase(gh<_i29.HomeRepository>()));
    gh.lazySingleton<_i43.GetJourneyHistory>(
        () => _i43.GetJourneyHistory(gh<_i33.JourneyRepository>()));
    gh.factory<_i44.HomeBloc>(() => _i44.HomeBloc(
          gh<_i42.GetHomeStatsUseCase>(),
          gh<_i35.LogCravingUseCase>(),
          gh<_i40.SaveDailyLog>(),
          gh<_i27.GetStreak>(),
          gh<_i37.ProcessCheckIn>(),
          gh<_i21.CheckMilestones>(),
        ));
    gh.factory<_i45.JourneyBloc>(() => _i45.JourneyBloc(
          gh<_i43.GetJourneyHistory>(),
          gh<_i41.UpdateJourneyDay>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i46.RegisterModule {}

class _$RegisterSettingsModule extends _i46.RegisterSettingsModule {}
