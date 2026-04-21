import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/progress_stats.dart';
import '../repositories/progress_repository.dart';

@injectable
class GetProgressStats {
  final ProgressRepository repository;

  GetProgressStats(this.repository);

  Future<Either<Failure, ProgressStats>> call() {
    return repository.getProgressStats();
  }
}