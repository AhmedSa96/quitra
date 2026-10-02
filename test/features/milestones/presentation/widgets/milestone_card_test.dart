import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';
import 'package:quitra/features/milestones/presentation/widgets/milestone_card.dart';

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
}
