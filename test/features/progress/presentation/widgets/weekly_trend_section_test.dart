import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/progress/presentation/widgets/weekly_trend_section.dart';

void main() {
  testWidgets('WeeklyTrendSection renders title and custom painter', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WeeklyTrendSection(
            dailyCravingCounts: [0, 2, 4, 1, 0, 3, 0],
            todayIndex: 2,
          ),
        ),
      ),
    );

    expect(find.text('This Week'), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
    expect(find.byType(WeeklyTrendSection), findsOneWidget);
  });

  testWidgets('WeeklyTrendSection renders with all zero counts', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WeeklyTrendSection(
            dailyCravingCounts: [0, 0, 0, 0, 0, 0, 0],
            todayIndex: 0,
          ),
        ),
      ),
    );

    expect(find.text('This Week'), findsOneWidget);
    expect(find.text('0 moments'), findsOneWidget);
  });

  testWidgets('WeeklyTrendSection displays total count correctly', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WeeklyTrendSection(
            dailyCravingCounts: [1, 2, 3, 0, 0, 0, 0],
          ),
        ),
      ),
    );

    expect(find.text('6 moments'), findsOneWidget);
  });
}
