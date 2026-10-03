import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('tr'),
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'Quitra'**
  String get appName;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'v1.0.0'**
  String get appVersion;

  /// Slogan for the splash screen
  ///
  /// In en, this message translates to:
  /// **'DIGITAL SANCTUARY'**
  String get digitalSanctuary;

  /// Onboarding step progress
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String stepProgress(int current, int total);

  /// Continue button text
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Error message when onboarding fails
  ///
  /// In en, this message translates to:
  /// **'Failed to complete onboarding. Please try again.'**
  String get onboardingError;

  /// No description provided for @cigarettesPerDayQuestion.
  ///
  /// In en, this message translates to:
  /// **'How many cigarettes do you smoke a day?'**
  String get cigarettesPerDayQuestion;

  /// No description provided for @yearsSmokingQuestion.
  ///
  /// In en, this message translates to:
  /// **'How many years have you been smoking?'**
  String get yearsSmokingQuestion;

  /// No description provided for @quitMethodQuestion.
  ///
  /// In en, this message translates to:
  /// **'How would you like to quit?'**
  String get quitMethodQuestion;

  /// No description provided for @coldTurkeyTitle.
  ///
  /// In en, this message translates to:
  /// **'Cold Turkey'**
  String get coldTurkeyTitle;

  /// No description provided for @coldTurkeyDescription.
  ///
  /// In en, this message translates to:
  /// **'Stop completely right now.'**
  String get coldTurkeyDescription;

  /// No description provided for @gradualTitle.
  ///
  /// In en, this message translates to:
  /// **'Gradual Reduction'**
  String get gradualTitle;

  /// No description provided for @gradualDescription.
  ///
  /// In en, this message translates to:
  /// **'Slowly reduce over time.'**
  String get gradualDescription;

  /// No description provided for @quitDateQuestion.
  ///
  /// In en, this message translates to:
  /// **'When is your quit start date?'**
  String get quitDateQuestion;

  /// No description provided for @changeDate.
  ///
  /// In en, this message translates to:
  /// **'Change Date'**
  String get changeDate;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// No description provided for @progressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progressTitle;

  /// No description provided for @journeyTitle.
  ///
  /// In en, this message translates to:
  /// **'Journey'**
  String get journeyTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @homeWelcome.
  ///
  /// In en, this message translates to:
  /// **'You\'re doing great.'**
  String get homeWelcome;

  /// No description provided for @homeDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Your journey begins here.'**
  String get homeDashboardTitle;

  /// No description provided for @homeDashboardDescription.
  ///
  /// In en, this message translates to:
  /// **'This is your empty dashboard. Later, you will see your stats and daily logs here.'**
  String get homeDashboardDescription;

  /// No description provided for @craveButton.
  ///
  /// In en, this message translates to:
  /// **'I feel like smoking'**
  String get craveButton;

  /// No description provided for @progressComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Stats & Milestones coming soon'**
  String get progressComingSoon;

  /// No description provided for @journeyComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Timeline history coming soon'**
  String get journeyComingSoon;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Our server is taking a moment. We\'ll be back with you shortly.'**
  String get serverError;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Connection lost. Please check your internet to stay on the path.'**
  String get networkError;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Let\'s take a breath and try again.'**
  String get unexpectedError;

  /// No description provided for @cacheError.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load your saved progress. We\'re working to fix it.'**
  String get cacheError;

  /// No description provided for @databaseError.
  ///
  /// In en, this message translates to:
  /// **'Your journey data is momentarily unavailable. Please try again.'**
  String get databaseError;

  /// No description provided for @fileError.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t access the necessary files. Let\'s try that again.'**
  String get fileError;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Day {days} smoke-free'**
  String homeGreeting(int days);

  /// No description provided for @moneySavedLabel.
  ///
  /// In en, this message translates to:
  /// **'Money Saved'**
  String get moneySavedLabel;

  /// No description provided for @cigsAvoidedLabel.
  ///
  /// In en, this message translates to:
  /// **'Cigarettes Avoided'**
  String get cigsAvoidedLabel;

  /// No description provided for @timeSmokeFreeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time Smoke-free'**
  String get timeSmokeFreeLabel;

  /// No description provided for @howWasYourDay.
  ///
  /// In en, this message translates to:
  /// **'How was your day?'**
  String get howWasYourDay;

  /// No description provided for @healthMilestonesTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Milestones'**
  String get healthMilestonesTitle;

  /// No description provided for @lungFunctionLabel.
  ///
  /// In en, this message translates to:
  /// **'Lung function improving'**
  String get lungFunctionLabel;

  /// No description provided for @circulationLabel.
  ///
  /// In en, this message translates to:
  /// **'Better circulation'**
  String get circulationLabel;

  /// No description provided for @heartRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Heart rate normalizing'**
  String get heartRateLabel;

  /// No description provided for @journeyHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Journey History'**
  String get journeyHistoryTitle;

  /// No description provided for @cleanStatus.
  ///
  /// In en, this message translates to:
  /// **'Clean'**
  String get cleanStatus;

  /// No description provided for @cravingStatus.
  ///
  /// In en, this message translates to:
  /// **'Craving'**
  String get cravingStatus;

  /// No description provided for @setbackStatus.
  ///
  /// In en, this message translates to:
  /// **'Setback'**
  String get setbackStatus;

  /// No description provided for @profileLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileLabel;

  /// No description provided for @quitPlanLabel.
  ///
  /// In en, this message translates to:
  /// **'Quit Plan'**
  String get quitPlanLabel;

  /// No description provided for @notificationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsLabel;

  /// No description provided for @subscriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscriptionLabel;

  /// No description provided for @privacyPolicyLabel.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyLabel;

  /// No description provided for @privacyCommitment.
  ///
  /// In en, this message translates to:
  /// **'Your data stays on your device'**
  String get privacyCommitment;

  /// No description provided for @privacyCommitmentDesc.
  ///
  /// In en, this message translates to:
  /// **'Quitra is designed to be completely offline. Your personal journey data never leaves your device.'**
  String get privacyCommitmentDesc;

  /// No description provided for @privacyDataWeCollect.
  ///
  /// In en, this message translates to:
  /// **'Data we collect'**
  String get privacyDataWeCollect;

  /// No description provided for @privacyDataWeCollectDesc.
  ///
  /// In en, this message translates to:
  /// **'We store only what you choose to share: your quit plan, daily check-ins, and settings. This data stays entirely on your device.'**
  String get privacyDataWeCollectDesc;

  /// No description provided for @privacyDataWeDontCollect.
  ///
  /// In en, this message translates to:
  /// **'Data we don\'t collect'**
  String get privacyDataWeDontCollect;

  /// No description provided for @privacyDataWeDontCollectDesc.
  ///
  /// In en, this message translates to:
  /// **'No analytics. No cloud sync. No personal identifiers. We have no way to see or share your data.'**
  String get privacyDataWeDontCollectDesc;

  /// No description provided for @privacyYourControl.
  ///
  /// In en, this message translates to:
  /// **'Your control'**
  String get privacyYourControl;

  /// No description provided for @privacyYourControlDesc.
  ///
  /// In en, this message translates to:
  /// **'Export your data anytime via CSV. Your journey, your files.'**
  String get privacyYourControlDesc;

  /// No description provided for @privacyContact.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get privacyContact;

  /// No description provided for @privacyContactDesc.
  ///
  /// In en, this message translates to:
  /// **'Questions about privacy? We\'d love to hear from you.'**
  String get privacyContactDesc;

  /// No description provided for @cigarettePriceStepTitle.
  ///
  /// In en, this message translates to:
  /// **'What is the price of your cigarettes?'**
  String get cigarettePriceStepTitle;

  /// No description provided for @priceOptionSingle.
  ///
  /// In en, this message translates to:
  /// **'Single Cigarette'**
  String get priceOptionSingle;

  /// No description provided for @priceOptionPacket.
  ///
  /// In en, this message translates to:
  /// **'Packet'**
  String get priceOptionPacket;

  /// No description provided for @singleCigarettePriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price per cigarette'**
  String get singleCigarettePriceLabel;

  /// No description provided for @packetPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price per packet'**
  String get packetPriceLabel;

  /// No description provided for @cigarettesPerPacketLabel.
  ///
  /// In en, this message translates to:
  /// **'Cigarettes per packet'**
  String get cigarettesPerPacketLabel;

  /// No description provided for @priceRequired.
  ///
  /// In en, this message translates to:
  /// **'Price is required'**
  String get priceRequired;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get invalidNumber;

  /// No description provided for @journeyStartMessage.
  ///
  /// In en, this message translates to:
  /// **'Your journey starts here.'**
  String get journeyStartMessage;

  /// No description provided for @cravingsRecorded.
  ///
  /// In en, this message translates to:
  /// **'Cravings recorded'**
  String get cravingsRecorded;

  /// No description provided for @setbackRecorded.
  ///
  /// In en, this message translates to:
  /// **'Setback recorded'**
  String get setbackRecorded;

  /// No description provided for @didYouSmokeToday.
  ///
  /// In en, this message translates to:
  /// **'Did you smoke today?'**
  String get didYouSmokeToday;

  /// No description provided for @cravingsIntensity.
  ///
  /// In en, this message translates to:
  /// **'Cravings intensity'**
  String get cravingsIntensity;

  /// No description provided for @addNoteOptional.
  ///
  /// In en, this message translates to:
  /// **'Add a note (optional)'**
  String get addNoteOptional;

  /// No description provided for @saveJournal.
  ///
  /// In en, this message translates to:
  /// **'Save Journal'**
  String get saveJournal;

  /// No description provided for @detailedInsights.
  ///
  /// In en, this message translates to:
  /// **'Detailed Insights'**
  String get detailedInsights;

  /// No description provided for @lifeRegainedLabel.
  ///
  /// In en, this message translates to:
  /// **'Life Regained'**
  String get lifeRegainedLabel;

  /// No description provided for @cleanStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'Clean Streak'**
  String get cleanStreakLabel;

  /// No description provided for @dayDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Day Details'**
  String get dayDetailsTitle;

  /// No description provided for @journalNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Journal Note'**
  String get journalNoteLabel;

  /// No description provided for @editNoteAction.
  ///
  /// In en, this message translates to:
  /// **'Edit Note'**
  String get editNoteAction;

  /// No description provided for @saveNoteAction.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveNoteAction;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @cigarettePriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Cigarette Price'**
  String get cigarettePriceLabel;

  /// No description provided for @saveAction.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveAction;

  /// No description provided for @cancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelAction;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @turkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get turkish;

  /// No description provided for @dailyReminderLabel.
  ///
  /// In en, this message translates to:
  /// **'Daily Reminder'**
  String get dailyReminderLabel;

  /// No description provided for @dailyReminderDescription.
  ///
  /// In en, this message translates to:
  /// **'Get reminded to check in daily'**
  String get dailyReminderDescription;

  /// No description provided for @reminderTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Reminder Time'**
  String get reminderTimeLabel;

  /// No description provided for @milestoneCelebrationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Milestone Celebrations'**
  String get milestoneCelebrationsLabel;

  /// No description provided for @milestoneCelebrationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Celebrate your progress milestones'**
  String get milestoneCelebrationsDescription;

  /// No description provided for @dailyReminderNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Quitra'**
  String get dailyReminderNotificationTitle;

  /// No description provided for @dailyReminderNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Time for your check-in. We\'re here for you.'**
  String get dailyReminderNotificationBody;

  /// No description provided for @milestone7Title.
  ///
  /// In en, this message translates to:
  /// **'One week strong.'**
  String get milestone7Title;

  /// No description provided for @milestone7Body.
  ///
  /// In en, this message translates to:
  /// **'You\'re doing better than you think.'**
  String get milestone7Body;

  /// No description provided for @milestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Two weeks strong.'**
  String get milestone14Title;

  /// No description provided for @milestone14Body.
  ///
  /// In en, this message translates to:
  /// **'Every step matters.'**
  String get milestone14Body;

  /// No description provided for @milestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One month strong.'**
  String get milestone30Title;

  /// No description provided for @milestone30Body.
  ///
  /// In en, this message translates to:
  /// **'This is real progress.'**
  String get milestone30Body;

  /// No description provided for @milestone60Title.
  ///
  /// In en, this message translates to:
  /// **'Sixty days strong.'**
  String get milestone60Title;

  /// No description provided for @milestone60Body.
  ///
  /// In en, this message translates to:
  /// **'You\'re building something.'**
  String get milestone60Body;

  /// No description provided for @milestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three months strong.'**
  String get milestone90Title;

  /// No description provided for @milestone90Body.
  ///
  /// In en, this message translates to:
  /// **'You\'ve got this.'**
  String get milestone90Body;

  /// No description provided for @milestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Half a year.'**
  String get milestone180Title;

  /// No description provided for @milestone180Body.
  ///
  /// In en, this message translates to:
  /// **'Your journey, your strength.'**
  String get milestone180Body;

  /// No description provided for @milestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One year free.'**
  String get milestone365Title;

  /// No description provided for @milestone365Body.
  ///
  /// In en, this message translates to:
  /// **'You\'re free. Congratulations.'**
  String get milestone365Body;

  /// No description provided for @exportDataLabel.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportDataLabel;

  /// No description provided for @exportDataSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data exported successfully'**
  String get exportDataSuccess;

  /// No description provided for @exportDataError.
  ///
  /// In en, this message translates to:
  /// **'Failed to export data'**
  String get exportDataError;

  /// No description provided for @exportDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Export all your data as a CSV file'**
  String get exportDataDescription;

  /// No description provided for @onboardingImportTitle.
  ///
  /// In en, this message translates to:
  /// **'Import your data'**
  String get onboardingImportTitle;

  /// No description provided for @onboardingImportDescription.
  ///
  /// In en, this message translates to:
  /// **'Already have a backup? Import your CSV file to continue where you left off.'**
  String get onboardingImportDescription;

  /// No description provided for @onboardingImportAction.
  ///
  /// In en, this message translates to:
  /// **'Select CSV File'**
  String get onboardingImportAction;

  /// No description provided for @onboardingImportSkip.
  ///
  /// In en, this message translates to:
  /// **'I\'m new here, skip'**
  String get onboardingImportSkip;

  /// No description provided for @onboardingImportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data imported successfully!'**
  String get onboardingImportSuccess;

  /// Share text when starting journey
  ///
  /// In en, this message translates to:
  /// **'Starting my smoke-free journey! Join me on Quitra'**
  String get shareJourneyStarting;

  /// Share text with days smoke-free
  ///
  /// In en, this message translates to:
  /// **'I\'m {days} days smoke-free! Join me on Quitra'**
  String shareJourneyDaysSmokeFree(int days);

  /// Prompt in craving dialog
  ///
  /// In en, this message translates to:
  /// **'Take a breath. Be honest with yourself.'**
  String get takeBreathHonest;

  /// Button when resisting craving
  ///
  /// In en, this message translates to:
  /// **'I stayed strong'**
  String get iStayedStrong;

  /// Button when having smoked
  ///
  /// In en, this message translates to:
  /// **'I had one cigarette'**
  String get iHadOneCigarette;

  /// Ad prompt for recording
  ///
  /// In en, this message translates to:
  /// **'Watch ad to record'**
  String get watchAdToRecord;

  /// Mark day as smoked
  ///
  /// In en, this message translates to:
  /// **'Mark as smoked'**
  String get markAsSmoked;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share Journey'**
  String get share;

  /// No description provided for @thisWeekTitle.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeekTitle;

  /// No description provided for @yourStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'Your Streak'**
  String get yourStreakLabel;

  /// No description provided for @streakAtRiskTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your streak going.'**
  String get streakAtRiskTitle;

  /// No description provided for @streakAtRiskBody.
  ///
  /// In en, this message translates to:
  /// **'Take a minute to log your day in Quitra.'**
  String get streakAtRiskBody;

  /// No description provided for @streakModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Streak Mode'**
  String get streakModeLabel;

  /// No description provided for @streakModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose how your daily streak handles setbacks.'**
  String get streakModeDescription;

  /// No description provided for @forgivingModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Forgiving Mode'**
  String get forgivingModeLabel;

  /// No description provided for @strictModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Strict Mode'**
  String get strictModeLabel;

  /// No description provided for @forgivingModeDesc.
  ///
  /// In en, this message translates to:
  /// **'One grace pass per week so one difficult moment doesn\'t reset all your hard work.'**
  String get forgivingModeDesc;

  /// No description provided for @strictModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Streak resets immediately to 0 on any setback or missed check-in.'**
  String get strictModeDesc;

  /// No description provided for @recommendedLabel.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommendedLabel;

  /// No description provided for @dayStreak.
  ///
  /// In en, this message translates to:
  /// **'Day streak'**
  String get dayStreak;

  /// No description provided for @startYourStreak.
  ///
  /// In en, this message translates to:
  /// **'Start your streak'**
  String get startYourStreak;

  /// No description provided for @cravingTrendTitle.
  ///
  /// In en, this message translates to:
  /// **'Craving Trend'**
  String get cravingTrendTitle;

  /// Number of craving moments in trend chart
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 moment} other{{count} moments}}'**
  String cravingMomentsCount(int count);

  /// No description provided for @dayShort.
  ///
  /// In en, this message translates to:
  /// **'d'**
  String get dayShort;

  /// Button to watch rewarded ad and save daily check-in journal
  ///
  /// In en, this message translates to:
  /// **'Watch Ad & Save Journal'**
  String get watchAdAndSaveJournal;

  /// Hint text explaining that ads support ongoing improvements
  ///
  /// In en, this message translates to:
  /// **'Watching ads helps us keep Quitra free and constantly improving.'**
  String get watchAdHint;

  /// No description provided for @yourMilestonesTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Milestones'**
  String get yourMilestonesTitle;

  /// No description provided for @strengthAndDedicationTitle.
  ///
  /// In en, this message translates to:
  /// **'Strength & Dedication'**
  String get strengthAndDedicationTitle;

  /// No description provided for @milestoneCategoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get milestoneCategoryAll;

  /// No description provided for @milestoneCategoryTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get milestoneCategoryTime;

  /// No description provided for @milestoneCategoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get milestoneCategoryHealth;

  /// No description provided for @milestoneCategorySavings.
  ///
  /// In en, this message translates to:
  /// **'Savings'**
  String get milestoneCategorySavings;

  /// No description provided for @milestoneCategoryStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get milestoneCategoryStreak;

  /// No description provided for @milestoneCategoryStrength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get milestoneCategoryStrength;

  /// No description provided for @milestoneCategoryDedication.
  ///
  /// In en, this message translates to:
  /// **'Dedication'**
  String get milestoneCategoryDedication;

  /// No description provided for @milestoneFirstDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Day One'**
  String get milestoneFirstDayTitle;

  /// No description provided for @milestoneFirstDayDesc.
  ///
  /// In en, this message translates to:
  /// **'The first step is always the hardest. You took it.'**
  String get milestoneFirstDayDesc;

  /// No description provided for @milestoneThreeDaysTitle.
  ///
  /// In en, this message translates to:
  /// **'Three Days Clean'**
  String get milestoneThreeDaysTitle;

  /// No description provided for @milestoneThreeDaysDesc.
  ///
  /// In en, this message translates to:
  /// **'Nicotine is leaving your body. You\'re regaining control.'**
  String get milestoneThreeDaysDesc;

  /// No description provided for @milestoneOneWeekTitle.
  ///
  /// In en, this message translates to:
  /// **'One Week Strong'**
  String get milestoneOneWeekTitle;

  /// No description provided for @milestoneOneWeekDesc.
  ///
  /// In en, this message translates to:
  /// **'You\'re doing better than you think. A full week behind you.'**
  String get milestoneOneWeekDesc;

  /// No description provided for @milestoneTwoWeeksTitle.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Clean'**
  String get milestoneTwoWeeksTitle;

  /// No description provided for @milestoneTwoWeeksDesc.
  ///
  /// In en, this message translates to:
  /// **'Every step matters. Cravings are losing their grip.'**
  String get milestoneTwoWeeksDesc;

  /// No description provided for @milestoneOneMonthTitle.
  ///
  /// In en, this message translates to:
  /// **'One Month Free'**
  String get milestoneOneMonthTitle;

  /// No description provided for @milestoneOneMonthDesc.
  ///
  /// In en, this message translates to:
  /// **'This is real progress. You\'ve redefined your daily rhythm.'**
  String get milestoneOneMonthDesc;

  /// No description provided for @milestoneThreeMonthsTitle.
  ///
  /// In en, this message translates to:
  /// **'Three Months'**
  String get milestoneThreeMonthsTitle;

  /// No description provided for @milestoneThreeMonthsDesc.
  ///
  /// In en, this message translates to:
  /// **'You\'ve built lasting resilience. You\'ve got this.'**
  String get milestoneThreeMonthsDesc;

  /// No description provided for @milestoneSixMonthsTitle.
  ///
  /// In en, this message translates to:
  /// **'Half a Year'**
  String get milestoneSixMonthsTitle;

  /// No description provided for @milestoneSixMonthsDesc.
  ///
  /// In en, this message translates to:
  /// **'Six months of freedom. Your journey, your strength.'**
  String get milestoneSixMonthsDesc;

  /// No description provided for @milestoneOneYearTitle.
  ///
  /// In en, this message translates to:
  /// **'One Year Free'**
  String get milestoneOneYearTitle;

  /// No description provided for @milestoneOneYearDesc.
  ///
  /// In en, this message translates to:
  /// **'A full year of choosing yourself. You\'re free.'**
  String get milestoneOneYearDesc;

  /// No description provided for @milestoneHeartHealingTitle.
  ///
  /// In en, this message translates to:
  /// **'Heart Rhythm Restored'**
  String get milestoneHeartHealingTitle;

  /// No description provided for @milestoneHeartHealingDesc.
  ///
  /// In en, this message translates to:
  /// **'Your heart rate and blood pressure have returned to normal levels.'**
  String get milestoneHeartHealingDesc;

  /// No description provided for @milestoneCirculationTitle.
  ///
  /// In en, this message translates to:
  /// **'Vital Circulation'**
  String get milestoneCirculationTitle;

  /// No description provided for @milestoneCirculationDesc.
  ///
  /// In en, this message translates to:
  /// **'Oxygen flows freely again. Movement and energy feel lighter.'**
  String get milestoneCirculationDesc;

  /// No description provided for @milestoneBreathingTitle.
  ///
  /// In en, this message translates to:
  /// **'Clearer Breathing'**
  String get milestoneBreathingTitle;

  /// No description provided for @milestoneBreathingDesc.
  ///
  /// In en, this message translates to:
  /// **'Your airways are recovering. Breathing is calm and deep.'**
  String get milestoneBreathingDesc;

  /// No description provided for @milestoneSaved10Title.
  ///
  /// In en, this message translates to:
  /// **'First Savings'**
  String get milestoneSaved10Title;

  /// No description provided for @milestoneSaved10Desc.
  ///
  /// In en, this message translates to:
  /// **'Your first money saved. Proof that every decision counts.'**
  String get milestoneSaved10Desc;

  /// No description provided for @milestoneSaved50Title.
  ///
  /// In en, this message translates to:
  /// **'Growing Pocket'**
  String get milestoneSaved50Title;

  /// No description provided for @milestoneSaved50Desc.
  ///
  /// In en, this message translates to:
  /// **'Fifty saved. Money kept in your pocket, not burned in smoke.'**
  String get milestoneSaved50Desc;

  /// No description provided for @milestoneSaved100Title.
  ///
  /// In en, this message translates to:
  /// **'Milestone Century'**
  String get milestoneSaved100Title;

  /// No description provided for @milestoneSaved100Desc.
  ///
  /// In en, this message translates to:
  /// **'A hundred saved. A tangible reward for your commitment.'**
  String get milestoneSaved100Desc;

  /// No description provided for @milestoneSaved500Title.
  ///
  /// In en, this message translates to:
  /// **'Financial Freedom'**
  String get milestoneSaved500Title;

  /// No description provided for @milestoneSaved500Desc.
  ///
  /// In en, this message translates to:
  /// **'Five hundred preserved. Taking back control of your resources.'**
  String get milestoneSaved500Desc;

  /// No description provided for @milestoneStreak7Title.
  ///
  /// In en, this message translates to:
  /// **'7-Day Focus'**
  String get milestoneStreak7Title;

  /// No description provided for @milestoneStreak7Desc.
  ///
  /// In en, this message translates to:
  /// **'Seven consecutive days of self-control. Momentum is building.'**
  String get milestoneStreak7Desc;

  /// No description provided for @milestoneStreak30Title.
  ///
  /// In en, this message translates to:
  /// **'Solid Habit'**
  String get milestoneStreak30Title;

  /// No description provided for @milestoneStreak30Desc.
  ///
  /// In en, this message translates to:
  /// **'Thirty straight days. New neural pathways are flourishing.'**
  String get milestoneStreak30Desc;

  /// No description provided for @milestoneStreak100Title.
  ///
  /// In en, this message translates to:
  /// **'Unshakeable'**
  String get milestoneStreak100Title;

  /// No description provided for @milestoneStreak100Desc.
  ///
  /// In en, this message translates to:
  /// **'One hundred unbroken days. You are truly in control.'**
  String get milestoneStreak100Desc;

  /// No description provided for @milestoneFirstMomentTitle.
  ///
  /// In en, this message translates to:
  /// **'First Moment Passed'**
  String get milestoneFirstMomentTitle;

  /// No description provided for @milestoneFirstMomentDesc.
  ///
  /// In en, this message translates to:
  /// **'You paused, breathed, and let it pass. Proof that cravings fade.'**
  String get milestoneFirstMomentDesc;

  /// No description provided for @milestoneTenMomentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Ten Victories'**
  String get milestoneTenMomentsTitle;

  /// No description provided for @milestoneTenMomentsDesc.
  ///
  /// In en, this message translates to:
  /// **'Ten difficult urges faced and overcome without giving in.'**
  String get milestoneTenMomentsDesc;

  /// No description provided for @milestoneFiftyMomentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Master of Moments'**
  String get milestoneFiftyMomentsTitle;

  /// No description provided for @milestoneFiftyMomentsDesc.
  ///
  /// In en, this message translates to:
  /// **'Fifty moments mastered. Cravings no longer dictate your choices.'**
  String get milestoneFiftyMomentsDesc;

  /// No description provided for @milestoneSevenCheckInsTitle.
  ///
  /// In en, this message translates to:
  /// **'First Week of Check-Ins'**
  String get milestoneSevenCheckInsTitle;

  /// No description provided for @milestoneSevenCheckInsDesc.
  ///
  /// In en, this message translates to:
  /// **'Seven daily logs. Honest reflection keeps you anchored.'**
  String get milestoneSevenCheckInsDesc;

  /// No description provided for @milestoneThirtyCheckInsTitle.
  ///
  /// In en, this message translates to:
  /// **'A Month of Awareness'**
  String get milestoneThirtyCheckInsTitle;

  /// No description provided for @milestoneThirtyCheckInsDesc.
  ///
  /// In en, this message translates to:
  /// **'Thirty daily reflections. Self-awareness is your superpower.'**
  String get milestoneThirtyCheckInsDesc;

  /// No description provided for @nextMilestoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Next Milestone'**
  String get nextMilestoneTitle;

  /// No description provided for @milestoneComplete.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get milestoneComplete;

  /// No description provided for @allMilestonesAchieved.
  ///
  /// In en, this message translates to:
  /// **'All Milestones Achieved!'**
  String get allMilestonesAchieved;

  /// No description provided for @allMilestonesAchievedDesc.
  ///
  /// In en, this message translates to:
  /// **'You have achieved every single milestone on your journey. Truly remarkable!'**
  String get allMilestonesAchievedDesc;

  /// No description provided for @notesCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 note} other{{count} notes}}'**
  String notesCount(int count);

  /// No description provided for @notesLoggedToday.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 note logged today} other{{count} notes logged today}}'**
  String notesLoggedToday(int count);

  /// No description provided for @addNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Add a reflection or thought...'**
  String get addNoteHint;

  /// No description provided for @addNoteAction.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get addNoteAction;

  /// No description provided for @todayNotesTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Reflections'**
  String get todayNotesTitle;

  /// No description provided for @noNotesRecorded.
  ///
  /// In en, this message translates to:
  /// **'No notes recorded for this day.'**
  String get noNotesRecorded;

  /// No description provided for @appendNote.
  ///
  /// In en, this message translates to:
  /// **'Append Note'**
  String get appendNote;

  /// No description provided for @iSmoked.
  ///
  /// In en, this message translates to:
  /// **'I Smoked'**
  String get iSmoked;

  /// No description provided for @captureReflection.
  ///
  /// In en, this message translates to:
  /// **'Capture a Reflection'**
  String get captureReflection;

  /// No description provided for @reflectionHint.
  ///
  /// In en, this message translates to:
  /// **'What\'s on your mind right now?'**
  String get reflectionHint;

  /// No description provided for @saveReflection.
  ///
  /// In en, this message translates to:
  /// **'Save Reflection'**
  String get saveReflection;

  /// No description provided for @setbackTitle.
  ///
  /// In en, this message translates to:
  /// **'A Setback is Not Defeat'**
  String get setbackTitle;

  /// No description provided for @setbackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Every breath is a fresh opportunity. Honesty with yourself is your greatest strength.'**
  String get setbackSubtitle;

  /// No description provided for @logSetbackAction.
  ///
  /// In en, this message translates to:
  /// **'Log Setback & Keep Going'**
  String get logSetbackAction;

  /// No description provided for @triggerReflectionHint.
  ///
  /// In en, this message translates to:
  /// **'What triggered this moment? (Optional)'**
  String get triggerReflectionHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
