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
import 'package:quitra/core/di/injection.dart' as _i40;
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart'
    as _i23;
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart'
    as _i25;
import 'package:quitra/features/home/domain/repositories/home_repository.dart'
    as _i24;
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart'
    as _i36;
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart'
    as _i30;
import 'package:quitra/features/home/domain/usecases/save_daily_log.dart'
    as _i34;
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart' as _i38;
import 'package:quitra/features/journey/data/repositories/journey_repository_impl.dart'
    as _i29;
import 'package:quitra/features/journey/domain/repositories/journey_repository.dart'
    as _i28;
import 'package:quitra/features/journey/domain/usecases/get_journey_history.dart'
    as _i37;
import 'package:quitra/features/journey/domain/usecases/update_journey_day.dart'
    as _i35;
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart'
    as _i39;
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart'
    as _i5;
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i7;
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i6;
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart'
    as _i17;
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i31;
import 'package:quitra/features/progress/data/datasources/progress_local_data_source.dart'
    as _i8;
import 'package:quitra/features/progress/data/repositories/progress_repository_impl.dart'
    as _i10;
import 'package:quitra/features/progress/domain/repositories/progress_repository.dart'
    as _i9;
import 'package:quitra/features/progress/domain/usecases/get_progress_stats.dart'
    as _i21;
import 'package:quitra/features/progress/presentation/bloc/progress_bloc.dart'
    as _i32;
import 'package:quitra/features/settings/data/datasources/notification_local_data_source.dart'
    as _i4;
import 'package:quitra/features/settings/data/repositories/data_portability_repository_impl.dart'
    as _i19;
import 'package:quitra/features/settings/domain/repositories/data_portability_repository.dart'
    as _i18;
import 'package:quitra/features/settings/domain/usecases/export_data_use_case.dart'
    as _i20;
import 'package:quitra/features/settings/domain/usecases/import_data_use_case.dart'
    as _i26;
import 'package:quitra/features/settings/presentation/bloc/settings_bloc.dart'
    as _i11;
import 'package:quitra/features/streak/data/datasources/streak_local_data_source.dart'
    as _i12;
import 'package:quitra/features/streak/data/repositories/streak_repository_impl.dart'
    as _i14;
import 'package:quitra/features/streak/domain/repositories/streak_repository.dart'
    as _i13;
import 'package:quitra/features/streak/domain/usecases/get_streak.dart' as _i22;
import 'package:quitra/features/streak/domain/usecases/increment_streak.dart'
    as _i27;
import 'package:quitra/features/streak/domain/usecases/reset_streak.dart'
    as _i33;
import 'package:quitra/features/streak/domain/usecases/update_streak_mode.dart'
    as _i15;
import 'package:quitra/features/streak/domain/usecases/use_forgiveness_token.dart'
    as _i16;

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
    gh.lazySingleton<_i4.NotificationLocalDataSource>(
        () => _i4.NotificationLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i5.OnboardingLocalDataSource>(
        () => _i5.OnboardingLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i6.OnboardingRepository>(() =>
        _i7.OnboardingRepositoryImpl(gh<_i5.OnboardingLocalDataSource>()));
    gh.lazySingleton<_i8.ProgressLocalDataSource>(
        () => _i8.ProgressLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i9.ProgressRepository>(
        () => _i10.ProgressRepositoryImpl(gh<_i8.ProgressLocalDataSource>()));
    gh.factory<_i11.SettingsBloc>(() => registerSettingsModule.settingsBloc);
    gh.lazySingleton<_i12.StreakLocalDataSource>(
        () => _i12.StreakLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i13.StreakRepository>(
        () => _i14.StreakRepositoryImpl(gh<_i12.StreakLocalDataSource>()));
    gh.lazySingleton<_i15.UpdateStreakMode>(
        () => _i15.UpdateStreakMode(gh<_i13.StreakRepository>()));
    gh.lazySingleton<_i16.UseForgivenessToken>(
        () => _i16.UseForgivenessToken(gh<_i13.StreakRepository>()));
    gh.lazySingleton<_i17.CompleteOnboardingUseCase>(
        () => _i17.CompleteOnboardingUseCase(gh<_i6.OnboardingRepository>()));
    gh.lazySingleton<_i18.DataPortabilityRepository>(
        () => _i19.DataPortabilityRepositoryImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i20.ExportDataUseCase>(
        () => _i20.ExportDataUseCase(gh<_i18.DataPortabilityRepository>()));
    gh.factory<_i21.GetProgressStats>(
        () => _i21.GetProgressStats(gh<_i9.ProgressRepository>()));
    gh.lazySingleton<_i22.GetStreak>(
        () => _i22.GetStreak(gh<_i13.StreakRepository>()));
    gh.lazySingleton<_i23.HomeLocalDataSource>(
        () => _i23.HomeLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i24.HomeRepository>(
        () => _i25.HomeRepositoryImpl(gh<_i23.HomeLocalDataSource>()));
    gh.lazySingleton<_i26.ImportDataUseCase>(
        () => _i26.ImportDataUseCase(gh<_i18.DataPortabilityRepository>()));
    gh.lazySingleton<_i27.IncrementStreak>(
        () => _i27.IncrementStreak(gh<_i13.StreakRepository>()));
    gh.lazySingleton<_i28.JourneyRepository>(
        () => _i29.JourneyRepositoryImpl(gh<_i23.HomeLocalDataSource>()));
    gh.factory<_i30.LogCravingUseCase>(
        () => _i30.LogCravingUseCase(gh<_i24.HomeRepository>()));
    gh.factory<_i31.OnboardingBloc>(() => _i31.OnboardingBloc(
          gh<_i17.CompleteOnboardingUseCase>(),
          gh<_i26.ImportDataUseCase>(),
        ));
    gh.factory<_i32.ProgressBloc>(
        () => _i32.ProgressBloc(gh<_i21.GetProgressStats>()));
    gh.lazySingleton<_i33.ResetStreak>(
        () => _i33.ResetStreak(gh<_i13.StreakRepository>()));
    gh.lazySingleton<_i34.SaveDailyLog>(
        () => _i34.SaveDailyLog(gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i35.UpdateJourneyDay>(
        () => _i35.UpdateJourneyDay(gh<_i28.JourneyRepository>()));
    gh.factory<_i36.GetHomeStatsUseCase>(
        () => _i36.GetHomeStatsUseCase(gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i37.GetJourneyHistory>(
        () => _i37.GetJourneyHistory(gh<_i28.JourneyRepository>()));
    gh.factory<_i38.HomeBloc>(() => _i38.HomeBloc(
          gh<_i36.GetHomeStatsUseCase>(),
          gh<_i30.LogCravingUseCase>(),
          gh<_i34.SaveDailyLog>(),
        ));
    gh.factory<_i39.JourneyBloc>(() => _i39.JourneyBloc(
          gh<_i37.GetJourneyHistory>(),
          gh<_i35.UpdateJourneyDay>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i40.RegisterModule {}

class _$RegisterSettingsModule extends _i40.RegisterSettingsModule {}
