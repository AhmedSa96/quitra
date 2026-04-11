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
  String get serverError => 'Sunucu hatası oluştu. Lütfen tekrar deneyin.';

  @override
  String get networkError => 'Ağ hatası. Lütfen bağlantınızı kontrol edin.';

  @override
  String get unexpectedError => 'Beklenmedik bir hata oluştu.';
}
