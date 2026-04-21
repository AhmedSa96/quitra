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
import 'package:quitra/core/di/injection.dart' as _i26;
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart'
    as _i12;
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart'
    as _i14;
import 'package:quitra/features/home/domain/repositories/home_repository.dart'
    as _i13;
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart'
    as _i22;
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart'
    as _i17;
import 'package:quitra/features/home/domain/usecases/save_daily_log.dart'
    as _i20;
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart' as _i24;
import 'package:quitra/features/journey/data/repositories/journey_repository_impl.dart'
    as _i16;
import 'package:quitra/features/journey/domain/repositories/journey_repository.dart'
    as _i15;
import 'package:quitra/features/journey/domain/usecases/get_journey_history.dart'
    as _i23;
import 'package:quitra/features/journey/domain/usecases/update_journey_day.dart'
    as _i21;
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart'
    as _i25;
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart'
    as _i4;
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i6;
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i5;
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart'
    as _i10;
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i18;
import 'package:quitra/features/progress/data/datasources/progress_local_data_source.dart'
    as _i7;
import 'package:quitra/features/progress/data/repositories/progress_repository_impl.dart'
    as _i9;
import 'package:quitra/features/progress/domain/repositories/progress_repository.dart'
    as _i8;
import 'package:quitra/features/progress/domain/usecases/get_progress_stats.dart'
    as _i11;
import 'package:quitra/features/progress/presentation/bloc/progress_bloc.dart'
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
    await gh.singletonAsync<_i3.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i4.OnboardingLocalDataSource>(
        () => _i4.OnboardingLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i5.OnboardingRepository>(() =>
        _i6.OnboardingRepositoryImpl(gh<_i4.OnboardingLocalDataSource>()));
    gh.lazySingleton<_i7.ProgressLocalDataSource>(
        () => _i7.ProgressLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i8.ProgressRepository>(
        () => _i9.ProgressRepositoryImpl(gh<_i7.ProgressLocalDataSource>()));
    gh.lazySingleton<_i10.CompleteOnboardingUseCase>(
        () => _i10.CompleteOnboardingUseCase(gh<_i5.OnboardingRepository>()));
    gh.factory<_i11.GetProgressStats>(
        () => _i11.GetProgressStats(gh<_i8.ProgressRepository>()));
    gh.lazySingleton<_i12.HomeLocalDataSource>(
        () => _i12.HomeLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i13.HomeRepository>(
        () => _i14.HomeRepositoryImpl(gh<_i12.HomeLocalDataSource>()));
    gh.lazySingleton<_i15.JourneyRepository>(
        () => _i16.JourneyRepositoryImpl(gh<_i12.HomeLocalDataSource>()));
    gh.factory<_i17.LogCravingUseCase>(
        () => _i17.LogCravingUseCase(gh<_i13.HomeRepository>()));
    gh.factory<_i18.OnboardingBloc>(
        () => _i18.OnboardingBloc(gh<_i10.CompleteOnboardingUseCase>()));
    gh.factory<_i19.ProgressBloc>(
        () => _i19.ProgressBloc(gh<_i11.GetProgressStats>()));
    gh.lazySingleton<_i20.SaveDailyLog>(
        () => _i20.SaveDailyLog(gh<_i13.HomeRepository>()));
    gh.lazySingleton<_i21.UpdateJourneyDay>(
        () => _i21.UpdateJourneyDay(gh<_i15.JourneyRepository>()));
    gh.factory<_i22.GetHomeStatsUseCase>(
        () => _i22.GetHomeStatsUseCase(gh<_i13.HomeRepository>()));
    gh.lazySingleton<_i23.GetJourneyHistory>(
        () => _i23.GetJourneyHistory(gh<_i15.JourneyRepository>()));
    gh.factory<_i24.HomeBloc>(() => _i24.HomeBloc(
          gh<_i22.GetHomeStatsUseCase>(),
          gh<_i17.LogCravingUseCase>(),
          gh<_i20.SaveDailyLog>(),
        ));
    gh.factory<_i25.JourneyBloc>(() => _i25.JourneyBloc(
          gh<_i23.GetJourneyHistory>(),
          gh<_i21.UpdateJourneyDay>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i26.RegisterModule {}
