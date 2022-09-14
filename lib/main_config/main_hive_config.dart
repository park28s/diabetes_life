import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:diabetes_life/pages/today_bloodpressure/today_bloodpressure_widget.dart';
import 'package:diabetes_life/pages/today_diabetes/today_diabetes_widget.dart';
import 'package:diabetes_life/pages/today_food/today_food_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box<CheckModel>? check;
Box<Map<dynamic, dynamic>>? mainBox;
Box<Map<dynamic, dynamic>>? bloodBox;
Box<Map<dynamic, dynamic>>? foodBox;

class HiveConfig {
  Future openBox() async {
    check = await Hive.openBox<CheckModel>('check');
    mainBox = await Hive.openBox<Map<dynamic, dynamic>>('mainBox');
    bloodBox = await Hive.openBox<Map<dynamic, dynamic>>('bloodBox');
    foodBox = await Hive.openBox<Map<dynamic, dynamic>>('foodBox');
  }

  Future boxSetting() async {
    mainBox = await Hive.box<Map<dynamic, dynamic>>('mainBox');
    bloodBox = await Hive.box<Map<dynamic, dynamic>>('bloodBox');
    foodBox = await Hive.box<Map<dynamic, dynamic>>('foodBox');
  }

  Future eventSetting() async {
   await eventPut();
   await eventPut2();
   await eventPut3();
  }
}
