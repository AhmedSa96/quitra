import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/l10n/app_localizations.dart';

void main() {
  testWidgets('AppLocalizations contains retention overhaul strings in English', (tester) async {
    late AppLocalizations l10n;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            l10n = AppLocalizations.of(context)!;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(l10n.thisWeekTitle, 'This Week');
    expect(l10n.yourStreakLabel, 'Your Streak');
    expect(l10n.streakAtRiskTitle, 'Keep your streak going.');
    expect(l10n.streakAtRiskBody, 'Take a minute to log your day in Quitra.');
    expect(l10n.streakModeLabel, 'Streak Mode');
    expect(l10n.streakModeDescription, 'Choose how your daily streak handles setbacks.');
    expect(l10n.recommendedLabel, 'Recommended');
    expect(l10n.dayStreak, 'Day streak');
    expect(l10n.startYourStreak, 'Start your streak');
    expect(l10n.cravingTrendTitle, 'Craving Trend');
    expect(l10n.cravingMomentsCount(3), '3 moments');
    expect(l10n.dayShort, 'd');
    expect(l10n.watchAdAndSaveJournal, 'Watch Ad & Save Journal');
    expect(l10n.watchAdHint, contains('Watching ads'));
    expect(l10n.yourMilestonesTitle, 'Your Milestones');
    expect(l10n.strengthAndDedicationTitle, 'Strength & Dedication');
    expect(l10n.milestoneCategoryAll, 'All');
    expect(l10n.milestoneFirstDayTitle, 'Day One');
    expect(l10n.milestoneHeartHealingTitle, 'Heart Rhythm Restored');
    expect(l10n.milestoneSaved10Title, 'First Savings');
    expect(l10n.milestoneStreak7Title, '7-Day Focus');
    expect(l10n.milestoneFirstMomentTitle, 'First Moment Passed');
    expect(l10n.milestoneSevenCheckInsTitle, 'First Week of Check-Ins');
  });

  testWidgets('AppLocalizations contains retention overhaul strings in Arabic', (tester) async {
    late AppLocalizations l10n;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            l10n = AppLocalizations.of(context)!;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(l10n.thisWeekTitle, isNotEmpty);
    expect(l10n.yourStreakLabel, isNotEmpty);
    expect(l10n.streakAtRiskTitle, isNotEmpty);
    expect(l10n.streakAtRiskBody, isNotEmpty);
    expect(l10n.streakModeLabel, 'وضع السلسلة');
    expect(l10n.streakModeDescription, isNotEmpty);
    expect(l10n.recommendedLabel, 'موصى به');
    expect(l10n.dayStreak, 'أيام متتالية');
    expect(l10n.startYourStreak, 'ابدأ سلسلتك');
    expect(l10n.cravingTrendTitle, 'مسار الرغبات');
    expect(l10n.cravingMomentsCount(0), contains('لحظات'));
    expect(l10n.dayShort, 'ي');
    expect(l10n.watchAdAndSaveJournal, isNotEmpty);
    expect(l10n.watchAdHint, isNotEmpty);
    expect(l10n.yourMilestonesTitle, 'إنجازاتك');
    expect(l10n.strengthAndDedicationTitle, 'القوة والالتزام');
    expect(l10n.milestoneCategoryAll, 'الكل');
    expect(l10n.milestoneFirstDayTitle, 'اليوم الأول');
    expect(l10n.milestoneFirstDayDesc, isNotEmpty);
  });

  testWidgets('AppLocalizations contains retention overhaul strings in Turkish', (tester) async {
    late AppLocalizations l10n;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('tr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            l10n = AppLocalizations.of(context)!;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(l10n.streakModeLabel, 'Seri Modu');
    expect(l10n.streakModeDescription, isNotEmpty);
    expect(l10n.recommendedLabel, 'Önerilen');
    expect(l10n.dayStreak, 'Günlük seri');
    expect(l10n.startYourStreak, 'Serini başlat');
    expect(l10n.cravingTrendTitle, 'İstek Eğilimi');
    expect(l10n.cravingMomentsCount(3), contains('an'));
    expect(l10n.dayShort, 'g');
    expect(l10n.watchAdAndSaveJournal, isNotEmpty);
    expect(l10n.watchAdHint, isNotEmpty);
    expect(l10n.yourMilestonesTitle, 'Kilometre Taşların');
    expect(l10n.strengthAndDedicationTitle, 'Güç ve Kararlılık');
    expect(l10n.milestoneCategoryAll, 'Tümü');
    expect(l10n.milestoneFirstDayTitle, 'İlk Gün');
    expect(l10n.milestoneFirstDayDesc, isNotEmpty);
  });
}
