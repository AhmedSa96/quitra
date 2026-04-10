import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, Unit>> completeOnboarding({
    required int cigarettesPerDay,
    required int yearsSmoking,
    required String quitMethod,
    required DateTime quitStartDate,
  });
  Future<Either<Failure, bool>> isOnboardingCompleted();
}
