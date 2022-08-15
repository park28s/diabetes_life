import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box<CheckModel>? check;
//Box<TodayModel>? todayModel;
Box<Map<dynamic, dynamic>>? mainBox;
/*Box<TodayModel>? dayDiabetesBeforeMeal;
Box<TodayModel>? dayDiabetesAfterMeal;
Box<TodayModel>? dayBloodPressure1;
Box<TodayModel>? dayBloodPressure2;
Box<TodayModel>? dayBadFood;
Box<TodayModel>? dayHealth;*/

class HiveConfig {
  Future openBox() async {
    check = await Hive.openBox<CheckModel>('check');
    //todayModel = await Hive.openBox<TodayModel>('todayModel');
    mainBox = await Hive.openBox<Map<dynamic, dynamic>>('mainBox');
    /*dayDiabetesBeforeMeal = await Hive.openBox<TodayModel>('dayDiabetesBeforeMeal');
    dayDiabetesAfterMeal = await Hive.openBox<TodayModel>('dayDiabetesAfterMeal');
    dayBloodPressure1 = await Hive.openBox<TodayModel>('dayBloodPressure1');
    dayBloodPressure2 = await Hive.openBox<TodayModel>('dayBloodPressure2');
    dayBadFood = await Hive.openBox<TodayModel>('dayBadFood');
    dayHealth = await Hive.openBox<TodayModel>('dayHealth');*/
  }

  Future boxSetting() async {
    //check = await Hive.box<CheckModel>('check');
    //todayModel = await Hive.box<TodayModel>('todayModel');
    mainBox = await Hive.box<Map<dynamic, dynamic>>('mainBox');
    /*dayDiabetesBeforeMeal = await Hive.box('dayDiabetesBeforeMeal');
    dayDiabetesAfterMeal = await Hive.box('dayDiabetesAfterMeal');
    dayBloodPressure1 = await Hive.box('dayBloodPressure1');
    dayBloodPressure2 = await Hive.box('dayBloodPressure2');
    dayBadFood = await Hive.box('dayBadFood');
    dayHealth = await Hive.box('dayHealth');*/
  }
}
