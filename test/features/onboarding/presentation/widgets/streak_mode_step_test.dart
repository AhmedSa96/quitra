import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/onboarding/presentation/widgets/streak_mode_step.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';

void main() {
  Widget buildTestableWidget({
    required StreakMode value,
    required ValueChanged<StreakMode> onChanged,
  }) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SingleChildScrollView(
          child: StreakModeStep(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  testWidgets('renders both streak mode options and highlights selected forgiving mode', (tester) async {
    StreakMode selectedMode = StreakMode.forgiving;

    await tester.pumpWidget(
      buildTestableWidget(
        value: selectedMode,
        onChanged: (val) => selectedMode = val,
      ),
    );

    final l10n = await AppLocalizations.delegate.load(const Locale('en'));

    expect(find.text('${l10n.forgivingModeLabel} (${l10n.recommendedLabel})'), findsOneWidget);
    expect(find.text(l10n.forgivingModeDesc), findsOneWidget);
    expect(find.text(l10n.strictModeLabel), findsOneWidget);
    expect(find.text(l10n.strictModeDesc), findsOneWidget);

    // Selected state indicator (check icon)
    expect(find.byIcon(SolarIconsBold.checkCircle), findsOneWidget);
  });

  testWidgets('tapping strict mode option calls onChanged with StreakMode.strict', (tester) async {
    StreakMode selectedMode = StreakMode.forgiving;

    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, setState) {
          return buildTestableWidget(
            value: selectedMode,
            onChanged: (val) {
              setState(() {
                selectedMode = val;
              });
            },
          );
        },
      ),
    );

    final l10n = await AppLocalizations.delegate.load(const Locale('en'));

    await tester.tap(find.text(l10n.strictModeLabel));
    await tester.pumpAndSettle();

    expect(selectedMode, StreakMode.strict);
    expect(find.byIcon(SolarIconsBold.checkCircle), findsOneWidget);
  });
}
