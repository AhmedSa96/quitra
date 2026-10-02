import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/streak.dart';
import '../repositories/streak_repository.dart';

@lazySingleton
class GetStreak {
  final StreakRepository repository;

  GetStreak(this.repository);

  Future<Either<Failure, Streak>> call() => repository.getStreak();
}
