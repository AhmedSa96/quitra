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
  String get serverError => 'A server error occurred. Please try again.';

  @override
  String get networkError => 'Network error. Please check your connection.';

  @override
  String get unexpectedError => 'An unexpected error occurred.';

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
}
