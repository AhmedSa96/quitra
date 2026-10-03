import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../streak/domain/entities/streak.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, Unit>> completeOnboarding({
    required int cigarettesPerDay,
    required int yearsSmoking,
    required String quitMethod,
    required DateTime quitStartDate,
    double? cigarettePrice,
    double? packetPrice,
    int? cigarettesPerPacket,
    StreakMode streakMode = StreakMode.forgiving,
  });
  Future<Either<Failure, bool>> isOnboardingCompleted();
}
