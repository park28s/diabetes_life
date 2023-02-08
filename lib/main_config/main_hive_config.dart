import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:diabetes_life/pages/today_bloodpressure/today_bloodpressure_widget.dart';
import 'package:diabetes_life/pages/today_diabetes/today_diabetes_widget.dart';
import 'package:diabetes_life/pages/today_food/today_food_widget.dart';
import 'package:diabetes_life/pages/today_health/today_health_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Box<CheckModel>? check;
Box<Map<dynamic, dynamic>>? mainBox;
Box<Map<dynamic, dynamic>>? bloodBox;
Box<Map<dynamic, dynamic>>? foodBox;
Box<Map<dynamic, dynamic>>? healthEventBox;
Box<dynamic>? healthListBox;
Box<String>? myPromiseBox;
Box<bool>? isSettingCheck1;
Box<bool>? isSettingCheck2;
Box<int>? Checked1HourBox;
Box<int>? Checked1MinBox;
Box<dynamic>? Checked2TimeBox;
Box<int>? Checked2HourBox;

class HiveConfig {
  Future openBox() async {
    check = await Hive.openBox<CheckModel>('check');
    mainBox = await Hive.openBox<Map<dynamic, dynamic>>('mainBox');
    bloodBox = await Hive.openBox<Map<dynamic, dynamic>>('bloodBox');
    foodBox = await Hive.openBox<Map<dynamic, dynamic>>('foodBox');
    healthEventBox =
        await Hive.openBox<Map<dynamic, dynamic>>('healthEventBox');
    healthListBox = await Hive.openBox<dynamic>('healthListBox');
    myPromiseBox = await Hive.openBox<String>('myPromiseBox');
    isSettingCheck1 = await Hive.openBox<bool>('isSettingCheck1');
    isSettingCheck2 = await Hive.openBox<bool>('isSettingCheck2');
    Checked1HourBox = await Hive.openBox<int>('Checked1HourBox');
    Checked1MinBox = await Hive.openBox<int>('Checked1MinBox');
    Checked2TimeBox = await Hive.openBox<dynamic>('Checked2TimeBox');
    Checked2HourBox = await Hive.openBox<int>('Checked2HourBox');
  }

  Future boxSetting() async {
    check = await Hive.box<CheckModel>('check');
    mainBox = await Hive.box<Map<dynamic, dynamic>>('mainBox');
    bloodBox = await Hive.box<Map<dynamic, dynamic>>('bloodBox');
    foodBox = await Hive.box<Map<dynamic, dynamic>>('foodBox');
    healthEventBox = await Hive.box<Map<dynamic, dynamic>>('healthEventBox');
    healthListBox = await Hive.box<dynamic>('healthListBox');
    myPromiseBox = await Hive.box<String>('myPromiseBox');
    isSettingCheck1 = await Hive.box<bool>('isSettingCheck1');
    isSettingCheck2 = await Hive.box<bool>('isSettingCheck2');
    Checked1HourBox = await Hive.box<int>('Checked1HourBox');
    Checked1MinBox = await Hive.box<int>('Checked1MinBox');
    Checked2TimeBox = await Hive.box<dynamic>('Checked2TimeBox');
    Checked2HourBox = await Hive.box<int>('Checked2HourBox');
  }

  Future eventSetting() async {
    await eventPut(); // 혈당
    await eventPut2(); // 혈압
    await eventPut3(); // 음식
    await eventPut4(); // 운동
  }
}
