import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/streak.dart';
import '../repositories/streak_repository.dart';

@lazySingleton
class UseForgivenessToken {
  final StreakRepository repository;

  UseForgivenessToken(this.repository);

  Future<Either<Failure, Streak>> call() => repository.useForgivenessToken();
}
