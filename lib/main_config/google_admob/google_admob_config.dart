import 'dart:io';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_home/main_home.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final String androidBannerID = ;
final String iosBannerID = 
final String androidInterstitialID = ;
final String iosInterstitialID = ;

//title : 광고 배너 생성 = 320 x 50
void createBannerAd() {
  bannerAd = BannerAd(
    size: AdSize.banner,
    adUnitId: Platform.isAndroid ? androidBannerID : iosBannerID,
    request: AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) {
        print('$BannerAd loaded.');
      },
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
        print('Ad failed to load: $error');
      },
      onAdOpened: (Ad ad) => print('$BannerAd opened.'),
      onAdClosed: (Ad ad) => print('$BannerAd closed.'),
    ),
  )..load();
}

//title : 광고 배너 생성 = 320 x 100
void createBannerAd2() {
  bannerAd = BannerAd(
    size: AdSize.largeBanner,
    adUnitId: Platform.isAndroid ? androidBannerID : iosBannerID,
    request: AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) {
        print('$BannerAd loaded.');
      },
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
        print('Ad failed to load: $error');
      },
      onAdOpened: (Ad ad) => print('$BannerAd opened.'),
      onAdClosed: (Ad ad) => print('$BannerAd closed.'),
    ),
  )..load();
}

//title : 전체 광고 생성
void createInterstitialAd() {
  InterstitialAd.load(
    adUnitId: Platform.isAndroid ? androidInterstitialID : iosInterstitialID,
    request: AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (InterstitialAd ad) {
        interstitialAd = ad;
      },
      onAdFailedToLoad: (LoadAdError error) {
        print('InterstitialAd failed to load: $error');
      },
    ),
  );
}

//title : 전체 광고 보여 주기
void showInterstitialAd() {
  if (interstitialAd != null) {
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('%ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad
            .dispose()
            .whenComplete(() => Get.back())
            .whenComplete(() => getSnackBar('성공적으로 저장 되었습니다!', '')).whenComplete(() => textFormClear());
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (InterstitialAd ad) => print('$ad impression occurred.'),
    );
    interstitialAd!.show();
    interstitialAd = null;
  }
  return;
}

//title : 전체 광고 보여 주기 이벤트 빠진거
void showInterstitialAd2() {
  if (interstitialAd != null) {
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('%ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad
            .dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (InterstitialAd ad) => print('$ad impression occurred.'),
    );
    interstitialAd!.show();
    interstitialAd = null;
  }
  return;
}

/*//title : 리워드 전체 광고 생성
void createRewardedAd() {
  RewardedAd.load(
    adUnitId: Platform.isAndroid ? androidBannerID : iosBannerID,
    request: AdRequest(),
    rewardedAdLoadCallback: RewardedAdLoadCallback(
      onAdLoaded: (RewardedAd ad) {
        print('$ad loaded.');
        rewardedAd = ad;
      },
      onAdFailedToLoad: (LoadAdError error) {
        print('RewardedAd failed to load: $error');
        rewardedAd = null;
      },
    ),
  );
}

//title : 리워드 전체 광고 보여 주기
void showRewardedAd() {
  if (rewardedAd == null) {
    print('Warning: attempt to show rewarded before loaded.');
    return;
  }
  rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (RewardedAd ad) =>
        print('$ad onAdShowedFullScreenContent.'),
    onAdDismissedFullScreenContent: (RewardedAd ad) {
      print('$ad onAdDismissedFullScreenContent.');
      ad.dispose();
    },
    onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
      print('$ad onAdFailedToShowFullScreenContent: $error');
      ad.dispose();
    },
    onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
  );
}*/
