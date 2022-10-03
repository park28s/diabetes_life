import 'package:diabetes_life/pages/controller/today_bloodpressure_controller.dart';
import 'package:diabetes_life/pages/controller/today_diabetes_controller.dart';
import 'package:diabetes_life/pages/controller/today_food_controller.dart';
import 'package:hive/hive.dart';

part 'today_model.g.dart';

Map<DateTime, List<Event>> eventSource = {}; //혈당 이벤트 소스
Map<DateTime, List<BloodEvent>> eventSource2 = {}; //혈압 이벤트 소스
Map<DateTime, List<FoodEvent>> eventSource3 = {}; //음식 이벤트 소스
Map<String, int> todayDiabetesMainMap = {};
Map<String, int> todayBloodMainMap = {};
Map<String, int> todayFoodMainMap = {};
List<int> todayBadFoodSumMainList = [0];
List<int> todayGoodFoodSumMainList = [0];
List<int> todaySosoFoodSumMainList = [0];
List todayDiabetesMainList = [];
List todayBloodMainList = [];
List todayFoodMainList = [];

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
