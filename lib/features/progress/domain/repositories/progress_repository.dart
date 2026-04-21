import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/progress_stats.dart';

abstract class ProgressRepository {
  Future<Either<Failure, ProgressStats>> getProgressStats();
}