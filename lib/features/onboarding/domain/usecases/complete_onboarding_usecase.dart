import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/onboarding_repository.dart';

@lazySingleton
class CompleteOnboardingUseCase {
  final OnboardingRepository repository;

  CompleteOnboardingUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required int cigarettesPerDay,
    required int yearsSmoking,
    required String quitMethod,
    required DateTime quitStartDate,
  }) async {
    return await repository.completeOnboarding(
      cigarettesPerDay: cigarettesPerDay,
      yearsSmoking: yearsSmoking,
      quitMethod: quitMethod,
      quitStartDate: quitStartDate,
    );
  }
}
