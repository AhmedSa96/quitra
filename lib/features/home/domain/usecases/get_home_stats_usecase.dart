import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_stats.dart';
import '../repositories/home_repository.dart';

@injectable
class GetHomeStatsUseCase {
  final HomeRepository repository;

  GetHomeStatsUseCase(this.repository);

  Future<Either<Failure, UserStats>> call() {
    return repository.getHomeStats();
  }
}
