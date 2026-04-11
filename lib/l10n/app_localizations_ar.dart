// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'َQuitra';

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
  String get serverError => 'حدث خطأ في الخادم. يرجى المحاولة مرة أخرى.';

  @override
  String get networkError => 'خطأ في الشبكة. يرجى التحقق من اتصالك.';

  @override
  String get unexpectedError => 'حدث خطأ غير متوقع.';
}
