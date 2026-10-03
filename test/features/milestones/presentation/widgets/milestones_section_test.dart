import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/milestones/data/milestone_definitions.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';
import 'package:quitra/features/milestones/presentation/widgets/milestones_section.dart';
import 'package:quitra/l10n/app_localizations.dart';

void main() {
  testWidgets('MilestonesSection renders localized default title and categories in English', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: MilestonesSection(
            milestones: predefinedMilestones,
            allowedCategories: [
              MilestoneCategory.time,
              MilestoneCategory.healthRecovery,
              MilestoneCategory.savings,
              MilestoneCategory.consistency,
            ],
          ),
        ),
      ),
    );

    expect(find.text('Your Milestones'), findsOneWidget);
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Time'), findsOneWidget);
    expect(find.text('Health'), findsOneWidget);
    expect(find.text('Savings'), findsOneWidget);
    expect(find.text('Streak'), findsOneWidget);
    expect(find.text('Day One'), findsOneWidget);
  });

  testWidgets('MilestonesSection renders localized title and categories in Arabic', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ar'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: MilestonesSection(
            milestones: predefinedMilestones,
            allowedCategories: [
              MilestoneCategory.strength,
              MilestoneCategory.dedication,
            ],
          ),
        ),
      ),
    );

    expect(find.text('إنجازاتك'), findsOneWidget);
    expect(find.text('الكل'), findsOneWidget);
    expect(find.text('القوة'), findsOneWidget);
    expect(find.text('الالتزام'), findsOneWidget);
    expect(find.text('تجاوز أول رغبة'), findsOneWidget);
  });

  testWidgets('MilestonesSection respects custom localized title in Journey page context', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            final l10n = AppLocalizations.of(context)!;
            return Scaffold(
              body: MilestonesSection(
                title: l10n.strengthAndDedicationTitle,
                milestones: predefinedMilestones,
                allowedCategories: const [
                  MilestoneCategory.strength,
                  MilestoneCategory.dedication,
                ],
              ),
            );
          },
        ),
      ),
    );

    expect(find.text('القوة والالتزام'), findsOneWidget);
    expect(find.text('الكل'), findsOneWidget);
    expect(find.text('القوة'), findsOneWidget);
    expect(find.text('الالتزام'), findsOneWidget);
  });
}
