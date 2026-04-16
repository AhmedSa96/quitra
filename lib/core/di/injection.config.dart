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
import 'package:quitra/core/di/injection.dart' as _i20;
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart'
    as _i8;
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart'
    as _i10;
import 'package:quitra/features/home/domain/repositories/home_repository.dart'
    as _i9;
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart'
    as _i16;
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart'
    as _i13;
import 'package:quitra/features/home/domain/usecases/save_daily_log.dart'
    as _i15;
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart' as _i18;
import 'package:quitra/features/journey/data/repositories/journey_repository_impl.dart'
    as _i12;
import 'package:quitra/features/journey/domain/repositories/journey_repository.dart'
    as _i11;
import 'package:quitra/features/journey/domain/usecases/get_journey_history.dart'
    as _i17;
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart'
    as _i19;
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart'
    as _i4;
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i6;
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i5;
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart'
    as _i7;
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i14;

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
    gh.lazySingleton<_i7.CompleteOnboardingUseCase>(
        () => _i7.CompleteOnboardingUseCase(gh<_i5.OnboardingRepository>()));
    gh.lazySingleton<_i8.HomeLocalDataSource>(
        () => _i8.HomeLocalDataSourceImpl(gh<_i3.Isar>()));
    gh.lazySingleton<_i9.HomeRepository>(
        () => _i10.HomeRepositoryImpl(gh<_i8.HomeLocalDataSource>()));
    gh.lazySingleton<_i11.JourneyRepository>(
        () => _i12.JourneyRepositoryImpl(gh<_i8.HomeLocalDataSource>()));
    gh.factory<_i13.LogCravingUseCase>(
        () => _i13.LogCravingUseCase(gh<_i9.HomeRepository>()));
    gh.factory<_i14.OnboardingBloc>(
        () => _i14.OnboardingBloc(gh<_i7.CompleteOnboardingUseCase>()));
    gh.lazySingleton<_i15.SaveDailyLog>(
        () => _i15.SaveDailyLog(gh<_i9.HomeRepository>()));
    gh.factory<_i16.GetHomeStatsUseCase>(
        () => _i16.GetHomeStatsUseCase(gh<_i9.HomeRepository>()));
    gh.lazySingleton<_i17.GetJourneyHistory>(
        () => _i17.GetJourneyHistory(gh<_i11.JourneyRepository>()));
    gh.factory<_i18.HomeBloc>(() => _i18.HomeBloc(
          gh<_i16.GetHomeStatsUseCase>(),
          gh<_i13.LogCravingUseCase>(),
          gh<_i15.SaveDailyLog>(),
        ));
    gh.factory<_i19.JourneyBloc>(
        () => _i19.JourneyBloc(gh<_i17.GetJourneyHistory>()));
    return this;
  }
}

class _$RegisterModule extends _i20.RegisterModule {}
