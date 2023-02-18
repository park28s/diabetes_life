import 'package:diabetes_life/main_home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//title : 배너 위젯 320 x 50
Widget googleAdBanner() {
  return Container(
      alignment: Alignment.center,
      width: bannerAd?.size.width.toDouble(),
      height: bannerAd?.size.height.toDouble(),
      child: bannerAd == null ? Container() : AdWidget(ad: bannerAd!));
}

//title : 배너 위젯 320 x 100
Widget googleAdBanner2() {
  return Container(
      alignment: Alignment.center,
      width: bannerAd?.size.width.toDouble(),
      height: bannerAd?.size.height.toDouble(),
      child: bannerAd == null ? Container() : AdWidget(ad: bannerAd!));
}