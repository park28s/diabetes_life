import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_controller/setup_controller.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_widget/setup_widget.dart';
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
    Get.put(SetupPageController());
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          TextConfig().TextConfig1('알림설정', 30, FontWeight.w600, Colors.black),
          SizedBox(height: 10),
          TextConfig().TextConfig1(
              '공복 체크 시간과 식후 체크 시간을 알려 드려요', 15, FontWeight.w300, Colors.red),
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
                    print('isSettingCheck1 = ${isSettingCheck1?.values.first}');
                    LocalNotification().showNotification2();
                  }))
            ],
          ),
          SizedBox(height: 10),
          Obx(() => SetupPageController.to.isChecked1.value == true
              ? hiddenTimePut1()
              : Container()),
          SizedBox(height: 30),
          Divider(height: 5, color: Colors.black, indent: 15, endIndent: 15),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextConfig().TextConfig1(
                  '식후 알람 설정', 20, FontWeight.w500, Colors.black),
              Obx(() => Switch(
                  value: SetupPageController.to.isChecked2.value,
                  onChanged: (value) {
                    SetupPageController.to.isChecked2.value = value;
                    isSettingCheck2?.put(
                        'isBool', SetupPageController.to.isChecked2.value);
                    print(
                        '식후 알람설정 : ${SetupPageController.to.isChecked2.value}');
                    print('isSettingCheck2 = ${isSettingCheck2?.values.first}');
                    LocalNotification().showNotification2();
                  }))
            ],
          ),
          SizedBox(height: 10),
          Obx(() => SetupPageController.to.isChecked2.value == true
              ? hiddenTimePut2()
              : Container()),
          ElevatedButton(
              onPressed: () {
               // print(LocalNotification.flutterLocalNotificationsPlugin.);


                //todayDiabetesTimePut();
                print(Checked2TimeBox?.toMap().values.first);
                tz.TZDateTime checked2TimeBox = tz.TZDateTime.parse(tz.getLocation('Asia/Seoul'), '${Checked2TimeBox?.toMap().values.first}');
                print('aaaff = ${checked2TimeBox}');
                print(isSettingCheck1?.toMap().values.first);
                print(Checked1HourBox?.toMap().values.first);
                //LocalNotification().showNotification2();
              },
              child: Text('test'))
        ],
      ),
    );
  }
}
