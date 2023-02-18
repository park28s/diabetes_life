import 'package:diabetes_life/main_config/google_admob/google_admob_config.dart';
import 'package:diabetes_life/main_config/google_admob/google_admob_widget.dart';
import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_home/main_home.dart';
import 'package:diabetes_life/pages/today_diabetes/today_diabetes_widget.dart';
import 'package:flutter/material.dart';

class TodayDiabetesPage extends StatelessWidget {
  const TodayDiabetesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    createBannerAd();
    adCount++;
    print('adCounter = ${adCount}');
    adCount == 5 || adCount == 10 ? showInterstitialAd2() : null;
    return Scaffold(
      appBar: AppBarDefault2(),
      body: SingleChildScrollView(
        child: Container(
          width: mainWidthSize,
          height: mainHeightSize,
          child: LayoutBuilder(
              builder: (context, size) => Column(
                    children: [
                      pageName('혈당 관리', Colors.blueAccent),
                      SizedBox(height: 10),
                      tableCalendar(),
                      SizedBox(height: 10),
                      googleAdBanner(),
                      SizedBox(height: 10),
                      selectedList()
                    ],
                  )),
        ),
      ),
    );
  }
}
