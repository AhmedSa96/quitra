// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Quitra';

  @override
  String get appVersion => 'v1.0.0';

  @override
  String get digitalSanctuary => 'ملاذ رقمي';

  @override
  String stepProgress(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get continueButton => 'استمرار';

  @override
  String get onboardingError => 'فشل إكمال الإعداد. يرجى المحاولة مرة أخرى.';

  @override
  String get cigarettesPerDayQuestion => 'كم سيجارة تدخن في اليوم؟';

  @override
  String get yearsSmokingQuestion => 'منذ كم سنة وأنت تدخن؟';

  @override
  String get quitMethodQuestion => 'كيف ترغب في الإقلاع؟';

  @override
  String get coldTurkeyTitle => 'الإقلاع المفاجئ';

  @override
  String get coldTurkeyDescription => 'توقف تماماً الآن.';

  @override
  String get gradualTitle => 'تقليل تدريجي';

  @override
  String get gradualDescription => 'قلل تدريجياً بمرور الوقت.';

  @override
  String get quitDateQuestion => 'متى هو تاريخ بدء الإقلاع؟';

  @override
  String get changeDate => 'تغيير التاريخ';

  @override
  String get homeTitle => 'الرئيسية';

  @override
  String get progressTitle => 'التقدم';

  @override
  String get journeyTitle => 'الرحلة';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get homeWelcome => 'أنت تبلي بلاءً حسناً.';

  @override
  String get homeDashboardTitle => 'رحلتك تبدأ من هنا.';

  @override
  String get homeDashboardDescription =>
      'هذه هي لوحة التحكم الخاصة بك. لاحقاً، سترى إحصائياتك وسجلاتك اليومية هنا.';

  @override
  String get craveButton => 'أشعر بالرغبة في التدخين';

  @override
  String get progressComingSoon => 'الإحصائيات والإنجازات قريباً';

  @override
  String get journeyComingSoon => 'سجل الخط الزمني قريباً';

  @override
  String get serverError => 'خادمنا يواجه مشكلة حالياً. سنعود إليك قريباً.';

  @override
  String get networkError =>
      'انقطع الاتصال. يرجى التحقق من الإنترنت للبقاء على المسار.';

  @override
  String get unexpectedError =>
      'حدث خطأ غير متوقع. خذ نفساً عميقاً وحاول مجدداً.';

  @override
  String get cacheError => 'تعذر تحميل تقدمك المحفوظ. نحن نعمل على إصلاح ذلك.';

  @override
  String get databaseError =>
      'بيانات رحلتك غير متوفرة حالياً. يرجى المحاولة مرة أخرى.';

  @override
  String get fileError => 'تعذر الوصول إلى الملفات الضرورية. لنحاول مرة أخرى.';

  @override
  String homeGreeting(int days) {
    return 'اليوم $days بدون تدخين';
  }

  @override
  String get moneySavedLabel => 'الأموال الموفرة';

  @override
  String get cigsAvoidedLabel => 'سجائر تم تجنبها';

  @override
  String get timeSmokeFreeLabel => 'وقت بدون تدخين';

  @override
  String get howWasYourDay => 'كيف كان يومك؟';

  @override
  String get healthMilestonesTitle => 'إنجازات صحية';

  @override
  String get lungFunctionLabel => 'تحسن وظائف الرئة';

  @override
  String get circulationLabel => 'تحسن الدورة الدموية';

  @override
  String get heartRateLabel => 'انتظام ضربات القلب';

  @override
  String get journeyHistoryTitle => 'سجل الرحلة';

  @override
  String get cleanStatus => 'نظيف';

  @override
  String get cravingStatus => 'رغبة';

  @override
  String get setbackStatus => 'انتكاسة';

  @override
  String get profileLabel => 'الملف الشخصي';

  @override
  String get quitPlanLabel => 'خطة الإقلاع';

  @override
  String get notificationsLabel => 'الإشعارات';

  @override
  String get subscriptionLabel => 'الاشتراك';

  @override
  String get privacyPolicyLabel => 'سياسة الخصوصية';

  @override
  String get cigarettePriceStepTitle => 'ما هو سعر سجائرك؟';

  @override
  String get priceOptionSingle => 'سيجارة واحدة';

  @override
  String get priceOptionPacket => 'علبة';

  @override
  String get singleCigarettePriceLabel => 'سعر السيجارة الواحدة';

  @override
  String get packetPriceLabel => 'سعر العلبة';

  @override
  String get cigarettesPerPacketLabel => 'عدد السجائر في العلبة';

  @override
  String get priceRequired => 'السعر مطلوب';

  @override
  String get invalidNumber => 'يرجى إدخال رقم صحيح';

  @override
  String get journeyStartMessage => 'رحلتك تبدأ هنا.';

  @override
  String get cravingsRecorded => 'تم تسجيل رغبات';

  @override
  String get setbackRecorded => 'تم تسجيل انتكاسة';

  @override
  String get didYouSmokeToday => 'هل دخنت اليوم؟';

  @override
  String get cravingsIntensity => 'شدة الرغبة';

  @override
  String get addNoteOptional => 'إضافة ملاحظة (اختياري)';

  @override
  String get saveJournal => 'حفظ السجل';

  @override
  String get detailedInsights => 'إحصائيات مفصلة';

  @override
  String get lifeRegainedLabel => 'حياة مستردة';

  @override
  String get cleanStreakLabel => 'سلسلة أيام نظيفة';

  @override
  String get dayDetailsTitle => 'تفاصيل اليوم';

  @override
  String get journalNoteLabel => 'ملاحظة السجل';

  @override
  String get editNoteAction => 'تعديل الملاحظة';

  @override
  String get saveNoteAction => 'حفظ التغييرات';

  @override
  String get languageLabel => 'اللغة';

  @override
  String get cigarettePriceLabel => 'سعر السيجارة';

  @override
  String get saveAction => 'حفظ';

  @override
  String get cancelAction => 'إلغاء';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get turkish => 'التركية';

  @override
  String get dailyReminderLabel => 'تذكير يومي';

  @override
  String get dailyReminderDescription => 'احصل على تذكير لتسجيل يومك';

  @override
  String get reminderTimeLabel => 'وقت التذكير';

  @override
  String get milestoneCelebrationsLabel => 'احتفالات الإنجازات';

  @override
  String get milestoneCelebrationsDescription => 'احتفل بإنجازاتك';
}
