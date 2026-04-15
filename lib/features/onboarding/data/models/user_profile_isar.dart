import 'package:isar/isar.dart';

part 'user_profile_isar.g.dart';

@collection
class UserProfileIsar {
  Id id = Isar.autoIncrement;

  late int cigarettesPerDay;

  late int yearsSmoking;

  late String quitMethod;

  late DateTime quitStartDate;

  double? cigarettePrice;

  double? packetPrice;

  int? cigarettesPerPacket;
}
