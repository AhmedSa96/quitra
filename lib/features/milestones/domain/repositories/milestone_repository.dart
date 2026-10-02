import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/milestone.dart';

abstract class MilestoneRepository {
  Future<Either<Failure, List<Milestone>>> getAllMilestones();
  Future<Either<Failure, List<Milestone>>> getUnlockedMilestones();
  Future<Either<Failure, Milestone>> unlockMilestone(String id);
}
