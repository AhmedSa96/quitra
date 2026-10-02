import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import '../models/milestone_isar.dart';

abstract class MilestoneLocalDataSource {
  Future<Set<String>> getUnlockedMilestoneIds();
  Future<void> saveUnlockedMilestone(String milestoneId, DateTime unlockedAt);
}

@LazySingleton(as: MilestoneLocalDataSource)
class MilestoneLocalDataSourceImpl implements MilestoneLocalDataSource {
  final Isar isar;

  MilestoneLocalDataSourceImpl(this.isar);

  @override
  Future<Set<String>> getUnlockedMilestoneIds() async {
    final unlocked = await isar.milestoneIsars.filter().isUnlockedEqualTo(true).findAll();
    return unlocked.map((m) => m.milestoneId).toSet();
  }

  @override
  Future<void> saveUnlockedMilestone(String milestoneId, DateTime unlockedAt) async {
    await isar.writeTxn(() async {
      final existing = await isar.milestoneIsars.filter().milestoneIdEqualTo(milestoneId).findFirst();
      final model = existing ?? MilestoneIsar()
        ..milestoneId = milestoneId;
      model.isUnlocked = true;
      model.unlockedAt = unlockedAt;
      await isar.milestoneIsars.put(model);
    });
  }
}
