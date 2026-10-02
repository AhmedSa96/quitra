import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/streak.dart';

abstract class StreakRepository {
  Future<Either<Failure, Streak>> getStreak();
  Future<Either<Failure, Streak>> incrementStreak();
  Future<Either<Failure, Streak>> resetStreak();
  Future<Either<Failure, Streak>> updateStreakMode(StreakMode mode);
  Future<Either<Failure, Streak>> useForgivenessToken();
}
