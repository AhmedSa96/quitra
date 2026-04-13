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
import 'package:quitra/core/di/injection.dart' as _i16;
import 'package:quitra/core/supabase/supabase_module.dart' as _i17;
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart'
    as _i5;
import 'package:quitra/features/home/data/datasources/home_remote_data_source.dart'
    as _i6;
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart'
    as _i8;
import 'package:quitra/features/home/domain/repositories/home_repository.dart'
    as _i7;
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart'
    as _i13;
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart'
    as _i9;
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart' as _i14;
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i11;
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i10;
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart'
    as _i12;
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i15;
import 'package:supabase_flutter/supabase_flutter.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final supabaseModule = _$SupabaseModule();
    gh.singletonAsync<_i3.Isar>(() => registerModule.isar);
    gh.lazySingleton<_i4.SupabaseClient>(() => supabaseModule.supabaseClient);
    gh.lazySingletonAsync<_i5.HomeLocalDataSource>(
        () async => _i5.HomeLocalDataSourceImpl(await getAsync<_i3.Isar>()));
    gh.lazySingleton<_i6.HomeRemoteDataSource>(
        () => _i6.HomeRemoteDataSourceImpl(gh<_i4.SupabaseClient>()));
    gh.lazySingletonAsync<_i7.HomeRepository>(
        () async => _i8.HomeRepositoryImpl(
              gh<_i6.HomeRemoteDataSource>(),
              await getAsync<_i5.HomeLocalDataSource>(),
            ));
    gh.factoryAsync<_i9.LogCravingUseCase>(() async =>
        _i9.LogCravingUseCase(await getAsync<_i7.HomeRepository>()));
    gh.lazySingleton<_i10.OnboardingRepository>(
        () => _i11.OnboardingRepositoryImpl(gh<_i4.SupabaseClient>()));
    gh.lazySingleton<_i12.CompleteOnboardingUseCase>(
        () => _i12.CompleteOnboardingUseCase(gh<_i10.OnboardingRepository>()));
    gh.factoryAsync<_i13.GetHomeStatsUseCase>(() async =>
        _i13.GetHomeStatsUseCase(await getAsync<_i7.HomeRepository>()));
    gh.factoryAsync<_i14.HomeBloc>(() async => _i14.HomeBloc(
          await getAsync<_i13.GetHomeStatsUseCase>(),
          await getAsync<_i9.LogCravingUseCase>(),
        ));
    gh.factory<_i15.OnboardingBloc>(
        () => _i15.OnboardingBloc(gh<_i12.CompleteOnboardingUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}

class _$SupabaseModule extends _i17.SupabaseModule {}
