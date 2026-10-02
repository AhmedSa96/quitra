import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/core/presentation/animations/animated_count_up.dart';

void main() {
  testWidgets('AnimatedCountUp counts up to target value', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AnimatedCountUp(
            value: 42,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );

    // Initial frame at 0
    expect(find.text('0'), findsOneWidget);

    // Advance time to completion
    await tester.pumpAndSettle();
    expect(find.text('42'), findsOneWidget);
  });

  testWidgets('AnimatedCountUp respects prefix and suffix', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AnimatedCountUp(
            value: 15,
            prefix: '\$',
            suffix: '/mo',
            duration: Duration(milliseconds: 300),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('\$15/mo'), findsOneWidget);
  });

  testWidgets('AnimatedCountUp displays final value immediately when disableAnimations is true', (tester) async {
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(disableAnimations: true),
        child: MaterialApp(
          home: Scaffold(
            body: AnimatedCountUp(
              value: 100,
              duration: Duration(milliseconds: 1000),
            ),
          ),
        ),
      ),
    );

    // Should immediately display 100 on first frame without pumping time
    expect(find.text('100'), findsOneWidget);
  });
}
