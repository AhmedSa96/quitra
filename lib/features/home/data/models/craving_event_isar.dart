import 'package:isar/isar.dart';

part 'craving_event_isar.g.dart';

@collection
class CravingEventIsar {
  Id id = Isar.autoIncrement;

  late DateTime timestamp;
}
