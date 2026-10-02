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
import 'package:quitra/core/di/injection.dart' as _i44;
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart'
    as _i26;
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart'
    as _i28;
import 'package:quitra/features/home/domain/repositories/home_repository.dart'
    as _i27;
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart'
    as _i40;
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart'
    as _i33;
import 'package:quitra/features/home/domain/usecases/save_daily_log.dart'
    as _i38;
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart' as _i42;
import 'package:quitra/features/journey/data/repositories/journey_repository_impl.dart'
    as _i32;
import 'package:quitra/features/journey/domain/repositories/journey_repository.dart'
    as _i31;
import 'package:quitra/features/journey/domain/usecases/get_journey_history.dart'
    as _i41;
import 'package:quitra/features/journey/domain/usecases/update_journey_day.dart'
    as _i39;
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart'
    as _i43;
import 'package:quitra/features/milestones/data/datasources/milestone_local_data_source.dart'
    as _i4;
import 'package:quitra/features/milestones/data/repositories/milestone_repository_impl.dart'
    as _i6;
import 'package:quitra/features/milestones/domain/repositories/milestone_repository.dart'
    as _i5;
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart'
    as _i8;
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i10;
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i9;
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart'
    as _i20;
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i34;
import 'package:quitra/features/progress/data/datasources/progress_local_data_source.dart'
    as _i11;
import 'package:quitra/features/progress/data/repositories/progress_repository_impl.dart'
    as _i13;
import 'package:quitra/features/progress/domain/repositories/progress_repository.dart'
    as _i12;
import 'package:quitra/features/progress/domain/usecases/get_progress_stats.dart'
    as _i24;
import 'package:quitra/features/progress/presentation/bloc/progress_bloc.dart'
    as _i36;
import 'package:quitra/features/settings/data/datasources/notification_local_data_source.dart'
    as _i7;
import 'package:quitra/features/settings/data/repositories/data_portability_repository_impl.dart'
    as _i22;
import 'package:quitra/features/settings/domain/repositories/data_portability_repository.dart'
    as _i21;
import 'package:quitra/features/settings/domain/usecases/export_data_use_case.dart'
    as _i23;
import 'package:quitra/features/settings/domain/usecases/import_data_use_case.dart'
    as _i29;
import 'package:quitra/features/settings/presentation/bloc/settings_bloc.dart'
    as _i14;
import 'package:quitra/features/streak/data/datasources/streak_local_data_source.dart'
    as _i15;
import 'package:quitra/features/streak/data/repositories/streak_repository_impl.dart'
    as _i17;
import 'package:quitra/features/streak/domain/repositories/streak_repository.dart'
    as _i16;
import 'package:quitra/features/streak/domain/usecases/get_streak.dart' as _i25;
import 'package:quitra/features/streak/domain/usecases/increment_streak.dart'
    as _i30;
import 'package:quitra/features/streak/domain/usecases/process_check_in.dart'
    as _i35;
import 'package:quitra/features/streak/domain/usecases/reset_streak.dart'
    as _i37;
import 'package:quitra/features/streak/domain/usecases/update_streak_mode.dart'
    as _i18;
