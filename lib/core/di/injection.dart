import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/onboarding/data/models/user_profile_isar.dart';
import '../../features/home/data/models/user_stats_isar.dart';
import '../../features/home/data/models/craving_event_isar.dart';
import '../../features/home/data/models/daily_log_isar.dart';
import '../../features/settings/data/models/user_settings_isar.dart';
import '../../features/settings/presentation/bloc/settings_bloc.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @preResolve
  @singleton
  Future<Isar> get isar async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [
        UserStatsIsarSchema,
        UserProfileIsarSchema,
        CravingEventIsarSchema,
        DailyLogIsarSchema,
        UserSettingsIsarSchema,
      ],
      directory: dir.path,
    );
  }
}

@module
abstract class RegisterSettingsModule {
  @injectable
  SettingsBloc get settingsBloc => SettingsBloc();
}


@InjectableInit()
Future<void> configureDependencies() => getIt.init();