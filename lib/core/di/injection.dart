import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/home/data/models/user_stats_isar.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @singleton
  Future<Isar> get isar async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [UserStatsIsarSchema],
      directory: dir.path,
    );
  }
}

@InjectableInit()
void configureDependencies() => getIt.init();
