import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/l10n/app_localizations.dart';

void main() {
  testWidgets('AppLocalizations contains retention overhaul strings in English', (tester) async {
    late AppLocalizations l10n;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            l10n = AppLocalizations.of(context)!;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(l10n.thisWeekTitle, 'This Week');
    expect(l10n.yourStreakLabel, 'Your Streak');
    expect(l10n.streakAtRiskTitle, 'Keep your streak going.');
    expect(l10n.streakAtRiskBody, 'Take a minute to log your day in Quitra.');
    expect(l10n.streakModeLabel, 'Streak Mode');
  });

  testWidgets('AppLocalizations contains retention overhaul strings in Arabic', (tester) async {
    late AppLocalizations l10n;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            l10n = AppLocalizations.of(context)!;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(l10n.thisWeekTitle, isNotEmpty);
    expect(l10n.yourStreakLabel, isNotEmpty);
    expect(l10n.streakAtRiskTitle, isNotEmpty);
    expect(l10n.streakAtRiskBody, isNotEmpty);
    expect(l10n.streakModeLabel, isNotEmpty);
  });
}
