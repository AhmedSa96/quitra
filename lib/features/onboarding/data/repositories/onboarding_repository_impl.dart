import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/onboarding_repository.dart';

@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  final SupabaseClient supabase;

  OnboardingRepositoryImpl(this.supabase);

  @override
  Future<Either<Failure, Unit>> completeOnboarding({
    required int cigarettesPerDay,
    required int yearsSmoking,
    required String quitMethod,
    required DateTime quitStartDate,
  }) async {
    try {
      // 1. Sign in anonymously
      final authResponse = await supabase.auth.signInAnonymously();
      final user = authResponse.user;

      if (user == null) {
        return const Left(Failure.serverError());
      }

      // 2. Save the onboarding data in profiles table
      await supabase.from('profiles').upsert({
        'id': user.id,
        'cigarettes_per_day': cigarettesPerDay,
        'years_smoking': yearsSmoking,
        'quit_method': quitMethod,
        'quit_start_date': quitStartDate.toIso8601String(),
        'onboarding_completed': true,
      });

      return const Right(unit);
    } catch (e) {
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return const Right(false);

      final response = await supabase
          .from('profiles')
          .select('onboarding_completed')
          .eq('id', user.id)
          .maybeSingle();

      if (response == null) return const Right(false);
      return Right(response['onboarding_completed'] as bool? ?? false);
    } catch (e) {
      return const Left(Failure.serverError());
    }
  }
}
