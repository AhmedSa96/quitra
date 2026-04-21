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
