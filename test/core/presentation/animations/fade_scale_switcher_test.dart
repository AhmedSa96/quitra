import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/core/presentation/animations/fade_scale_switcher.dart';

void main() {
  testWidgets('FadeScaleSwitcher renders child with scale and opacity', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FadeScaleSwitcher(
            child: Text('Hello'),
          ),
        ),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text('Hello'), findsOneWidget);
  });

  testWidgets('FadeScaleSwitcher renders child directly when disableAnimations is true', (tester) async {
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(disableAnimations: true),
        child: MaterialApp(
          home: Scaffold(
            body: FadeScaleSwitcher(
              child: Text('Direct'),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Direct'), findsOneWidget);
  });
}
