import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:diabetes_life/pages/today_bloodpressure/today_bloodpressure_widget.dart';
import 'package:diabetes_life/pages/today_diabetes/today_diabetes_widget.dart';
import 'package:diabetes_life/pages/today_food/today_food_widget.dart';
import 'package:diabetes_life/pages/today_health/today_health_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box<CheckModel>? check;
Box<Map<dynamic, dynamic>>? mainBox;
Box<Map<dynamic, dynamic>>? bloodBox;
Box<Map<dynamic, dynamic>>? foodBox;
Box<Map<dynamic, dynamic>>? healthEventBox;
Box<dynamic>? healthListBox;
Box<String>? myPromiseBox;

class HiveConfig {
  Future openBox() async {
    check = await Hive.openBox<CheckModel>('check');
    mainBox = await Hive.openBox<Map<dynamic, dynamic>>('mainBox');
    bloodBox = await Hive.openBox<Map<dynamic, dynamic>>('bloodBox');
    foodBox = await Hive.openBox<Map<dynamic, dynamic>>('foodBox');
    healthEventBox = await Hive.openBox<Map<dynamic, dynamic>>('healthEventBox');
    healthListBox = await Hive.openBox<dynamic>('healthListBox');
    myPromiseBox = await Hive.openBox<String>('myPromiseBox');
  }

  Future boxSetting() async {
    check = await Hive.box<CheckModel>('check');
    mainBox = await Hive.box<Map<dynamic, dynamic>>('mainBox');
    bloodBox = await Hive.box<Map<dynamic, dynamic>>('bloodBox');
    foodBox = await Hive.box<Map<dynamic, dynamic>>('foodBox');
    healthEventBox = await Hive.box<Map<dynamic, dynamic>>('healthEventBox');
    healthListBox = await Hive.box<dynamic>('healthListBox');
    myPromiseBox = await Hive.box<String>('myPromiseBox');
  }

  Future eventSetting() async {
    await eventPut(); // 혈당
    await eventPut2(); // 혈압
    await eventPut3(); // 음식
    await eventPut4(); // 운동
  }
}
