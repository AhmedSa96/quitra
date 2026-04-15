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
}
