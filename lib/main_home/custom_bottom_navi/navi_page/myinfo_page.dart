import 'package:diabetes_life/main_config/google_admob/google_admob_config.dart';
import 'package:diabetes_life/main_config/google_admob/google_admob_widget.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_widget/myinfo_widget.dart';
import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    createBannerAd();
    createInterstitialAd();
    return SingleChildScrollView(
      child: Column(
        children: [
          userAvatar(),
          userName(),
          SizedBox(height: 20),
          notice(),
          SizedBox(height: 10),
          googleAdBanner(),
          SizedBox(height: 10),
          myPromise(),
          SizedBox(height: 10),
          registerButton(context)
        ],
      ),
    );
  }
}

