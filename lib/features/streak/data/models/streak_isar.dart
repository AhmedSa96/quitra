import 'package:isar/isar.dart';

part 'streak_isar.g.dart';

@collection
class StreakIsar {
  Id id = 0;

  int currentCount = 0;
  int longestCount = 0;
  DateTime? lastCheckInDate;
  int modeIndex = 0; // 0: strict, 1: forgiving
  bool forgivenessUsedThisWeek = false;
  DateTime? weekStartDate;
}
