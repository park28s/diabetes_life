import 'package:diabetes_life/main_config/google_admob/google_admob_config.dart';
import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_home/main_home.dart';
import 'package:diabetes_life/pages/controller/today_health_controller.dart';
import 'package:diabetes_life/pages/today_health/today_health_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodayHealth extends StatelessWidget {
  const TodayHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TodayHealthController());
    TodayHealthController.to.health.clear();
    TodayHealthController.to.healthColor.clear();
    TodayHealthController.to.dayHealthUpdate();

    adCount++;
    print('adCounter = ${adCount}');
    adCount == 5 || adCount == 10 ? showInterstitialAd2() : null;
    return Scaffold(
      appBar: AppBarDefault2(),
      body: Container(
        width: mainWidthSize,
        height: mainHeightSize,
        child: LayoutBuilder(
            builder: (context, size) => Column(
                  children: [
                    pageName('운동 관리', Colors.deepPurpleAccent),
                    SizedBox(height: 10),
                    healthTableCalendar(),
                    SizedBox(height: 10),
                    healthListButton(),
                    selectedList4()
                  ],
                )),
      ),
    );
  }
}
