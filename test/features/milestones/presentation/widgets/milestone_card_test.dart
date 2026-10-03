import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';
import 'package:quitra/features/milestones/presentation/widgets/milestone_card.dart';
import 'package:quitra/l10n/app_localizations.dart';

void main() {
  testWidgets('MilestoneCard renders title and icon opacity according to unlock status', (tester) async {
    const locked = Milestone(
      id: 'time_1d',
      titleKey: 'One Day',
      descriptionKey: 'desc',
      category: MilestoneCategory.time,
      iconName: 'calendarMinimalistic',
      threshold: 1,
      isUnlocked: false,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MilestoneCard(milestone: locked),
        ),
      ),
    );

    expect(find.text('One Day'), findsOneWidget);
    final opacityWidget = tester.widget<Opacity>(find.byType(Opacity));
    expect(opacityWidget.opacity, 0.4);
  });

  testWidgets('MilestoneCard renders full opacity when unlocked', (tester) async {
    const unlocked = Milestone(
      id: 'time_1d',
      titleKey: 'One Day',
      descriptionKey: 'desc',
      category: MilestoneCategory.time,
      iconName: 'calendarMinimalistic',
      threshold: 1,
      isUnlocked: true,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MilestoneCard(milestone: unlocked),
        ),
      ),
    );

    expect(find.text('One Day'), findsOneWidget);
    final opacityWidget = tester.widget<Opacity>(find.byType(Opacity));
    expect(opacityWidget.opacity, 1.0);
  });

  testWidgets('MilestoneCard renders localized title when AppLocalizations is present', (tester) async {
    const milestone = Milestone(
      id: 'time_1d',
      titleKey: 'milestoneFirstDayTitle',
      descriptionKey: 'milestoneFirstDayDesc',
      category: MilestoneCategory.time,
      iconName: 'calendarMinimalistic',
      threshold: 1,
      isUnlocked: true,
    );

    // English
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: MilestoneCard(milestone: milestone),
        ),
      ),
    );
    expect(find.text('Day One'), findsOneWidget);

    // Arabic
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ar'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: MilestoneCard(milestone: milestone),
        ),
      ),
    );
    expect(find.text('اليوم الأول'), findsOneWidget);

    // Turkish
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('tr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: MilestoneCard(milestone: milestone),
        ),
      ),
    );
    expect(find.text('İlk Gün'), findsOneWidget);
  });
}