import 'package:quitra/features/streak/domain/usecases/use_forgiveness_token.dart'
    as _i19;

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
    gh.lazySingleton<_i8.OnboardingLocalDataSource>(
        () => _i8.OnboardingLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i9.OnboardingRepository>(() =>
        _i10.OnboardingRepositoryImpl(gh<_i8.OnboardingLocalDataSource>()));
    gh.lazySingleton<_i11.ProgressLocalDataSource>(
        () => _i11.ProgressLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i12.ProgressRepository>(
        () => _i13.ProgressRepositoryImpl(gh<_i11.ProgressLocalDataSource>()));
    gh.factory<_i14.SettingsBloc>(() => registerSettingsModule.settingsBloc);
    gh.lazySingleton<_i15.StreakLocalDataSource>(
        () => _i15.StreakLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i16.StreakRepository>(
        () => _i17.StreakRepositoryImpl(gh<_i15.StreakLocalDataSource>()));
    gh.lazySingleton<_i18.UpdateStreakMode>(
        () => _i18.UpdateStreakMode(gh<_i16.StreakRepository>()));
    gh.lazySingleton<_i19.UseForgivenessToken>(
        () => _i19.UseForgivenessToken(gh<_i16.StreakRepository>()));
    gh.lazySingleton<_i20.CompleteOnboardingUseCase>(
        () => _i20.CompleteOnboardingUseCase(gh<_i9.OnboardingRepository>()));
    gh.lazySingleton<_i21.DataPortabilityRepository>(
        () => _i22.DataPortabilityRepositoryImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i23.ExportDataUseCase>(
        () => _i23.ExportDataUseCase(gh<_i21.DataPortabilityRepository>()));
    gh.factory<_i24.GetProgressStats>(
        () => _i24.GetProgressStats(gh<_i12.ProgressRepository>()));
    gh.lazySingleton<_i25.GetStreak>(
        () => _i25.GetStreak(gh<_i16.StreakRepository>()));
    gh.lazySingleton<_i26.HomeLocalDataSource>(
        () => _i26.HomeLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i27.HomeRepository>(
        () => _i28.HomeRepositoryImpl(gh<_i26.HomeLocalDataSource>()));
    gh.lazySingleton<_i29.ImportDataUseCase>(
        () => _i29.ImportDataUseCase(gh<_i21.DataPortabilityRepository>()));
    gh.lazySingleton<_i30.IncrementStreak>(
        () => _i30.IncrementStreak(gh<_i16.StreakRepository>()));
    gh.lazySingleton<_i31.JourneyRepository>(
        () => _i32.JourneyRepositoryImpl(gh<_i26.HomeLocalDataSource>()));
    gh.factory<_i33.LogCravingUseCase>(
        () => _i33.LogCravingUseCase(gh<_i27.HomeRepository>()));
    gh.factory<_i34.OnboardingBloc>(() => _i34.OnboardingBloc(
          gh<_i20.CompleteOnboardingUseCase>(),
          gh<_i29.ImportDataUseCase>(),
        ));
    gh.lazySingleton<_i35.ProcessCheckIn>(
        () => _i35.ProcessCheckIn(gh<_i16.StreakRepository>()));
    gh.factory<_i36.ProgressBloc>(
        () => _i36.ProgressBloc(gh<_i24.GetProgressStats>()));
    gh.lazySingleton<_i37.ResetStreak>(
        () => _i37.ResetStreak(gh<_i16.StreakRepository>()));
    gh.lazySingleton<_i38.SaveDailyLog>(
        () => _i38.SaveDailyLog(gh<_i27.HomeRepository>()));
    gh.lazySingleton<_i39.UpdateJourneyDay>(
        () => _i39.UpdateJourneyDay(gh<_i31.JourneyRepository>()));
    gh.factory<_i40.GetHomeStatsUseCase>(
        () => _i40.GetHomeStatsUseCase(gh<_i27.HomeRepository>()));
    gh.lazySingleton<_i41.GetJourneyHistory>(
        () => _i41.GetJourneyHistory(gh<_i31.JourneyRepository>()));
    gh.factory<_i42.HomeBloc>(() => _i42.HomeBloc(
          gh<_i40.GetHomeStatsUseCase>(),
          gh<_i33.LogCravingUseCase>(),
          gh<_i38.SaveDailyLog>(),
          gh<_i25.GetStreak>(),
          gh<_i35.ProcessCheckIn>(),
        ));
    gh.factory<_i43.JourneyBloc>(() => _i43.JourneyBloc(
          gh<_i41.GetJourneyHistory>(),
          gh<_i39.UpdateJourneyDay>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i44.RegisterModule {}

class _$RegisterSettingsModule extends _i44.RegisterSettingsModule {}
