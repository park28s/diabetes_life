import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box<CheckModel>? check;
Box<Map<dynamic, dynamic>>? mainBox;

class HiveConfig {
  Future openBox() async {
    check = await Hive.openBox<CheckModel>('check');
    mainBox = await Hive.openBox<Map<dynamic, dynamic>>('mainBox');
  }

  Future boxSetting() async {
    mainBox = await Hive.box<Map<dynamic, dynamic>>('mainBox');
  }
}
