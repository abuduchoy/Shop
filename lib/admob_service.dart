import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobService {
  static BannerAd _bannerAd;
  static InterstitialAd _interstitialAd;

  static BannerAd get bannerAd => _bannerAd;

  static String get bannerAdUntilId => Platform.isAndroid
      ? 'ca-app-pub-7755152799949559~1198135981'
      : 'ca-app-pub-7755152799949559~1198135981';

  static initialize() {
    if (MobileAds.instance == null) {
      print("initialize:AdMob");
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd() {
    BannerAd ad = new BannerAd(
      adUnitId: bannerAdUntilId,
      size: AdSize.largeBanner,
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (Ad ad) => print('Ad Loaded'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Ad Loaded');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('Ad opened'),
        onAdClosed: (Ad ad) => print('Ad Closed'),
        onApplicationExit: (Ad ad) => print('Left Aplication'),
      ),
    );

    return ad;
  }

  static void showBannerAd() {
    if (_bannerAd != null) {
      return;
    }
    _bannerAd = createBannerAd();
    _bannerAd..load();
  }

  void disposeAds() {
    print("disposeAds");
    if (_bannerAd != null) {
      _bannerAd?.dispose();
    }
  }

  static void showInterstitialAd() {
    _interstitialAd?.dispose();
    _interstitialAd = null;

    if (_interstitialAd == null) _interstitialAd = _createInterstitialAd();

    _interstitialAd.load();
  }
}
