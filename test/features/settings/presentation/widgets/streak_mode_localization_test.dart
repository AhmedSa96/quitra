import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:quitra/features/settings/presentation/widgets/streak_mode_dialog.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/l10n/app_localizations.dart';

class MockSettingsBloc extends Mock implements SettingsBloc {}

void main() {
  late MockSettingsBloc mockSettingsBloc;

  setUp(() {
    mockSettingsBloc = MockSettingsBloc();
    when(() => mockSettingsBloc.state).thenReturn(
      const SettingsState(streakMode: StreakMode.forgiving),
    );
    when(() => mockSettingsBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('StreakModeDialog displays localized Arabic text', (tester) async {
    await tester.pumpWidget(
      BlocProvider<SettingsBloc>.value(
        value: mockSettingsBloc,
        child: const MaterialApp(
          locale: Locale('ar'),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: StreakModeDialog(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify Arabic translations are rendered instead of hardcoded English
    expect(find.text('وضع السلسلة'), findsOneWidget);
    expect(find.text('اختر كيف تتعامل سلسلتك اليومية مع الصعوبات والانتكاسات.'), findsOneWidget);
    expect(find.textContaining('الوضع المرن'), findsOneWidget);
    expect(find.textContaining('موصى به'), findsOneWidget);
    expect(find.textContaining('الوضع الصارم'), findsOneWidget);
    expect(find.text('Streak Mode'), findsNothing);
    expect(find.text('Forgiving Mode (Recommended)'), findsNothing);
    expect(find.text('Strict Mode'), findsNothing);
  });
}
