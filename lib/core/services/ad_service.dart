import 'dart:io' show Platform;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static RewardedAd? _rewardedAd;
  static bool _isAdLoaded = false;

  static Future<void> loadRewardedAd() async {
    final unitId = Platform.isIOS
        ? dotenv.env['ADMOB_IOS_UNIT_ID']
        : dotenv.env['ADMOB_UNIT_ID'];
    if (unitId == null || unitId.isEmpty) return;

    await RewardedAd.load(
      // adUnitId: Platform.isIOS
      //     ? "ca-app-pub-3940256099942544/1712485313"
      //     : "ca-app-pub-3940256099942544/5224354917",
      adUnitId: unitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isAdLoaded = true;
        },
        onAdFailedToLoad: (error) {
          _rewardedAd = null;
          _isAdLoaded = false;
        },
      ),
    );
  }

  static Future<bool> showRewardedAd() async {
    if (!_isAdLoaded || _rewardedAd == null) {
      await loadRewardedAd();
      if (!_isAdLoaded || _rewardedAd == null) {
        return false;
      }
    }

    bool rewardEarned = false;

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        _rewardedAd?.dispose();
        _rewardedAd = null;
        _isAdLoaded = false;
        loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _rewardedAd?.dispose();
        _rewardedAd = null;
        _isAdLoaded = false;
        loadRewardedAd();
      },
    );

    await _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        rewardEarned = true;
      },
    );

    return rewardEarned;
  }

  static bool get isAdReady => _isAdLoaded;
}
