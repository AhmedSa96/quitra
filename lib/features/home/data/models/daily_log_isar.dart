import 'package:isar/isar.dart';

part 'daily_log_isar.g.dart';

@collection
class DailyLogIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late DateTime date;

  bool wasSmoked = false;

  int cravingLevel = 0; // 1-5

  String? note;
}
