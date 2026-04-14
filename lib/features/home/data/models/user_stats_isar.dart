import 'package:isar/isar.dart';

part 'user_stats_isar.g.dart';

@collection
class UserStatsIsar {
  Id id = 0; // Singleton for now since we only have one user stats locally

  int daysSmokeFree = 0;
  int cigarettesAvoided = 0;
  double moneySaved = 0.0;
  int cravingsLogged = 0;
  DateTime? lastUpdated;
}
