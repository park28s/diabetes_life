import 'package:diabetes_life/pages/controller/today_diabetes_controller.dart';
import 'package:hive/hive.dart';

part 'today_model.g.dart';

Map<DateTime, List<Event>> eventSource = {};
List todayDiabetesMainList = [];
Map<String, int> todayDiabetesMainMap = {};

@HiveType(typeId: 2)
class TodayModel extends HiveObject {
  @HiveField(0)
  int? dayDiabetesEmptyStomach;

  @HiveField(1)
  int? dayDiabetesBeforeMeal;

  @HiveField(2)
  int? dayDiabetesAfterMeal;

  @HiveField(3)
  int? dayBloodPressure1;

  @HiveField(4)
  int? dayBloodPressure2;

  @HiveField(5)
  int? dayBadFood;

  @HiveField(6)
  int? dayHealth;

  TodayModel(
      {this.dayDiabetesEmptyStomach,
      this.dayDiabetesBeforeMeal,
      this.dayDiabetesAfterMeal,
      this.dayBloodPressure1,
      this.dayBloodPressure2,
      this.dayBadFood,
      this.dayHealth});
}
