import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/core/di/injection.dart';
import 'package:quitra/core/app_router.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const QuitraApp());
}

class QuitraApp extends StatelessWidget {
  const QuitraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsBloc>()..add(LoadSettings()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Quitra',
            routerConfig: goRouter,
            theme: AppTheme.lightTheme(),
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}