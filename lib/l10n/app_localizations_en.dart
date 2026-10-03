// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Quitra';

  @override
  String get appVersion => 'v1.0.0';

  @override
  String get digitalSanctuary => 'DIGITAL SANCTUARY';

  @override
  String stepProgress(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get continueButton => 'Continue';

  @override
  String get onboardingError =>
      'Failed to complete onboarding. Please try again.';

  @override
  String get cigarettesPerDayQuestion =>
      'How many cigarettes do you smoke a day?';

  @override
  String get yearsSmokingQuestion => 'How many years have you been smoking?';

  @override
  String get quitMethodQuestion => 'How would you like to quit?';

  @override
  String get coldTurkeyTitle => 'Cold Turkey';

  @override
  String get coldTurkeyDescription => 'Stop completely right now.';

  @override
  String get gradualTitle => 'Gradual Reduction';

  @override
  String get gradualDescription => 'Slowly reduce over time.';

  @override
  String get quitDateQuestion => 'When is your quit start date?';

  @override
  String get changeDate => 'Change Date';

  @override
  String get homeTitle => 'Home';

  @override
  String get progressTitle => 'Progress';

  @override
  String get journeyTitle => 'Journey';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get homeWelcome => 'You\'re doing great.';

  @override
  String get homeDashboardTitle => 'Your journey begins here.';

  @override
  String get homeDashboardDescription =>
      'This is your empty dashboard. Later, you will see your stats and daily logs here.';

  @override
  String get craveButton => 'I feel like smoking';

  @override
  String get progressComingSoon => 'Stats & Milestones coming soon';

  @override
  String get journeyComingSoon => 'Timeline history coming soon';

  @override
  String get serverError =>
      'Our server is taking a moment. We\'ll be back with you shortly.';

  @override
  String get networkError =>
      'Connection lost. Please check your internet to stay on the path.';

  @override
  String get unexpectedError =>
      'Something went wrong. Let\'s take a breath and try again.';

  @override
  String get cacheError =>
      'We couldn\'t load your saved progress. We\'re working to fix it.';

  @override
  String get databaseError =>
      'Your journey data is momentarily unavailable. Please try again.';

  @override
  String get fileError =>
      'We couldn\'t access the necessary files. Let\'s try that again.';

  @override
  String homeGreeting(int days) {
    return 'Day $days smoke-free';
  }

  @override
  String get moneySavedLabel => 'Money Saved';

  @override
  String get cigsAvoidedLabel => 'Cigarettes Avoided';

  @override
  String get timeSmokeFreeLabel => 'Time Smoke-free';

  @override
  String get howWasYourDay => 'How was your day?';

  @override
  String get healthMilestonesTitle => 'Health Milestones';

  @override
  String get lungFunctionLabel => 'Lung function improving';

  @override
  String get circulationLabel => 'Better circulation';

  @override
  String get heartRateLabel => 'Heart rate normalizing';

  @override
  String get journeyHistoryTitle => 'Journey History';

  @override
  String get cleanStatus => 'Clean';

  @override
  String get cravingStatus => 'Craving';

  @override
  String get setbackStatus => 'Setback';

  @override
  String get profileLabel => 'Profile';

  @override
  String get quitPlanLabel => 'Quit Plan';

  @override
  String get notificationsLabel => 'Notifications';

  @override
  String get subscriptionLabel => 'Subscription';

  @override
  String get privacyPolicyLabel => 'Privacy Policy';

  @override
  String get privacyCommitment => 'Your data stays on your device';

  @override
  String get privacyCommitmentDesc =>
      'Quitra is designed to be completely offline. Your personal journey data never leaves your device.';

  @override
  String get privacyDataWeCollect => 'Data we collect';

  @override
  String get privacyDataWeCollectDesc =>
      'We store only what you choose to share: your quit plan, daily check-ins, and settings. This data stays entirely on your device.';

  @override
  String get privacyDataWeDontCollect => 'Data we don\'t collect';

  @override
  String get privacyDataWeDontCollectDesc =>
      'No analytics. No cloud sync. No personal identifiers. We have no way to see or share your data.';

  @override
  String get privacyYourControl => 'Your control';

  @override
  String get privacyYourControlDesc =>
      'Export your data anytime via CSV. Your journey, your files.';

  @override
  String get privacyContact => 'Get in touch';

  @override
  String get privacyContactDesc =>
      'Questions about privacy? We\'d love to hear from you.';

  @override
  String get cigarettePriceStepTitle => 'What is the price of your cigarettes?';

  @override
  String get priceOptionSingle => 'Single Cigarette';

  @override
  String get priceOptionPacket => 'Packet';

  @override
  String get singleCigarettePriceLabel => 'Price per cigarette';

  @override
  String get packetPriceLabel => 'Price per packet';

  @override
  String get cigarettesPerPacketLabel => 'Cigarettes per packet';

  @override
  String get priceRequired => 'Price is required';

  @override
  String get invalidNumber => 'Please enter a valid number';

  @override
  String get journeyStartMessage => 'Your journey starts here.';

  @override
  String get cravingsRecorded => 'Cravings recorded';

  @override
  String get setbackRecorded => 'Setback recorded';

  @override
  String get didYouSmokeToday => 'Did you smoke today?';

  @override
  String get cravingsIntensity => 'Cravings intensity';

  @override
  String get addNoteOptional => 'Add a note (optional)';

  @override
  String get saveJournal => 'Save Journal';

  @override
  String get detailedInsights => 'Detailed Insights';

  @override
  String get lifeRegainedLabel => 'Life Regained';

  @override
  String get cleanStreakLabel => 'Clean Streak';

  @override
  String get dayDetailsTitle => 'Day Details';

  @override
  String get journalNoteLabel => 'Journal Note';

  @override
  String get editNoteAction => 'Edit Note';

  @override
  String get saveNoteAction => 'Save Changes';

  @override
  String get languageLabel => 'Language';

  @override
  String get cigarettePriceLabel => 'Cigarette Price';

  @override
  String get saveAction => 'Save';

  @override
  String get cancelAction => 'Cancel';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get turkish => 'Turkish';

  @override
  String get dailyReminderLabel => 'Daily Reminder';

  @override
  String get dailyReminderDescription => 'Get reminded to check in daily';

  @override
  String get reminderTimeLabel => 'Reminder Time';

  @override
  String get milestoneCelebrationsLabel => 'Milestone Celebrations';

  @override
  String get milestoneCelebrationsDescription =>
      'Celebrate your progress milestones';

  @override
  String get dailyReminderNotificationTitle => 'Quitra';

  @override
  String get dailyReminderNotificationBody =>
      'Time for your check-in. We\'re here for you.';

  @override
  String get milestone7Title => 'One week strong.';

  @override
  String get milestone7Body => 'You\'re doing better than you think.';

  @override
  String get milestone14Title => 'Two weeks strong.';

  @override
  String get milestone14Body => 'Every step matters.';

  @override
  String get milestone30Title => 'One month strong.';

  @override
  String get milestone30Body => 'This is real progress.';

  @override
  String get milestone60Title => 'Sixty days strong.';

  @override
  String get milestone60Body => 'You\'re building something.';

  @override
  String get milestone90Title => 'Three months strong.';

  @override
  String get milestone90Body => 'You\'ve got this.';

  @override
  String get milestone180Title => 'Half a year.';

  @override
  String get milestone180Body => 'Your journey, your strength.';

  @override
  String get milestone365Title => 'One year free.';

  @override
  String get milestone365Body => 'You\'re free. Congratulations.';

  @override
  String get exportDataLabel => 'Export Data';

  @override
  String get exportDataSuccess => 'Data exported successfully';

  @override
  String get exportDataError => 'Failed to export data';

  @override
  String get exportDataDescription => 'Export all your data as a CSV file';

  @override
  String get onboardingImportTitle => 'Import your data';

  @override
  String get onboardingImportDescription =>
      'Already have a backup? Import your CSV file to continue where you left off.';

  @override
  String get onboardingImportAction => 'Select CSV File';

  @override
  String get onboardingImportSkip => 'I\'m new here, skip';

  @override
  String get onboardingImportSuccess => 'Data imported successfully!';

  @override
  String get shareJourneyStarting =>
      'Starting my smoke-free journey! Join me on Quitra';

  @override
  String shareJourneyDaysSmokeFree(int days) {
    return 'I\'m $days days smoke-free! Join me on Quitra';
  }

  @override
  String get takeBreathHonest => 'Take a breath. Be honest with yourself.';

  @override
  String get iStayedStrong => 'I stayed strong';

  @override
  String get iHadOneCigarette => 'I had one cigarette';

  @override
  String get watchAdToRecord => 'Watch ad to record';

  @override
  String get markAsSmoked => 'Mark as smoked';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get share => 'Share Journey';

  @override
  String get thisWeekTitle => 'This Week';

  @override
  String get yourStreakLabel => 'Your Streak';

  @override
  String get streakAtRiskTitle => 'Keep your streak going.';

  @override
  String get streakAtRiskBody => 'Take a minute to log your day in Quitra.';

  @override
  String get streakModeLabel => 'Streak Mode';

  @override
  String get streakModeDescription =>
      'Choose how your daily streak handles setbacks.';

  @override
  String get forgivingModeLabel => 'Forgiving Mode';

  @override
  String get strictModeLabel => 'Strict Mode';

  @override
  String get forgivingModeDesc =>
      'One grace pass per week so one difficult moment doesn\'t reset all your hard work.';

  @override
  String get strictModeDesc =>
      'Streak resets immediately to 0 on any setback or missed check-in.';

  @override
  String get recommendedLabel => 'Recommended';

  @override
  String get dayStreak => 'Day streak';

  @override
  String get startYourStreak => 'Start your streak';

  @override
  String get cravingTrendTitle => 'Craving Trend';

  @override
  String cravingMomentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count moments',
      one: '1 moment',
    );
    return '$_temp0';
  }

  @override
  String get dayShort => 'd';

  @override
  String get watchAdAndSaveJournal => 'Watch Ad & Save Journal';

  @override
  String get watchAdHint =>
      'Watching ads helps us keep Quitra free and constantly improving.';

  @override
  String get yourMilestonesTitle => 'Your Milestones';

  @override
  String get strengthAndDedicationTitle => 'Strength & Dedication';

  @override
  String get milestoneCategoryAll => 'All';

  @override
  String get milestoneCategoryTime => 'Time';

  @override
  String get milestoneCategoryHealth => 'Health';

  @override
  String get milestoneCategorySavings => 'Savings';

  @override
  String get milestoneCategoryStreak => 'Streak';

  @override
  String get milestoneCategoryStrength => 'Strength';

  @override
  String get milestoneCategoryDedication => 'Dedication';

  @override
  String get milestoneFirstDayTitle => 'Day One';

  @override
  String get milestoneFirstDayDesc =>
      'The first step is always the hardest. You took it.';

  @override
  String get milestoneThreeDaysTitle => 'Three Days Clean';

  @override
  String get milestoneThreeDaysDesc =>
      'Nicotine is leaving your body. You\'re regaining control.';

  @override
  String get milestoneOneWeekTitle => 'One Week Strong';

  @override
  String get milestoneOneWeekDesc =>
      'You\'re doing better than you think. A full week behind you.';

  @override
  String get milestoneTwoWeeksTitle => 'Two Weeks Clean';

  @override
  String get milestoneTwoWeeksDesc =>
      'Every step matters. Cravings are losing their grip.';

  @override
  String get milestoneOneMonthTitle => 'One Month Free';

  @override
  String get milestoneOneMonthDesc =>
      'This is real progress. You\'ve redefined your daily rhythm.';

  @override
  String get milestoneThreeMonthsTitle => 'Three Months';

  @override
  String get milestoneThreeMonthsDesc =>
      'You\'ve built lasting resilience. You\'ve got this.';

  @override
  String get milestoneSixMonthsTitle => 'Half a Year';

  @override
  String get milestoneSixMonthsDesc =>
      'Six months of freedom. Your journey, your strength.';

  @override
  String get milestoneOneYearTitle => 'One Year Free';

  @override
  String get milestoneOneYearDesc =>
      'A full year of choosing yourself. You\'re free.';

  @override
  String get milestoneHeartHealingTitle => 'Heart Rhythm Restored';

  @override
  String get milestoneHeartHealingDesc =>
      'Your heart rate and blood pressure have returned to normal levels.';

  @override
  String get milestoneCirculationTitle => 'Vital Circulation';

  @override
  String get milestoneCirculationDesc =>
      'Oxygen flows freely again. Movement and energy feel lighter.';

  @override
  String get milestoneBreathingTitle => 'Clearer Breathing';

  @override
  String get milestoneBreathingDesc =>
      'Your airways are recovering. Breathing is calm and deep.';

  @override
  String get milestoneSaved10Title => 'First Savings';

  @override
  String get milestoneSaved10Desc =>
      'Your first money saved. Proof that every decision counts.';

  @override
  String get milestoneSaved50Title => 'Growing Pocket';

  @override
  String get milestoneSaved50Desc =>
      'Fifty saved. Money kept in your pocket, not burned in smoke.';

  @override
  String get milestoneSaved100Title => 'Milestone Century';

  @override
  String get milestoneSaved100Desc =>
      'A hundred saved. A tangible reward for your commitment.';

  @override
  String get milestoneSaved500Title => 'Financial Freedom';

  @override
  String get milestoneSaved500Desc =>
      'Five hundred preserved. Taking back control of your resources.';

  @override
  String get milestoneStreak7Title => '7-Day Focus';

  @override
  String get milestoneStreak7Desc =>
      'Seven consecutive days of self-control. Momentum is building.';

  @override
  String get milestoneStreak30Title => 'Solid Habit';

  @override
  String get milestoneStreak30Desc =>
      'Thirty straight days. New neural pathways are flourishing.';

  @override
  String get milestoneStreak100Title => 'Unshakeable';

  @override
  String get milestoneStreak100Desc =>
      'One hundred unbroken days. You are truly in control.';

  @override
  String get milestoneFirstMomentTitle => 'First Moment Passed';

  @override
  String get milestoneFirstMomentDesc =>
      'You paused, breathed, and let it pass. Proof that cravings fade.';

  @override
  String get milestoneTenMomentsTitle => 'Ten Victories';

  @override
  String get milestoneTenMomentsDesc =>
      'Ten difficult urges faced and overcome without giving in.';

  @override
  String get milestoneFiftyMomentsTitle => 'Master of Moments';

  @override
  String get milestoneFiftyMomentsDesc =>
      'Fifty moments mastered. Cravings no longer dictate your choices.';

  @override
  String get milestoneSevenCheckInsTitle => 'First Week of Check-Ins';

  @override
  String get milestoneSevenCheckInsDesc =>
      'Seven daily logs. Honest reflection keeps you anchored.';

  @override
  String get milestoneThirtyCheckInsTitle => 'A Month of Awareness';

  @override
  String get milestoneThirtyCheckInsDesc =>
      'Thirty daily reflections. Self-awareness is your superpower.';

  @override
  String get nextMilestoneTitle => 'Next Milestone';

  @override
  String get milestoneComplete => 'Completed';

  @override
  String get allMilestonesAchieved => 'All Milestones Achieved!';

  @override
  String get allMilestonesAchievedDesc =>
      'You have achieved every single milestone on your journey. Truly remarkable!';
}
