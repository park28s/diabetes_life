import 'dart:developer';

import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class SetupPageController extends GetxController {
  static SetupPageController get to => Get.find();

//note: 토글 버튼 활성 여부
  RxBool isChecked1 = false.obs;
  RxBool isChecked2 = false.obs;

//note: 시간 설정 초기 변수
  RxInt selectIndex1 = 25.obs;
  RxInt selectIndex2 = 60.obs;
  RxInt selectIndex3 = 0.obs;
}

//title : 알림 설정 세팅
class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        print('스케줄 다시 실행');
        LocalNotification().showNotification2();
      },
    );
  }

  static void requestPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  showNotification2() async {
    tz.initializeTimeZones();

    var androidDetails = const AndroidNotificationDetails(
        '유니크 한 알림 ID', '알림 종류 설명',
        priority: Priority.high,
        importance: Importance.max,
        color: Color.fromARGB(255, 255, 0, 0),
        actions: []);
    var iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    print(tz.TZDateTime.now(tz.getLocation('Asia/Seoul')));
    log('여기까지 작동허냐');
  //  print(Checked2TimeBox?.toMap().values.first);

    isSettingCheck1!.values.first == true
        ? flutterLocalNotificationsPlugin.zonedSchedule(
            1,
            '공복 체크 시간',
            '공복 혈당을 체크 할 시간 이에요!',
            //note : 시, 분 초 입력
            makeDate(
                Checked1HourBox?.values.first, Checked1MinBox?.values.first, 0),
            NotificationDetails(android: androidDetails, iOS: iosDetails),
            androidAllowWhileIdle: true,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime)
        : FlutterLocalNotificationsPlugin().cancel(1);

    if(isSettingCheck2!.values.first == true)
    isSettingCheck2!.values.first == true &&
            Checked2TimeBox?.toMap().values.first != null
        ? flutterLocalNotificationsPlugin.zonedSchedule(
            2,
            '식후 체크',
            '식후 혈당을 체크 할 시간 이에요!',
            //note : 시, 분 초 입력
            checked2Time(Checked2HourBox?.values.first),
            NotificationDetails(android: androidDetails, iOS: iosDetails),
            androidAllowWhileIdle: true,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime)
        : FlutterLocalNotificationsPlugin().cancel(2);
  }
}

makeDate(hour, min, sec) {
  var now = tz.TZDateTime.now(tz.getLocation('Asia/Seoul'));
  var when = tz.TZDateTime(tz.getLocation('Asia/Seoul'), now.year, now.month,
      now.day, hour, min, sec);
  if (when.isBefore(now)) {
    return when.add(Duration(days: 1));
  } else {
    return when;
  }
}

tz.TZDateTime checked2Time(time) {
  var now = tz.TZDateTime.now(tz.getLocation('Asia/Seoul'));
  tz.TZDateTime checked2TimeBox = tz.TZDateTime.parse(
          tz.getLocation('Asia/Seoul'), '${Checked2TimeBox?.values.first}')
      .add(Duration(hours: time));
  if (checked2TimeBox.isBefore(now)) {
    return checked2TimeBox.add(Duration(days: 1));
  } else {
    return checked2TimeBox;
  }
}
