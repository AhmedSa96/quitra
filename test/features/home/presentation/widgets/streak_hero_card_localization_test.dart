import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/home/domain/entities/user_stats.dart';
import 'package:quitra/features/home/presentation/widgets/streak_hero_card.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/l10n/app_localizations.dart';

void main() {
  testWidgets('StreakHeroCard displays localized Arabic text', (tester) async {
    final streak = Streak(
      currentCount: 5,
      longestCount: 10,
      lastCheckInDate: null,
      mode: StreakMode.forgiving,
    );
    const stats = UserStats(
      moneySaved: 100,
      cigarettesAvoided: 50,
      daysSmokeFree: 5,
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: StreakHeroCard(
            streak: streak,
            stats: stats,
            journeyHistory: const [],
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify Arabic translations
    expect(find.text('أيام متتالية'), findsOneWidget);
    expect(find.text('Day streak'), findsNothing);
    expect(find.text('5ي'), findsOneWidget);
  });

  testWidgets('StreakHeroCard displays startYourStreak when count is 0 in Arabic', (tester) async {
    final streak = Streak(
      currentCount: 0,
      longestCount: 0,
      lastCheckInDate: null,
      mode: StreakMode.forgiving,
    );
    const stats = UserStats(
      moneySaved: 0,
      cigarettesAvoided: 0,
      daysSmokeFree: 0,
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: StreakHeroCard(
            streak: streak,
            stats: stats,
            journeyHistory: const [],
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('ابدأ سلسلتك'), findsOneWidget);
    expect(find.text('Start your streak'), findsNothing);
  });
}
