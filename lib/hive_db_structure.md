
# Hive DB 구조

# < 메인화면 - 이번달 목표 >
Hive.openBox<CheckModel>('check')
- 공복 : diabetesEmptyStomach
- 식전 : diabetesBeforeMeal
- 식후 : diabetesAfterMeal
- 혈당(수축기) : bloodPressure1
- 혈당(이완기) : bloodPressure2
- 나쁜음식 : badFood
- 운동 : health
- 저장위치 = Hive.box<CheckModel>('check')
          .put('${timeNow.year}-${timeNow.month}', 
                CheckModel(diabetesEmptyStomach...)

# < 오늘의혈당 >
Hive.openBox<Map<dynamic, dynamic>>('mainBox');
- 공복 : dayDiabetesEmptyStomach
- 식전 : dayDiabetesBeforeMeal
- 식후 : dayDiabetesAfterMeal
- 혈당(수축기) : dayBloodPressure1
- 혈당(이완기) : dayBloodPressure2
- 나쁜음식 : dayBadFood
- 운동 : dayHealth
- 저장위치 = Hive.box<Map<dynamic, dynamic>>('mainBox')
           .put(saveDateTime, 
          {'공복': int.parse(diabetesCreateController.text);

