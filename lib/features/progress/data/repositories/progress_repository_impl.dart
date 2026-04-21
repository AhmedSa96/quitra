import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/progress_stats.dart';
import '../../domain/repositories/progress_repository.dart';
import '../datasources/progress_local_data_source.dart';

@LazySingleton(as: ProgressRepository)
class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressLocalDataSource localDataSource;

  ProgressRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, ProgressStats>> getProgressStats() async {
    try {
      final stats = await localDataSource.getProgressStats();
      return Right(stats);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }
}