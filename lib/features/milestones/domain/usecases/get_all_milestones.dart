import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/milestone.dart';
import '../repositories/milestone_repository.dart';

@lazySingleton
class GetAllMilestones {
  final MilestoneRepository repository;

  GetAllMilestones(this.repository);

  Future<Either<Failure, List<Milestone>>> call() {
    return repository.getAllMilestones();
  }
}
