// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Quitra';

  @override
  String get appVersion => 'v1.0.0';

  @override
  String get digitalSanctuary => 'DİJİTAL BARINAK';

  @override
  String stepProgress(int current, int total) {
    return 'Adım $current / $total';
  }

  @override
  String get continueButton => 'Devam Et';

  @override
  String get onboardingError =>
      'Kayıt işlemi tamamlanamadı. Lütfen tekrar deneyin.';

  @override
  String get cigarettesPerDayQuestion => 'Günde kaç sigara içiyorsunuz?';

  @override
  String get yearsSmokingQuestion => 'Kaç yıldır sigara içiyorsunuz?';

  @override
  String get quitMethodQuestion => 'Nasıl bırakmak istersiniz?';

  @override
  String get coldTurkeyTitle => 'Birden Bırakma';

  @override
  String get coldTurkeyDescription => 'Şu anda tamamen durun.';

  @override
  String get gradualTitle => 'Kademeli Azaltma';

  @override
  String get gradualDescription => 'Zaman içinde yavaş yavaş azaltın.';

  @override
  String get quitDateQuestion => 'Bırakma tarihiniz nedir?';

  @override
  String get changeDate => 'Tarihi Değiştir';

  @override
  String get homeTitle => 'Ana Sayfa';

  @override
  String get progressTitle => 'Gelişim';

  @override
  String get journeyTitle => 'Yolculuk';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get homeWelcome => 'Harika gidiyorsun.';

  @override
  String get homeDashboardTitle => 'Yolculuğun burada başlıyor.';

  @override
  String get homeDashboardDescription =>
      'Bu senin boş panon. Daha sonra istatistiklerini ve günlük kayıtlarını burada göreceksin.';

  @override
  String get craveButton => 'Sigara içmek istiyorum';

  @override
  String get progressComingSoon => 'İstatistikler ve Kilometre Taşları yakında';

  @override
  String get journeyComingSoon => 'Zaman çizelgesi geçmişi yakında';

  @override
  String get serverError =>
      'Sunucumuz şu anda meşgul. Birazdan yanınızda olacağız.';

  @override
  String get networkError =>
      'Bağlantı kesildi. Yolunuza devam etmek için lütfen internetinizi kontrol edin.';

  @override
  String get unexpectedError =>
      'Beklenmedik bir durum oluştu. Bir nefes alın ve tekrar deneyin.';

  @override
  String get cacheError =>
      'Kaydedilen ilerlemeniz yüklenemedi. Sorunu çözmek için çalışıyoruz.';

  @override
  String get databaseError =>
      'Yolculuk verilerinize şu an ulaşılamıyor. Lütfen tekrar deneyin.';

  @override
  String get fileError =>
      'Gerekli dosyalara erişilemedi. Lütfen tekrar deneyin.';

  @override
  String homeGreeting(int days) {
    return '$days gün sigarasız';
  }

  @override
  String get moneySavedLabel => 'Tasarruf Edilen';

  @override
  String get cigsAvoidedLabel => 'Kaçınılan Sigara';

  @override
  String get timeSmokeFreeLabel => 'Sigarasız Süre';

  @override
  String get howWasYourDay => 'Günün nasıl geçti?';

  @override
  String get healthMilestonesTitle => 'Sağlık Kilometre Taşları';

  @override
  String get lungFunctionLabel => 'Akciğer kapasitesi artıyor';

  @override
  String get circulationLabel => 'Daha iyi kan dolaşımı';

  @override
  String get heartRateLabel => 'Kalp hızı normalleşiyor';

  @override
  String get journeyHistoryTitle => 'Yolculuk Geçmişi';

  @override
  String get cleanStatus => 'Temiz';

  @override
  String get cravingStatus => 'İstek';

  @override
  String get setbackStatus => 'Gerileme';

  @override
  String get profileLabel => 'Profil';

  @override
  String get quitPlanLabel => 'Bırakma Planı';

  @override
  String get notificationsLabel => 'Bildirimler';

  @override
  String get subscriptionLabel => 'Abonelik';

  @override
  String get privacyPolicyLabel => 'Gizlilik Politikası';

  @override
  String get privacyCommitment => 'Verileriniz cihazınızda kalır';

  @override
  String get privacyCommitmentDesc =>
      'Quitra tamamen çevrimdışı tasarlanmıştır. Kişisel yolculuk verileriniz cihazınızdan asla ayrılmaz.';

  @override
  String get privacyDataWeCollect => 'Topladığımız veriler';

  @override
  String get privacyDataWeCollectDesc =>
      'Yalnızca paylaşmayı seçtiğiniz şeyleri saklarız: bırakma planı, günlük kontroller ve ayarlar. Bu veriler tamamen cihazınızda kalır.';

  @override
  String get privacyDataWeDontCollect => 'Toplamadığımız veriler';

  @override
  String get privacyDataWeDontCollectDesc =>
      'Analitik yok. Bulut senkronizasyonu yok. Kişisel tanımlayıcılar yok. Verilerinizi görme veya paylaşma imkanımız yok.';

  @override
  String get privacyYourControl => 'Kontrol sizde';

  @override
  String get privacyYourControlDesc =>
      'İstediğiniz zaman verilerinizi CSV ile dışa aktarın. Yolculuğunuz, dosyalarınız.';

  @override
  String get privacyContact => 'Bizimle iletişime geçin';

  @override
  String get privacyContactDesc =>
      'Gizlilik hakkında sorularınız mı var? Sizden duymak isteriz.';

  @override
  String get cigarettePriceStepTitle => 'Sigara fiyatı nedir?';

  @override
  String get priceOptionSingle => 'Tek Sigara';

  @override
  String get priceOptionPacket => 'Paket';

  @override
  String get singleCigarettePriceLabel => 'Sigara başına fiyat';

  @override
  String get packetPriceLabel => 'Paket başına fiyat';

  @override
  String get cigarettesPerPacketLabel => 'Paketteki sigara sayısı';

  @override
  String get priceRequired => 'Fiyat gereklidir';

  @override
  String get invalidNumber => 'Lütfen geçerli bir sayı girin';

  @override
  String get journeyStartMessage => 'Yolculuğun burada başlıyor.';

  @override
  String get cravingsRecorded => 'Kaydedilmiş istekler';

  @override
  String get setbackRecorded => 'Gerileme kaydedildi';

  @override
  String get didYouSmokeToday => 'Bugün içtiniz mi?';

  @override
  String get cravingsIntensity => 'İstek şiddeti';

  @override
  String get addNoteOptional => 'Not ekle (opsiyonel)';

  @override
  String get saveJournal => 'Günlüğü Kaydet';

  @override
  String get detailedInsights => 'Detaylı İçgörüler';

  @override
  String get lifeRegainedLabel => 'Kazanılan Hayat';

  @override
  String get cleanStreakLabel => 'Temiz Seri';

  @override
  String get dayDetailsTitle => 'Gün Detayları';

  @override
  String get journalNoteLabel => 'Günlük Notu';

  @override
  String get editNoteAction => 'Notu Düzenle';

  @override
  String get saveNoteAction => 'Değişiklikleri Kaydet';

  @override
  String get languageLabel => 'Dil';

  @override
  String get cigarettePriceLabel => 'Sigara Fiyatı';

  @override
  String get saveAction => 'Kaydet';

  @override
  String get cancelAction => 'İptal';

  @override
  String get arabic => 'Arapça';

  @override
  String get english => 'İngilizce';

  @override
  String get turkish => 'Türkçe';

  @override
  String get dailyReminderLabel => 'Günlük Hatırlatıcı';

  @override
  String get dailyReminderDescription => 'Günlük check-in için hatırlat';

  @override
  String get reminderTimeLabel => 'Hatırlatıcı Saati';

  @override
  String get milestoneCelebrationsLabel => 'Kilometre Taşı Kutlamaları';

  @override
  String get milestoneCelebrationsDescription =>
      'İlerleme kilometre taşlarını kutla';

  @override
  String get dailyReminderNotificationTitle => 'Quitra';

  @override
  String get dailyReminderNotificationBody =>
      'Kontrol zamanı. Seni düşünüyoruz.';

  @override
  String get milestone7Title => 'Bir hafta güçlü.';

  @override
  String get milestone7Body => 'Sandığından daha iyisin.';

  @override
  String get milestone14Title => 'İki hafta güçlü.';

  @override
  String get milestone14Body => 'Her adım önemli.';

  @override
  String get milestone30Title => 'Bir ay güçlü.';

  @override
  String get milestone30Body => 'Bu gerçek bir ilerleme.';

  @override
  String get milestone60Title => 'Altmış gün güçlü.';

  @override
  String get milestone60Body => 'Bir şeyler inşa ediyorsun.';

  @override
  String get milestone90Title => 'Üç ay güçlü.';

  @override
  String get milestone90Body => 'Bunu başarabilirsin.';

  @override
  String get milestone180Title => 'Altı aydır.';

  @override
  String get milestone180Body => 'Yolculuğun, gücün.';

  @override
  String get milestone365Title => 'Bir yıl özgür.';

  @override
  String get milestone365Body => 'Özgürsün. Tebrikler.';

  @override
  String get exportDataLabel => 'Verileri Dışa Aktar';

  @override
  String get exportDataSuccess => 'Veriler başarıyla dışa aktarıldı';

  @override
  String get exportDataError => 'Veriler dışa aktarılamadı';

  @override
  String get exportDataDescription =>
      'Tüm verilerinizi CSV olarak dışa aktarın';

  @override
  String get onboardingImportTitle => 'Verilerinizi içe aktarın';

  @override
  String get onboardingImportDescription =>
      'Zaten bir yedeğiniz mi var? Kaldığınız yerden devam etmek için CSV dosyanızı içe aktarın.';

  @override
  String get onboardingImportAction => 'CSV Dosyası Seç';

  @override
  String get onboardingImportSkip => 'Burada yeniyim, atla';

  @override
  String get onboardingImportSuccess => 'Veriler başarıyla içe aktarıldı!';

  @override
  String get shareJourneyStarting =>
      'Sigarasız yolculuğuma başlıyorum! Quitra\'ya katıl';

  @override
  String shareJourneyDaysSmokeFree(int days) {
    return '$days gündür sigarasım! Quitra\'ya katıl';
  }

  @override
  String get takeBreathHonest => 'Nefes al. Kendinle dürüst ol.';

  @override
  String get iStayedStrong => 'Güçlü kaldım';

  @override
  String get iHadOneCigarette => 'Bir sigara içtim';

  @override
  String get watchAdToRecord => 'Kaydetmek için reklam izle';

  @override
  String get markAsSmoked => 'İçti olarak işaretle';

  @override
  String get somethingWentWrong => 'Bir şeyler ters gitti';

  @override
  String get share => 'Yolculuğu Paylaş';

  @override
  String get thisWeekTitle => 'Bu Hafta';

  @override
  String get yourStreakLabel => 'Seriniz';

  @override
  String get streakAtRiskTitle => 'Serinizi sürdürün.';

  @override
  String get streakAtRiskBody =>
      'Gününüzü Quitra\'ya kaydetmek için bir dakika ayırın.';

  @override
  String get streakModeLabel => 'Seri Modu';

  @override
  String get streakModeDescription =>
      'Günlük serinizin aksaklıkları nasıl ele alacağını seçin.';

  @override
  String get forgivingModeLabel => 'Esnek Mod';

  @override
  String get strictModeLabel => 'Sıkı Mod';

  @override
  String get forgivingModeDesc =>
      'Zor bir anın tüm emeğinizi sıfırlamaması için haftada bir hak.';

  @override
  String get strictModeDesc =>
      'Herhangi bir gerilemede veya kaçırılan kayıtta seri hemen sıfırlanır.';

  @override
  String get recommendedLabel => 'Önerilen';

  @override
  String get dayStreak => 'Günlük seri';

  @override
  String get startYourStreak => 'Serini başlat';

  @override
  String get cravingTrendTitle => 'İstek Eğilimi';

  @override
  String cravingMomentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count an',
      one: '1 an',
    );
    return '$_temp0';
  }

  @override
  String get dayShort => 'g';

  @override
  String get watchAdAndSaveJournal => 'Reklam İzle ve Günlüğü Kaydet';

  @override
  String get watchAdHint =>
      'Reklam izlemek, Quitra\'yı ücretsiz tutmamıza ve geliştirmemize yardımcı olur.';

  @override
  String get yourMilestonesTitle => 'Kilometre Taşların';

  @override
  String get strengthAndDedicationTitle => 'Güç ve Kararlılık';

  @override
  String get milestoneCategoryAll => 'Tümü';

  @override
  String get milestoneCategoryTime => 'Zaman';

  @override
  String get milestoneCategoryHealth => 'Sağlık';

  @override
  String get milestoneCategorySavings => 'Tasarruf';

  @override
  String get milestoneCategoryStreak => 'Seri';

  @override
  String get milestoneCategoryStrength => 'Güç';

  @override
  String get milestoneCategoryDedication => 'Kararlılık';

  @override
  String get milestoneFirstDayTitle => 'İlk Gün';

  @override
  String get milestoneFirstDayDesc =>
      'En zor adım ilk adımdır. Ve sen bunu kararlılıkla attın.';

  @override
  String get milestoneThreeDaysTitle => 'Üç Gün Temiz';

  @override
  String get milestoneThreeDaysDesc =>
      'Nikotin vücudundan ayrılıyor. Kontrolü geri kazanıyorsun.';

  @override
  String get milestoneOneWeekTitle => 'Bir Hafta Güçlü';

  @override
  String get milestoneOneWeekDesc =>
      'Sandığından çok daha iyisin. Koca bir hafta geride kaldı.';

  @override
  String get milestoneTwoWeeksTitle => 'İki Hafta Temiz';

  @override
  String get milestoneTwoWeeksDesc =>
      'Her adım değerli. Sigara isteği gücünü yitiriyor.';

  @override
  String get milestoneOneMonthTitle => 'Bir Ay Özgür';

  @override
  String get milestoneOneMonthDesc =>
      'Bu gerçek bir ilerleme. Günlük ritmini baştan yazdın.';

  @override
  String get milestoneThreeMonthsTitle => 'Üç Ay';

  @override
  String get milestoneThreeMonthsDesc =>
      'Kalıcı bir direnç inşa ettin. Bunu başarabilirsin.';

  @override
  String get milestoneSixMonthsTitle => 'Yarım Yıl';

  @override
  String get milestoneSixMonthsDesc =>
      'Altı aylık özgürlük. Senin yolculuğun, senin gücün.';

  @override
  String get milestoneOneYearTitle => 'Bir Yıl Özgür';

  @override
  String get milestoneOneYearDesc =>
      'Kendini seçtiğin koca bir yıl. Artık tamamen özgürsün.';

  @override
  String get milestoneHeartHealingTitle => 'Kalp Ritmi Dengelendi';

  @override
  String get milestoneHeartHealingDesc =>
      'Kalp atış hızın ve kan basıncın normal seviyelere döndü.';

  @override
  String get milestoneCirculationTitle => 'Canlanan Dolaşım';

  @override
  String get milestoneCirculationDesc =>
      'Oksijen serbestçe dolaşıyor. Hareket etmek artık daha hafif.';

  @override
  String get milestoneBreathingTitle => 'Rahat Nefes';

  @override
  String get milestoneBreathingDesc =>
      'Hava yolların yenileniyor. Nefes almak artık derin ve huzurlu.';

  @override
  String get milestoneSaved10Title => 'İlk Tasarruf';

  @override
  String get milestoneSaved10Desc =>
      'Biriken ilk paran. Her seçimin bir fark yarattığının kanıtı.';

  @override
  String get milestoneSaved50Title => 'Büyüyen Birikim';

  @override
  String get milestoneSaved50Desc =>
      'Ellilik tasarruf. Duman yerine cebinde kalan değer.';

  @override
  String get milestoneSaved100Title => 'Yüzlük Birikim';

  @override
  String get milestoneSaved100Desc =>
      'Yüz birim birikti. Kararlılığının somut bir ödülü.';

  @override
  String get milestoneSaved500Title => 'Maddi Özgürlük';

  @override
  String get milestoneSaved500Desc =>
      'Beş yüz birim korundu. Kaynaklarının kontrolünü geri aldın.';

  @override
  String get milestoneStreak7Title => '7 Günlük Odak';

  @override
  String get milestoneStreak7Desc =>
      'Yedi gün kesintisiz irade. Güçlü bir ivme yakalıyorsun.';

  @override
  String get milestoneStreak30Title => 'Sağlam Alışkanlık';

  @override
  String get milestoneStreak30Desc =>
      'Otuz gün art arda. Yeni ve sağlıklı alışkanlıkların kök salıyor.';

  @override
  String get milestoneStreak100Title => 'Sarsılmaz İrade';

  @override
  String get milestoneStreak100Desc =>
      'Yüz kesintisiz gün. Hayatının kontrolü tamamen sende.';

  @override
  String get milestoneFirstMomentTitle => 'İlk Direnç';

  @override
  String get milestoneFirstMomentDesc =>
      'Duraksadın, derin nefes aldın ve geçmesini bekledin. İstekler geçer.';

  @override
  String get milestoneTenMomentsTitle => 'On Zafer';

  @override
  String get milestoneTenMomentsDesc =>
      'Karşılaştığın ve pes etmeden aştığın on zorlu an.';

  @override
  String get milestoneFiftyMomentsTitle => 'Anların Ustası';

  @override
  String get milestoneFiftyMomentsDesc =>
      'Elli zorlu an aşıldı. İstekler artık kararlarına yön veremez.';

  @override
  String get milestoneSevenCheckInsTitle => 'Bir Haftalık Takip';

  @override
  String get milestoneSevenCheckInsDesc =>
      'Yedi günlük kayıt. Kendinle dürüst olmak seni dengede tutar.';

  @override
  String get milestoneThirtyCheckInsTitle => 'Bir Aylık Farkındalık';

  @override
  String get milestoneThirtyCheckInsDesc =>
      'Otuz günlük iç gözlem. Öz farkındalık senin en büyük gücün.';

  @override
  String get nextMilestoneTitle => 'Sıradaki Kilometre Taşı';

  @override
  String get milestoneComplete => 'Tamamlandı';

  @override
  String get allMilestonesAchieved => 'Tüm Kilometre Taşları Aşıldı!';

  @override
  String get allMilestonesAchievedDesc =>
      'Yolculuğundaki tüm hedefleri başardın. Gerçekten olağanüstü!';

  @override
  String notesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count not',
      one: '1 not',
    );
    return '$_temp0';
  }

  @override
  String notesLoggedToday(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bugün $count not kaydedildi',
      one: 'Bugün 1 not kaydedildi',
    );
    return '$_temp0';
  }

  @override
  String get addNoteHint => 'Bir düşünce veya not ekle...';

  @override
  String get addNoteAction => 'Not Ekle';

  @override
  String get todayNotesTitle => 'Bugünün Notları';

  @override
  String get noNotesRecorded => 'Bu gün için kayıtlı not bulunmuyor.';
}
