import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import '../models/streak_isar.dart';

abstract class StreakLocalDataSource {
  Future<StreakIsar?> getStreakModel();
  Future<void> saveStreakModel(StreakIsar model);
}

@LazySingleton(as: StreakLocalDataSource)
class StreakLocalDataSourceImpl implements StreakLocalDataSource {
  final Isar isar;

  StreakLocalDataSourceImpl(this.isar);

  @override
  Future<StreakIsar?> getStreakModel() async {
    return isar.streakIsars.get(0);
  }

  @override
  Future<void> saveStreakModel(StreakIsar model) async {
    model.id = 0;
    await isar.writeTxn(() async {
      await isar.streakIsars.put(model);
    });
  }
}
