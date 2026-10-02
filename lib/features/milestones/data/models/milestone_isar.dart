import 'package:isar/isar.dart';

part 'milestone_isar.g.dart';

@collection
class MilestoneIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String milestoneId;

  bool isUnlocked = false;
  DateTime? unlockedAt;
}
