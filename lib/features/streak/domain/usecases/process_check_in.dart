import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/streak.dart';
import '../repositories/streak_repository.dart';

class ProcessCheckInResult {
  final Streak streak;
  final bool wasForgiven;

  const ProcessCheckInResult({
    required this.streak,
    required this.wasForgiven,
  });
}

@lazySingleton
class ProcessCheckIn {
  final StreakRepository repository;

  ProcessCheckIn(this.repository);

  Future<Either<Failure, ProcessCheckInResult>> call({required bool wasSmoked}) async {
    if (!wasSmoked) {
      final incResult = await repository.incrementStreak();
      return incResult.map((streak) => ProcessCheckInResult(streak: streak, wasForgiven: false));
    }

    final currentResult = await repository.getStreak();
    return currentResult.fold(
      (failure) => Left(failure),
      (current) async {
        if (current.mode == StreakMode.forgiving && !current.forgivenessUsedThisWeek) {
          final forgiveResult = await repository.useForgivenessToken();
          return forgiveResult.map((streak) => ProcessCheckInResult(streak: streak, wasForgiven: true));
        } else {
          final resetResult = await repository.resetStreak();
          return resetResult.map((streak) => ProcessCheckInResult(streak: streak, wasForgiven: false));
        }
      },
    );
  }
}
