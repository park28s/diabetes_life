import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box<CheckModel>? check;
Box<Map<dynamic, dynamic>>? mainBox;
Box<Map<dynamic, dynamic>>? bloodBox;

class HiveConfig {
  Future openBox() async {
    check = await Hive.openBox<CheckModel>('check');
    mainBox = await Hive.openBox<Map<dynamic, dynamic>>('mainBox');
    bloodBox = await Hive.openBox<Map<dynamic, dynamic>>('bloodBox');
  }

  Future boxSetting() async {
    mainBox = await Hive.box<Map<dynamic, dynamic>>('mainBox');
    bloodBox = await Hive.box<Map<dynamic, dynamic>>('bloodBox');
  }
}
