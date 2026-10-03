import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/main/presentation/widgets/floating_bottom_nav_bar.dart';
import 'package:solar_icons/solar_icons.dart';

void main() {
  testWidgets('FloatingBottomNavBar displays all items and triggers onTap', (tester) async {
    int selectedIndex = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              bottomNavigationBar: FloatingBottomNavBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                items: const [
                  FloatingBottomNavBarItem(
                    icon: Icon(SolarIconsOutline.home),
                    activeIcon: Icon(SolarIconsBold.home),
                    label: 'Home',
                  ),
                  FloatingBottomNavBarItem(
                    icon: Icon(SolarIconsOutline.graph),
                    activeIcon: Icon(SolarIconsBold.graph),
                    label: 'Progress',
                  ),
                  FloatingBottomNavBarItem(
                    icon: Icon(SolarIconsOutline.route),
                    activeIcon: Icon(SolarIconsBold.route),
                    label: 'Journey',
                  ),
                  FloatingBottomNavBarItem(
                    icon: Icon(SolarIconsOutline.settings),
                    activeIcon: Icon(SolarIconsBold.settings),
                    label: 'Settings',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );

    // Verify all item labels are rendered
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Progress'), findsOneWidget);
    expect(find.text('Journey'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);

    // Initial state: index 0 (Home active icon present)
    expect(find.byIcon(SolarIconsBold.home), findsOneWidget);
    expect(find.byIcon(SolarIconsOutline.graph), findsOneWidget);

    // Tap on Progress tab
    await tester.tap(find.text('Progress'));
    await tester.pumpAndSettle();

    expect(selectedIndex, 1);
    expect(find.byIcon(SolarIconsBold.graph), findsOneWidget);
    expect(find.byIcon(SolarIconsOutline.home), findsOneWidget);
  });

  testWidgets('FloatingBottomNavBar works in RTL directionality without error', (tester) async {
    int selectedIndex = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                bottomNavigationBar: FloatingBottomNavBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  items: const [
                    FloatingBottomNavBarItem(
                      icon: Icon(SolarIconsOutline.home),
                      activeIcon: Icon(SolarIconsBold.home),
                      label: 'الرئيسية',
                    ),
                    FloatingBottomNavBarItem(
                      icon: Icon(SolarIconsOutline.graph),
                      activeIcon: Icon(SolarIconsBold.graph),
                      label: 'التقدم',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );

    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.text('التقدم'), findsOneWidget);

    await tester.tap(find.text('التقدم'));
    await tester.pumpAndSettle();

    expect(selectedIndex, 1);
  });
}
