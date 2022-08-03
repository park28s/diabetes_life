import 'package:hive/hive.dart';

part 'check_model.g.dart';

@HiveType(typeId: 1)
class CheckModel {
  @HiveField(0)
  int? diabetesEmptyStomach;

  @HiveField(1)
  int? diabetesBeforeMeal;

  @HiveField(2)
  int? diabetesAfterMeal;

  @HiveField(3)
  int? bloodPressure1;

  @HiveField(4)
  int? bloodPressure2;

  @HiveField(5)
  int? badFood;

  @HiveField(6)
  int? health;

  CheckModel({
    required this.diabetesEmptyStomach,
    required this.diabetesBeforeMeal,
    required this.diabetesAfterMeal,
    required this.bloodPressure1,
    required this.bloodPressure2,
    required this.badFood,
    required this.health,
  });
}
