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
  String get privacyCommitment => 'بياناتك تظل على جهازك';

  @override
  String get privacyCommitmentDesc =>
      'تم تصميم Quitra ليكون بالكامل بدون اتصال. لا تترك بيانات رحلتك الشخصية جهازك أبداً.';

  @override
  String get privacyDataWeCollect => 'البيانات التي نجمعها';

  @override
  String get privacyDataWeCollectDesc =>
      'نخزن فقط ما تختار مشاركته: خطة الإقلاع، عمليات التسجيل اليومية والإعدادات. تظل هذه البيانات بالكامل على جهازك.';

  @override
  String get privacyDataWeDontCollect => 'البيانات التي لا نجمعها';

  @override
  String get privacyDataWeDontCollectDesc =>
      'لا تحليلات. لا مزامنة سحابية. لا معرفات شخصية. ليس لدينا طريقة لرؤية أو مشاركة بياناتك.';

  @override
  String get privacyYourControl => 'تحكمك';

  @override
  String get privacyYourControlDesc =>
      'صدّر بياناتك في أي وقت عبر CSV. رحلتك، ملفاتك.';

  @override
  String get privacyContact => 'تواصل معنا';

  @override
  String get privacyContactDesc => 'أسئلة حول الخصوصية؟ نود أن نسمع منك.';

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

  @override
  String get dailyReminderNotificationTitle => 'Quitra';

  @override
  String get dailyReminderNotificationBody =>
      'حان وقت تسجيلنا. نحن هنا من أجلك.';

  @override
  String get milestone7Title => 'أسبوع كامل.';

  @override
  String get milestone7Body => ' أنت أفضل مما تظن.';

  @override
  String get milestone14Title => 'أسبوعان.';

  @override
  String get milestone14Body => 'كل خطوة مهمة.';

  @override
  String get milestone30Title => 'شهر كامل.';

  @override
  String get milestone30Body => 'هذا تقدم حقيقي.';

  @override
  String get milestone60Title => 'ستون يوماً.';

  @override
  String get milestone60Body => 'تبني شيئاً مهماً.';

  @override
  String get milestone90Title => 'ثلاثة أشهر.';

  @override
  String get milestone90Body => 'لديك هذا.';

  @override
  String get milestone180Title => 'نصف سنة.';

  @override
  String get milestone180Body => 'رحلتك وقوتك.';

  @override
  String get milestone365Title => 'سنة كاملة.';

  @override
  String get milestone365Body => ' أنت حر. مبارك.';

  @override
  String get exportDataLabel => 'تصدير البيانات';

  @override
  String get exportDataSuccess => 'تم تصدير البيانات بنجاح';

  @override
  String get exportDataError => 'فشل تصدير البيانات';

  @override
  String get exportDataDescription => 'تصدير كل بياناتك كملف CSV';

  @override
  String get onboardingImportTitle => 'استيراد بياناتك';

  @override
  String get onboardingImportDescription =>
      'هل لديك نسخة احتياطية؟ استورد ملف CSV للمتابعة من حيث توقفت.';

  @override
  String get onboardingImportAction => 'اختر ملف CSV';

  @override
  String get onboardingImportSkip => 'أنا جديد هنا، تخطي';

  @override
  String get onboardingImportSuccess => 'تم استيراد البيانات بنجاح!';

  @override
  String get shareJourneyStarting =>
      'أبدأ رحلتي بدون تدخين! انضم إلي على Quitra';

  @override
  String shareJourneyDaysSmokeFree(int days) {
    return '$days يوم بدون تدخين! انضم إلي على Quitra';
  }

  @override
  String get takeBreathHonest => 'خذ نفساً. كن صادقاً مع نفسك.';

  @override
  String get iStayedStrong => 'بقيت قوياً';

  @override
  String get iHadOneCigarette => 'دخنت سيجارة واحدة';

  @override
  String get watchAdToRecord => 'شاهد إعلاناً للتسجيل';

  @override
  String get markAsSmoked => 'علّم كمدخن';

  @override
  String get somethingWentWrong => 'حدث خطأ ما';

  @override
  String get share => 'مشاركة الرحلة';

  @override
  String get thisWeekTitle => 'هذا الأسبوع';

  @override
  String get yourStreakLabel => 'سلسلتك';

  @override
  String get streakAtRiskTitle => 'حافظ على سلسلتك مستمرة.';

  @override
  String get streakAtRiskBody => 'خذ دقيقة لتسجيل يومك في Quitra.';

  @override
  String get streakModeLabel => 'وضع السلسلة';

  @override
  String get streakModeDescription =>
      'اختر كيف تتعامل سلسلتك اليومية مع الصعوبات والانتكاسات.';

  @override
  String get forgivingModeLabel => 'الوضع المرن';

  @override
  String get strictModeLabel => 'الوضع الصارم';

  @override
  String get forgivingModeDesc =>
      'فرصة سماح واحدة أسبوعياً حتى لا تفقد تقدمك بعد لحظة صعبة واحدة.';

  @override
  String get strictModeDesc =>
      'تتم إعادة ضبط السلسلة إلى الصفر فوراً عند أي انتكاسة.';

  @override
  String get recommendedLabel => 'موصى به';

  @override
  String get dayStreak => 'أيام متتالية';

  @override
  String get startYourStreak => 'ابدأ سلسلتك';

  @override
  String get cravingTrendTitle => 'مسار الرغبات';

  @override
  String cravingMomentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count لحظة',
      many: '$count لحظة',
      few: '$count لحظات',
      two: 'لحظتان',
      one: 'لحظة واحدة',
      zero: '0 لحظات',
    );
    return '$_temp0';
  }

  @override
  String get dayShort => 'ي';

  @override
  String get watchAdAndSaveJournal => 'شاهد إعلاناً واحفظ اليوميات';

  @override
  String get watchAdHint =>
      'مشاهدة الإعلانات تساعدنا على الاستمرار في تطوير Quitra مجاناً.';

  @override
  String get yourMilestonesTitle => 'إنجازاتك';

  @override
  String get strengthAndDedicationTitle => 'القوة والالتزام';

  @override
  String get milestoneCategoryAll => 'الكل';

  @override
  String get milestoneCategoryTime => 'الوقت';

  @override
  String get milestoneCategoryHealth => 'الصحة';

  @override
  String get milestoneCategorySavings => 'التوفير';

  @override
  String get milestoneCategoryStreak => 'الاستمرار';

  @override
  String get milestoneCategoryStrength => 'القوة';

  @override
  String get milestoneCategoryDedication => 'الالتزام';

  @override
  String get milestoneFirstDayTitle => 'اليوم الأول';

  @override
  String get milestoneFirstDayDesc =>
      'الخطوة الأولى هي الأهم دائماً. وقد خطوتها بنجاح.';

  @override
  String get milestoneThreeDaysTitle => 'ثلاثة أيام من النقاء';

  @override
  String get milestoneThreeDaysDesc =>
      'النيكوتين يغادر جسدك. أنت تستعيد زمام السيطرة.';

  @override
  String get milestoneOneWeekTitle => 'أسبوع كامل';

  @override
  String get milestoneOneWeekDesc => 'أنت أفضل مما تظن. أسبوع كامل وراء ظهرك.';

  @override
  String get milestoneTwoWeeksTitle => 'أسبوعان من النقاء';

  @override
  String get milestoneTwoWeeksDesc =>
      'كل خطوة تصنع فارقاً. الرغبة الملحة تفقد سيطرتها.';

  @override
  String get milestoneOneMonthTitle => 'شهر من الحرية';

  @override
  String get milestoneOneMonthDesc =>
      'هذا تقدم حقيقي. لقد أعدت رسم إيقاع يومك.';

  @override
  String get milestoneThreeMonthsTitle => 'ثلاثة أشهر';

  @override
  String get milestoneThreeMonthsDesc =>
      'بنيت ثباتاً متيناً. أنت قادر على المضي قدماً.';

  @override
  String get milestoneSixMonthsTitle => 'نصف عام';

  @override
  String get milestoneSixMonthsDesc =>
      'ستة أشهر من الحرية. رحلتك، وقوتك الحقيقية.';

  @override
  String get milestoneOneYearTitle => 'عام كامل من الحرية';

  @override
  String get milestoneOneYearDesc =>
      'عام كامل اخترت فيه صحتك ونفسك. أنت حر الآن.';

  @override
  String get milestoneHeartHealingTitle => 'انتظام نبض القلب';

  @override
  String get milestoneHeartHealingDesc =>
      'معدل ضربات قلبك وضغط دمك عادا إلى مستوياتهما الطبيعية.';

  @override
  String get milestoneCirculationTitle => 'حيوية الدورة الدموية';

  @override
  String get milestoneCirculationDesc =>
      'الأكسجين يتدفق بحرية أكبر. تشعر بخفة ونشاط متجدد.';

  @override
  String get milestoneBreathingTitle => 'تنفس أعمق';

  @override
  String get milestoneBreathingDesc =>
      'مسالكك التنفسية تتعافى. التنفس أصبح أكثر راحة وهدوءاً.';

  @override
  String get milestoneSaved10Title => 'أول توفير';

  @override
  String get milestoneSaved10Desc =>
      'أول مبلغ تدخره لصالحك. برهان على أن كل قرار يهم.';

  @override
  String get milestoneSaved50Title => 'مدخرات تنمو';

  @override
  String get milestoneSaved50Desc =>
      'خمسون ادخرتها. مال احتفظت به بدلاً من حرقه في الدخان.';

  @override
  String get milestoneSaved100Title => 'مئة محفوظة';

  @override
  String get milestoneSaved100Desc =>
      'مئة محفوظة. مكافأة ملموسة لالتزامك وصبرك.';

  @override
  String get milestoneSaved500Title => 'حرية مالية';

  @override
  String get milestoneSaved500Desc =>
      'خمسمائة وفرتها. استعدت السيطرة الكاملة على مواردك.';

  @override
  String get milestoneStreak7Title => 'تركيز لسبعة أيام';

  @override
  String get milestoneStreak7Desc =>
      'سبعة أيام متواصلة من التحكم بالذات. الزخم يزداد قوة.';

  @override
  String get milestoneStreak30Title => 'عادة راسخة';

  @override
  String get milestoneStreak30Desc =>
      'ثلاثون يوماً مستمراً. نمط حياتك الجديد يترسخ بقوة.';

  @override
  String get milestoneStreak100Title => 'عزيمة لا تلين';

  @override
  String get milestoneStreak100Desc =>
      'مئة يوم بلا انقطاع. أنت المسيطر الحقيقي على قراراتك.';

  @override
  String get milestoneFirstMomentTitle => 'تجاوز أول رغبة';

  @override
  String get milestoneFirstMomentDesc =>
      'توقفت، تنفست، وتركتها تمضي. الرغبة تزول وأنت تبقى.';

  @override
  String get milestoneTenMomentsTitle => 'عشر انتصارات';

  @override
  String get milestoneTenMomentsDesc =>
      'عشر لحظات صعبة واجهتها بوعي وهدوء وتغلبت عليها.';

  @override
  String get milestoneFiftyMomentsTitle => 'سيد اللحظات';

  @override
  String get milestoneFiftyMomentsDesc =>
      'خمسون لحظة انتصرت فيها. الرغبات لم تعد تحكمك.';

  @override
  String get milestoneSevenCheckInsTitle => 'أسبوع من المتابعة';

  @override
  String get milestoneSevenCheckInsDesc =>
      'سبع مراجعات يومية. المصارحة مع نفسك تمنحك الأمان والثبات.';

  @override
  String get milestoneThirtyCheckInsTitle => 'شهر من الوعي';

  @override
  String get milestoneThirtyCheckInsDesc =>
      'ثلاثون تسجيلاً يومياً. الوعي بذاتك هو سلاحك الأقوى.';

  @override
  String get nextMilestoneTitle => 'المحطة التالية';

  @override
  String get milestoneComplete => 'مكتمل';

  @override
  String get allMilestonesAchieved => 'تم تحقيق جميع المحطات!';

  @override
  String get allMilestonesAchievedDesc =>
      'لقد حققت جميع الإنجازات في رحلتك بنجاح. إنجاز استثنائي حقاً!';

  @override
  String notesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملاحظة',
      many: '$count ملاحظة',
      few: '$count ملاحظات',
      two: 'ملاحظتان',
      one: 'ملاحظة واحدة',
      zero: 'لا توجد ملاحظات',
    );
    return '$_temp0';
  }

  @override
  String notesLoggedToday(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملاحظة مسجلة اليوم',
      many: '$count ملاحظة مسجلة اليوم',
      few: '$count ملاحظات مسجلة اليوم',
      two: 'ملاحظتان مسجلتان اليوم',
      one: 'ملاحظة واحدة مسجلة اليوم',
      zero: 'لا توجد ملاحظات مسجلة اليوم',
    );
    return '$_temp0';
  }

  @override
  String get addNoteHint => 'أضف خاطرة أو ملاحظة...';

  @override
  String get addNoteAction => 'إضافة ملاحظة';

  @override
  String get todayNotesTitle => 'تأملات اليوم';

  @override
  String get noNotesRecorded => 'لا توجد ملاحظات مسجلة لهذا اليوم.';
}
