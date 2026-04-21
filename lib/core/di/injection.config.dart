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
import 'package:quitra/core/di/injection.dart' as _i32;
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart'
    as _i17;
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart'
    as _i19;
import 'package:quitra/features/home/domain/repositories/home_repository.dart'
    as _i18;
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart'
    as _i28;
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart'
    as _i23;
import 'package:quitra/features/home/domain/usecases/save_daily_log.dart'
    as _i26;
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart' as _i30;
import 'package:quitra/features/journey/data/repositories/journey_repository_impl.dart'
    as _i22;
import 'package:quitra/features/journey/domain/repositories/journey_repository.dart'
    as _i21;
import 'package:quitra/features/journey/domain/usecases/get_journey_history.dart'
    as _i29;
import 'package:quitra/features/journey/domain/usecases/update_journey_day.dart'
    as _i27;
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart'
    as _i31;
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart'
    as _i5;
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i7;
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i6;
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart'
    as _i12;
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i24;
import 'package:quitra/features/progress/data/datasources/progress_local_data_source.dart'
    as _i8;
import 'package:quitra/features/progress/data/repositories/progress_repository_impl.dart'
    as _i10;
import 'package:quitra/features/progress/domain/repositories/progress_repository.dart'
    as _i9;
import 'package:quitra/features/progress/domain/usecases/get_progress_stats.dart'
    as _i16;
import 'package:quitra/features/progress/presentation/bloc/progress_bloc.dart'
    as _i25;
import 'package:quitra/features/settings/data/datasources/notification_local_data_source.dart'
    as _i4;
import 'package:quitra/features/settings/data/repositories/data_portability_repository_impl.dart'
    as _i14;
import 'package:quitra/features/settings/domain/repositories/data_portability_repository.dart'
    as _i13;
import 'package:quitra/features/settings/domain/usecases/export_data_use_case.dart'
    as _i15;
import 'package:quitra/features/settings/domain/usecases/import_data_use_case.dart'
    as _i20;
import 'package:quitra/features/settings/presentation/bloc/settings_bloc.dart'
    as _i11;

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
    gh.lazySingleton<_i12.CompleteOnboardingUseCase>(
        () => _i12.CompleteOnboardingUseCase(gh<_i6.OnboardingRepository>()));
    gh.lazySingleton<_i13.DataPortabilityRepository>(
        () => _i14.DataPortabilityRepositoryImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i15.ExportDataUseCase>(
        () => _i15.ExportDataUseCase(gh<_i13.DataPortabilityRepository>()));
    gh.factory<_i16.GetProgressStats>(
        () => _i16.GetProgressStats(gh<_i9.ProgressRepository>()));
    gh.lazySingleton<_i17.HomeLocalDataSource>(
        () => _i17.HomeLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i18.HomeRepository>(
        () => _i19.HomeRepositoryImpl(gh<_i17.HomeLocalDataSource>()));
    gh.lazySingleton<_i20.ImportDataUseCase>(
        () => _i20.ImportDataUseCase(gh<_i13.DataPortabilityRepository>()));
    gh.lazySingleton<_i21.JourneyRepository>(
        () => _i22.JourneyRepositoryImpl(gh<_i17.HomeLocalDataSource>()));
    gh.factory<_i23.LogCravingUseCase>(
        () => _i23.LogCravingUseCase(gh<_i18.HomeRepository>()));
    gh.factory<_i24.OnboardingBloc>(() => _i24.OnboardingBloc(
          gh<_i12.CompleteOnboardingUseCase>(),
          gh<_i20.ImportDataUseCase>(),
        ));
    gh.factory<_i25.ProgressBloc>(
        () => _i25.ProgressBloc(gh<_i16.GetProgressStats>()));
    gh.lazySingleton<_i26.SaveDailyLog>(
        () => _i26.SaveDailyLog(gh<_i18.HomeRepository>()));
    gh.lazySingleton<_i27.UpdateJourneyDay>(
        () => _i27.UpdateJourneyDay(gh<_i21.JourneyRepository>()));
    gh.factory<_i28.GetHomeStatsUseCase>(
        () => _i28.GetHomeStatsUseCase(gh<_i18.HomeRepository>()));
    gh.lazySingleton<_i29.GetJourneyHistory>(
        () => _i29.GetJourneyHistory(gh<_i21.JourneyRepository>()));
    gh.factory<_i30.HomeBloc>(() => _i30.HomeBloc(
          gh<_i28.GetHomeStatsUseCase>(),
          gh<_i23.LogCravingUseCase>(),
          gh<_i26.SaveDailyLog>(),
        ));
    gh.factory<_i31.JourneyBloc>(() => _i31.JourneyBloc(
          gh<_i29.GetJourneyHistory>(),
          gh<_i27.UpdateJourneyDay>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i32.RegisterModule {}

class _$RegisterSettingsModule extends _i32.RegisterSettingsModule {}
