import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';
import 'package:quitra/features/progress/domain/entities/progress_stats.dart';
import 'package:quitra/features/progress/presentation/widgets/next_milestone_card.dart';
import 'package:quitra/l10n/app_localizations.dart';

void main() {
  const testStats = ProgressStats(
    daysSmokeFree: 2,
    moneySaved: 20.0,
    cigarettesAvoided: 40,
    lifeRegainedMinutes: 440,
    currentStreak: 2,
    heartRateProgress: 1.0,
    circulationProgress: 0.2,
    lungFunctionProgress: 0.1,
  );

  const testMilestones = [
    Milestone(
      id: 'time_3d',
      titleKey: 'milestoneThreeDaysTitle',
      descriptionKey: 'milestoneThreeDaysDesc',
      category: MilestoneCategory.time,
      iconName: 'calendarMinimalistic',
      threshold: 3,
      isUnlocked: false,
    ),
    Milestone(
      id: 'savings_10',
      titleKey: 'milestoneSaved10Title',
      descriptionKey: 'milestoneSaved10Desc',
      category: MilestoneCategory.savings,
      iconName: 'walletMoney',
      threshold: 10,
      isUnlocked: true,
    ),
  ];

  testWidgets('NextMilestoneCard renders next milestone details and ring', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: NextMilestoneCard(
            milestones: testMilestones,
            stats: testStats,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(NextMilestoneCard), findsOneWidget);
    expect(find.text('Next Milestone'), findsOneWidget);
    expect(find.text('Three Days Clean'), findsOneWidget);
    expect(find.text('66%'), findsOneWidget);
  });

  testWidgets('NextMilestoneCard renders all achieved state when none locked', (tester) async {
    const allUnlocked = [
      Milestone(
        id: 'time_1d',
        titleKey: 'milestoneFirstDayTitle',
        descriptionKey: 'milestoneFirstDayDesc',
        category: MilestoneCategory.time,
        iconName: 'calendarMinimalistic',
        threshold: 1,
        isUnlocked: true,
      ),
    ];

    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: NextMilestoneCard(
            milestones: allUnlocked,
            stats: testStats,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('All Milestones Achieved!'), findsOneWidget);
  });
}
