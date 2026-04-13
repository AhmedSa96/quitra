// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:quitra/core/supabase/supabase_module.dart' as _i255;
import 'package:quitra/features/home/data/repositories/home_repository_impl.dart'
    as _i488;
import 'package:quitra/features/home/domain/repositories/home_repository.dart'
    as _i1016;
import 'package:quitra/features/home/domain/usecases/get_home_stats_usecase.dart'
    as _i863;
import 'package:quitra/features/home/domain/usecases/log_craving_usecase.dart'
    as _i368;
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart' as _i397;
import 'package:quitra/features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i53;
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i535;
import 'package:quitra/features/onboarding/domain/usecases/complete_onboarding_usecase.dart'
    as _i935;
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i579;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final supabaseModule = _$SupabaseModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseModule.supabaseClient);
    gh.lazySingleton<_i1016.HomeRepository>(
      () => _i488.HomeRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i863.GetHomeStatsUseCase>(
      () => _i863.GetHomeStatsUseCase(gh<_i1016.HomeRepository>()),
    );
    gh.factory<_i368.LogCravingUseCase>(
      () => _i368.LogCravingUseCase(gh<_i1016.HomeRepository>()),
    );
    gh.lazySingleton<_i535.OnboardingRepository>(
      () => _i53.OnboardingRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i397.HomeBloc>(
      () => _i397.HomeBloc(
        gh<_i863.GetHomeStatsUseCase>(),
        gh<_i368.LogCravingUseCase>(),
      ),
    );
    gh.lazySingleton<_i935.CompleteOnboardingUseCase>(
      () => _i935.CompleteOnboardingUseCase(gh<_i535.OnboardingRepository>()),
    );
    gh.factory<_i579.OnboardingBloc>(
      () => _i579.OnboardingBloc(gh<_i935.CompleteOnboardingUseCase>()),
    );
    return this;
  }
}

class _$SupabaseModule extends _i255.SupabaseModule {}
