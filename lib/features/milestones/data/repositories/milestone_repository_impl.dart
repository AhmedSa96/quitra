import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/milestone.dart';
import '../../domain/repositories/milestone_repository.dart';
import '../datasources/milestone_local_data_source.dart';
import '../milestone_definitions.dart';

@LazySingleton(as: MilestoneRepository)
class MilestoneRepositoryImpl implements MilestoneRepository {
  final MilestoneLocalDataSource localDataSource;

  MilestoneRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Milestone>>> getAllMilestones() async {
    try {
      final unlockedIds = await localDataSource.getUnlockedMilestoneIds();
      final list = predefinedMilestones.map((m) {
        final isUnlocked = unlockedIds.contains(m.id);
        return m.copyWith(isUnlocked: isUnlocked);
      }).toList();
      return Right(list);
    } catch (_) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, List<Milestone>>> getUnlockedMilestones() async {
    try {
      final unlockedIds = await localDataSource.getUnlockedMilestoneIds();
      final list = predefinedMilestones
          .where((m) => unlockedIds.contains(m.id))
          .map((m) => m.copyWith(isUnlocked: true))
          .toList();
      return Right(list);
    } catch (_) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, Milestone>> unlockMilestone(String id) async {
    try {
      final now = DateTime.now();
      await localDataSource.saveUnlockedMilestone(id, now);
      final found = predefinedMilestones.firstWhere((m) => m.id == id);
      return Right(found.copyWith(isUnlocked: true, unlockedAt: now));
    } catch (_) {
      return const Left(Failure.databaseError());
    }
  }
}
