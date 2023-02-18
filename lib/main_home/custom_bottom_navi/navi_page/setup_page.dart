import 'dart:developer';

import 'package:diabetes_life/main_config/google_admob/google_admob_config.dart';
import 'package:diabetes_life/main_config/google_admob/google_admob_widget.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_controller/setup_controller.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_widget/setup_widget.dart';
import 'package:diabetes_life/main_home/main_home.dart';
import 'package:diabetes_life/pages/controller/today_diabetes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    createBannerAd2();
    Get.put(SetupPageController());
    adCount++;
    print('adCounter = ${adCount}');
    adCount == 5 || adCount == 10 ? showInterstitialAd2() : null;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            //textView(1, '알림설정'),
            TextView().textView(
                '알림설정', mainWidthSize * 0.07, FontWeight.w600, Colors.black),
            SizedBox(height: 10),
            TextView().textView('공복 체크 시간과 식후 체크 시간을 알려 드려요',
                mainWidthSize * 0.03, FontWeight.w500, Colors.red),
            SizedBox(height: 10),
            googleAdBanner2(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextConfig()
                    .TextConfig1('공복 알람 설정', 20, FontWeight.w500, Colors.black),
                Obx(() => Switch(
                    value: SetupPageController.to.isChecked1.value,
                    onChanged: (value) {
                      SetupPageController.to.isChecked1.value = value;
                      isSettingCheck1?.put(
                          'isBool', SetupPageController.to.isChecked1.value);
                      print(
                          '공복 알람 설정 : ${SetupPageController.to.isChecked1.value}');
                      print(
                          'isSettingCheck1 = ${isSettingCheck1?.values.first}');
                      LocalNotification().showNotification2();
                    }))
              ],
            ),
            SizedBox(height: 10),
            Obx(() => SetupPageController.to.isChecked1.value == true
                ? hiddenTimePut1()
                : Container()),
            SizedBox(height: 15),
            Divider(height: 5, color: Colors.black, indent: 15, endIndent: 15),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextConfig()
                    .TextConfig1('식후 알람 설정', 20, FontWeight.w500, Colors.black),
                Obx(() => Switch(
                    value: SetupPageController.to.isChecked2.value,
                    onChanged: (value) {
                      if (Checked2TimeBox!.isEmpty) {
                        isSettingCheck2?.put('isBool', false);
                        getSnackBar('식전 정보 없음', '식전 정보를 먼저 입력해 주세요!');
                      } else {
                        SetupPageController.to.isChecked2.value = value;
                        isSettingCheck2?.put(
                            'isBool', SetupPageController.to.isChecked2.value);
                        print(
                            '식후 알람설정 : ${SetupPageController.to.isChecked2.value}');
                        print(
                            'isSettingCheck2 = ${isSettingCheck2?.values.first}');
                        LocalNotification().showNotification2();
                      }
                    }))
              ],
            ),
            SizedBox(height: 10),
            Obx(() => SetupPageController.to.isChecked2.value == true
                ? hiddenTimePut2()
                : Container()),
          ],
        ),
      ),
    );
  }
}
