import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_stats.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserStats>> getHomeStats();
  Future<Either<Failure, Unit>> logCraving({required bool wasSmoked});
  Future<Either<Failure, Unit>> saveDailyCheckIn({
    required bool wasSmoked,
    required int cravingLevel,
    String? note,
  });
}
