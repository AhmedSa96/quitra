import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/home/presentation/widgets/heatmap_grid.dart';
import 'package:quitra/features/journey/domain/entities/journey_day.dart';

void main() {
  testWidgets('HeatmapGrid renders weekday labels and grid cells', (tester) async {
    final history = [
      JourneyDay(date: DateTime.now(), status: JourneyStatus.clean),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeatmapGrid(history: history),
        ),
      ),
    );

    expect(find.text('M'), findsOneWidget);
    expect(find.text('W'), findsOneWidget);
    expect(find.text('F'), findsOneWidget);
  });
}
