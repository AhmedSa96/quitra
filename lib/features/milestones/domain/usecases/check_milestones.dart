import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/milestone.dart';
import '../repositories/milestone_repository.dart';

@lazySingleton
class CheckMilestones {
  final MilestoneRepository repository;

  CheckMilestones(this.repository);

  Future<Either<Failure, List<Milestone>>> call({
    required int daysSmokeFree,
    required double moneySaved,
    required int currentStreak,
    required int cravingsResisted,
    required int totalCheckIns,
    required double heartProgress,
    required double circulationProgress,
    required double lungProgress,
  }) async {
    final allResult = await repository.getAllMilestones();
    return allResult.fold(
      (failure) => Left(failure),
      (allMilestones) async {
        final List<Milestone> newlyUnlocked = [];

        for (final milestone in allMilestones) {
          if (milestone.isUnlocked) continue;

          bool shouldUnlock = false;
          switch (milestone.category) {
            case MilestoneCategory.time:
              shouldUnlock = daysSmokeFree >= milestone.threshold;
              break;
            case MilestoneCategory.healthRecovery:
              if (milestone.id == 'health_heart') {
                shouldUnlock = heartProgress >= milestone.threshold;
              } else if (milestone.id == 'health_circulation') {
                shouldUnlock = circulationProgress >= milestone.threshold;
              } else if (milestone.id == 'health_lungs') {
                shouldUnlock = lungProgress >= milestone.threshold;
              }
              break;
            case MilestoneCategory.savings:
              shouldUnlock = moneySaved >= milestone.threshold;
              break;
            case MilestoneCategory.consistency:
              shouldUnlock = currentStreak >= milestone.threshold;
              break;
            case MilestoneCategory.strength:
              shouldUnlock = cravingsResisted >= milestone.threshold;
              break;
            case MilestoneCategory.dedication:
              shouldUnlock = totalCheckIns >= milestone.threshold;
              break;
          }

          if (shouldUnlock) {
            final unlockResult = await repository.unlockMilestone(milestone.id);
            unlockResult.fold(
              (_) {},
              (unlocked) => newlyUnlocked.add(unlocked),
            );
          }
        }

        return Right(newlyUnlocked);
      },
    );
  }
}
