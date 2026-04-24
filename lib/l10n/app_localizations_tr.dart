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
  String get priceOptionSingle => 'Single Cigarette';

  @override
  String get priceOptionPacket => 'Packet';

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
}
