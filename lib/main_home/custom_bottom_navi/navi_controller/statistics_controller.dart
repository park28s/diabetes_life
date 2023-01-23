import 'dart:ffi';
import 'dart:math';

import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? diabetesDateInfo;
String? diabetesAgoDataInfo;
String? bloodDateInfo;
String? bloodAgoDataInfo;
String? foodDateInfo;
String? foodAgoDateInfo;
String? healthDateInfo;
String? healthAgoDateInfo;

class StatisticsController extends GetxController {
  static StatisticsController get to => Get.find(); // find 명령을 안쓰고 .to로 사용이 가능

  RxBool isStateDiabetesMonth = true.obs;
  RxBool isStateDiabetesMonthAgo = false.obs;
  RxBool isStateDiabetes3Month = false.obs;

  RxBool isStateBloodMonth = true.obs;
  RxBool isStateBloodMonthAgo = false.obs;
  RxBool isStateBlood3Month = false.obs;

  RxBool isStateFoodMonth = true.obs;
  RxBool isStateFoodMonthAgo = false.obs;
  RxBool isStateFood3Month = false.obs;

  RxBool isStateHealthMonth = true.obs;
  RxBool isStateHealthMonthAgo = false.obs;
  RxBool isStateHealth3Month = false.obs;

  RxDouble diabetesEmpty = 0.0.obs;
  RxDouble diabetesBefore = 0.0.obs;
  RxDouble diabetesAfter = 0.0.obs;
  RxDouble totalDiabetesAverage = 0.0.obs;

  RxDouble bloodSys = 0.0.obs;
  RxDouble bloodDia = 0.0.obs;
  RxDouble totalBloodSysAverage = 0.0.obs;

  RxDouble badFoodResult = 0.0.obs;
  RxDouble goodFoodResult = 0.0.obs;
  RxDouble sosoFoodResult = 0.0.obs;

  RxInt healthSum = 0.obs;
  RxString monthName = '이번달'.obs;

  RxString diabetesEmptyResultString = '-'.obs;
  RxString diabetesBeforeResultString = '-'.obs;
  RxString diabetesAfterResultString = '-'.obs;

  RxString bloodSysResultString = '-'.obs;

  RxString badFoodResultString = '-'.obs;

  RxString healthResultString = '-'.obs;

  void stateDiabetesMonth() {
    isStateDiabetesMonth.value = true;
    isStateDiabetesMonthAgo.value = false;
    isStateDiabetes3Month.value = false;

    print(
        '${isStateDiabetesMonth.value} / ${isStateDiabetesMonthAgo.value} / ${isStateDiabetes3Month.value}');
    diabetesAverage();
    diabetesResultString();
  }

  void stateDiabetesMonthAge() {
    isStateDiabetesMonthAgo.value = true;
    isStateDiabetesMonth.value = false;
    isStateDiabetes3Month.value = false;

    print(
        '${isStateDiabetesMonth.value} / ${isStateDiabetesMonthAgo.value} / ${isStateDiabetes3Month.value}');
    diabetesAverage();
    diabetesResultString();
  }

  void stateDiabetes3Month() {
    isStateDiabetes3Month.value = true;
    isStateDiabetesMonth.value = false;
    isStateDiabetesMonthAgo.value = false;

    print(
        '${isStateDiabetesMonth.value} / ${isStateDiabetesMonthAgo.value} / ${isStateDiabetes3Month.value}');
    diabetesAverage();
    diabetesEmptyResultString.value = '-';
    diabetesBeforeResultString.value = '-';
    diabetesAfterResultString.value = '-';
  }

  void diabetesResultString() {
    diabetesEmptyResultString.value = '-';
    diabetesBeforeResultString.value = '-';
    diabetesAfterResultString.value = '-';

    if (diabetesDateInfo != null) {
      if (check?.get(diabetesDateInfo)?.diabetesEmptyStomach != null) {
        final _result = check?.get(diabetesDateInfo)?.diabetesEmptyStomach;
        print('목표 공복 혈당 ${_result}');
        print('비교 공복 혈당 ${diabetesEmpty.value.toInt()}');
        if (_result! >= diabetesEmpty.value.toInt()) {
          diabetesEmpty.value.toInt() <= 0
              ? diabetesEmptyResultString.value = '-'
              : diabetesEmptyResultString.value = '성공 했어요';
          print(diabetesEmptyResultString.value);
        } else {
          diabetesEmptyResultString.value = '실패 에요!';
          print(diabetesEmptyResultString.value);
        }
      }
      if (check?.get(diabetesDateInfo)?.diabetesBeforeMeal != null) {
        final _result = check?.get(diabetesDateInfo)?.diabetesBeforeMeal;
        print('목표 식전 혈당 ${_result}');
        print('비교 식전 혈당 ${diabetesBefore.value.toInt()}');
        if (_result! >= diabetesBefore.value.toInt()) {
          diabetesBefore.value.toInt() <= 0
              ? diabetesBeforeResultString.value = '-'
              : diabetesBeforeResultString.value = '성공 했어요';
          print(diabetesBeforeResultString.value);
        } else {
          diabetesBeforeResultString.value = '실패 에요!';
          print(diabetesBeforeResultString.value);
        }
      }
      if (check?.get(diabetesDateInfo)?.diabetesAfterMeal != null) {
        final _result = check?.get(diabetesDateInfo)?.diabetesAfterMeal;
        print('목표 식후 혈당 ${_result}');
        print('비교 식후 혈당 ${diabetesAfter.value.toInt()}');
        if (_result! >= diabetesAfter.value.toInt()) {
          diabetesAfter.value.toInt() <= 0
              ? diabetesAfterResultString.value = '-'
              : diabetesAfterResultString.value = '성공 했어요';
          print(diabetesAfterResultString.value);
        } else {
          diabetesAfterResultString.value = '실패 에요!';
          print(diabetesAfterResultString.value);
        }
      }
    }
  }

  void stateBloodMonth() {
    isStateBloodMonth.value = true;
    isStateBloodMonthAgo.value = false;
    isStateBlood3Month.value = false;

    print(
        '${isStateBloodMonth.value} / ${isStateBloodMonthAgo.value} / ${isStateBlood3Month.value}');
    bloodPressureAverage();
    bloodPressureResultString();
  }

  void stateBloodMonthAge() {
    isStateBloodMonthAgo.value = true;
    isStateBloodMonth.value = false;
    isStateBlood3Month.value = false;

    print(
        '${isStateBloodMonth.value} / ${isStateBloodMonthAgo.value} / ${isStateBlood3Month.value}');
    bloodPressureAverage();
    bloodPressureResultString();
  }

  void stateBlood3Month() {
    isStateBlood3Month.value = true;
    isStateBloodMonth.value = false;
    isStateBloodMonthAgo.value = false;

    print(
        '${isStateBloodMonth.value} / ${isStateBloodMonthAgo.value} / ${isStateBlood3Month.value}');
    bloodPressureAverage();
    bloodSysResultString.value = '-';
  }

  void bloodPressureResultString() {
    bloodSysResultString.value = '-';
    if (bloodDateInfo != null) {
      if (check?.get(bloodDateInfo)?.bloodPressure1 != null) {
        final _result = check?.get(bloodDateInfo)?.bloodPressure1;
        print('목표 수축기 혈압 ${_result}');
        print('비교 수축기 혈압 ${bloodSys.value.toInt()}');
        if (_result! >= bloodSys.value.toInt()) {
          bloodSys.value.toInt() <= 0
              ? bloodSysResultString.value = '-'
              : bloodSysResultString.value = '성공 했어요';
          print(bloodSysResultString.value);
        } else {
          bloodSysResultString.value = '실패 에요!';
          print(bloodSysResultString.value);
        }
      }
    }
  }

  void stateFoodMonth() {
    isStateFoodMonth.value = true;
    isStateFoodMonthAgo.value = false;
    isStateFood3Month.value = false;

    print(
        '${isStateFoodMonth.value} / ${isStateFoodMonthAgo.value} / ${isStateFood3Month.value}');
    foodAverage();
    foodResultString();
  }

  void stateFoodMonthAge() {
    isStateFoodMonthAgo.value = true;
    isStateFoodMonth.value = false;
    isStateFood3Month.value = false;

    print(
        '${isStateFoodMonth.value} / ${isStateFoodMonthAgo.value} / ${isStateFood3Month.value}');
    foodAverage();
    foodResultString();
  }

  void stateFood3Month() {
    isStateFood3Month.value = true;
    isStateFoodMonth.value = false;
    isStateFoodMonthAgo.value = false;

    print(
        '${isStateFoodMonth.value} / ${isStateFoodMonthAgo.value} / ${isStateFood3Month.value}');
    foodAverage();
    badFoodResultString.value = '-';
  }

  void foodResultString() {
    badFoodResultString.value = '-';
    if (foodDateInfo != null) {
      if (check?.get(foodDateInfo)?.badFood != null) {
        final _result = check?.get(foodDateInfo)?.badFood;
        print('목표 않좋은 음식 ${_result}');
        print('비교 않좋은 음식 ${badFoodResult.value.toInt()}');
        if (_result! >= badFoodResult.value.toInt()) {
          badFoodResult.value.toInt() <= 0
              ? badFoodResultString.value = '-'
              : badFoodResultString.value = '성공 했어요';
          print(badFoodResultString.value);
        } else {
          badFoodResultString.value = '실패 에요!';
          print(badFoodResultString.value);
        }
      }
    }
  }

  void stateHealthMonth() {
    isStateHealthMonth.value = true;
    isStateHealthMonthAgo.value = false;
    isStateHealth3Month.value = false;

    print(
        '${isStateHealthMonth.value} / ${isStateHealthMonthAgo.value} / ${isStateHealth3Month.value}');
    monthName.value = '이번 달';
    healthSumAverage();
    healthCheckResultString();
  }

  void stateHealthMonthAge() {
    isStateHealthMonthAgo.value = true;
    isStateHealthMonth.value = false;
    isStateHealth3Month.value = false;

    print(
        '${isStateHealthMonth.value} / ${isStateHealthMonthAgo.value} / ${isStateHealth3Month.value}');
    monthName.value = '지난 달';
    healthSumAverage();
    healthCheckResultString();
  }

  void stateHealth3Month() {
    isStateHealth3Month.value = true;
    isStateHealthMonth.value = false;
    isStateHealthMonthAgo.value = false;

    print(
        '${isStateHealthMonth.value} / ${isStateHealthMonthAgo.value} / ${isStateHealth3Month.value}');
    monthName.value = '3개월';
    healthSumAverage();
    healthResultString.value = '-';
  }

  void healthCheckResultString() {
    healthResultString.value = '-';
    if (healthDateInfo != null) {
      if (check?.get(healthDateInfo)?.health != null) {
        final _result = check?.get(healthDateInfo)?.health;
        print('목표 운동 횟수 ${_result}');
        print('비교 운동 횟수 ${healthSum.value.toInt()}');
        if (_result! >= healthSum.value.toInt()) {
          healthSum.value.toInt() <= 0
              ? healthResultString.value = '-'
              : healthResultString.value = '성공 했어요';
          print(healthResultString.value);
        } else {
          healthResultString.value = '실패 에요!';
          print(healthResultString.value);
        }
      }
    }
  }

  void diabetesAverage() {
    dynamic _trueInfo;
    //String _dateInfo = '';
    List _dateTrueList = [];
    List<int> _diabetesEmptyList = [];
    List<int> _diabetesBeforeList = [];
    List<int> _diabetesAfterList = [];
    int _resultCount = 0;

    List.generate(
      mainBox?.toMap().length == null ? 0 : mainBox!.toMap().length,
      (index) {
        int year = int.parse(
            '${mainBox?.toMap().keys.elementAt(index).toString().replaceRange(4, null, '')}');
        int month = int.parse(
            '${mainBox?.toMap().keys.elementAt(index).toString().replaceRange(0, 5, '').replaceRange(2, null, '')}');
        int day = int.parse(
            '${mainBox?.toMap().keys.elementAt(index).toString().replaceRange(0, 8, '').replaceRange(2, null, '')}');
        _trueInfo = mainBox?.toMap().values.elementAt(index);

        void dateInfoAdd() {
          _dateTrueList.add(_trueInfo);
          // _dateInfo = '${year}-${month}';
          diabetesDateInfo = '${year}-${month}';
          print('dateInfo = ${diabetesDateInfo}');
        }

        print('${year}년 ${month}월 ${day}일');
        if (isStateDiabetesMonth.value == true) {
          DateTime.now().year == year && DateTime.now().month == month
              ? dateInfoAdd()
              : null;
        } else if (isStateDiabetesMonthAgo.value == true) {
          DateTime.now().year == year && DateTime.now().month - 1 == month
              ? dateInfoAdd()
              : null;
        } else if (isStateDiabetes3Month.value == true) {
          DateTime.now()
                      .add(Duration(days: -90))
                      .isBefore(DateTime(year, month, day)) ==
                  true
              ? dateInfoAdd()
              : null;
        }
      },
    );

    for (int a = 0; a < _dateTrueList.length; a++) {
      _dateTrueList[a]['공복'] == null
          ? null
          : _diabetesEmptyList.add(_dateTrueList[a]['공복']);
      _dateTrueList[a]['식전'] == null
          ? null
          : _diabetesBeforeList.add(_dateTrueList[a]['식전']);
      _dateTrueList[a]['식후'] == null
          ? null
          : _diabetesAfterList.add(_dateTrueList[a]['식후']);
    }
    print(
        '공복집계 ${_diabetesEmptyList} | 식전집계 ${_diabetesBeforeList} | 식후집계 ${_diabetesAfterList} ');
    diabetesEmpty.value = _diabetesEmptyList.isNotEmpty
        ? _diabetesEmptyList.reduce((value, element) => value + element) /
            _diabetesEmptyList.length
        : 0.0;
    diabetesBefore.value = _diabetesBeforeList.isNotEmpty
        ? _diabetesBeforeList.reduce((value, element) => value + element) /
            _diabetesBeforeList.length
        : 0.0;
    diabetesAfter.value = _diabetesAfterList.isNotEmpty
        ? _diabetesAfterList.reduce((value, element) => value + element) /
            _diabetesAfterList.length
        : 0.0;

    print(
        '평균공복합계 ${diabetesEmpty.toInt()} | 평균식전합계 ${diabetesBefore.toInt()} | 평균식후합계 ${diabetesAfter.toInt()}');

    _diabetesEmptyList.isNotEmpty ? _resultCount++ : null;
    _diabetesBeforeList.isNotEmpty ? _resultCount++ : null;
    _diabetesAfterList.isNotEmpty ? _resultCount++ : null;
    print('_resultCount = ${_resultCount}');
    totalDiabetesAverage.value = diabetesEmpty.value +
        diabetesBefore.value +
        diabetesAfter.value / _resultCount;
    print(
        '전체 평균 혈당 ${diabetesEmpty.value + diabetesBefore.value + diabetesAfter.value / _resultCount}');
  }

  void bloodPressureAverage() {
    dynamic _trueInfo;
    List _dateTrueList = [];
    List<int> _sysList = [];
    List<int> _diaList = [];

    List.generate(
      bloodBox?.toMap().length == null ? 0 : bloodBox!.toMap().length,
      (index) {
        int year = int.parse(
            '${bloodBox?.toMap().keys.elementAt(index).toString().replaceRange(4, null, '')}');
        int month = int.parse(
            '${bloodBox?.toMap().keys.elementAt(index).toString().replaceRange(0, 5, '').replaceRange(2, null, '')}');
        int day = int.parse(
            '${bloodBox?.toMap().keys.elementAt(index).toString().replaceRange(0, 8, '').replaceRange(2, null, '')}');
        _trueInfo = bloodBox?.toMap().values.elementAt(index);

        void dateInfoAdd() {
          _dateTrueList.add(_trueInfo);
          bloodDateInfo = '${year}-${month}';
          print('dateInfo = ${bloodDateInfo}');
        }

        print('${year}년 ${month}월 ${day}일');
        if (isStateBloodMonth.value == true) {
          DateTime.now().year == year && DateTime.now().month == month
              ? dateInfoAdd()
              : null;
        } else if (isStateBloodMonthAgo.value == true) {
          DateTime.now().year == year && DateTime.now().month - 1 == month
              ? dateInfoAdd()
              : null;
        } else if (isStateBlood3Month.value == true) {
          DateTime.now()
                      .add(Duration(days: -90))
                      .isBefore(DateTime(year, month, day)) ==
                  true
              ? dateInfoAdd()
              : null;
        }
      },
    );

    for (int a = 0; a < _dateTrueList.length; a++) {
      _sysList.add(_dateTrueList[a]['수축기']);
      _diaList.add(_dateTrueList[a]['이완기']);
    }
    print('수축기 집계 ${_sysList} | 이완기 집계 ${_diaList}');
    bloodSys.value = _sysList.isNotEmpty
        ? _sysList.reduce((value, element) => value + element) / _sysList.length
        : 0.0;
    bloodDia.value = _diaList.isNotEmpty
        ? _diaList.reduce((value, element) => value + element) / _diaList.length
        : 0.0;

    print('전체 평균 수축기 ${bloodSys.toInt()} | 전체 평균 이완기 ${bloodDia.toInt()}');
  }

  void foodAverage() {
    dynamic _trueInfo;
    List _dateTrueList = [];
    List<int> _badFoodList = [];
    List<int> _goodFoodList = [];
    List<int> _sosoFoodList = [];

    List.generate(
      foodBox?.toMap().length == null ? 0 : foodBox!.toMap().length,
      (index) {
        int year = int.parse(
            '${foodBox?.toMap().keys.elementAt(index).toString().replaceRange(4, null, '')}');
        int month = int.parse(
            '${foodBox?.toMap().keys.elementAt(index).toString().replaceRange(0, 5, '').replaceRange(2, null, '')}');
        int day = int.parse(
            '${foodBox?.toMap().keys.elementAt(index).toString().replaceRange(0, 8, '').replaceRange(2, null, '')}');
        _trueInfo = foodBox?.toMap().values.elementAt(index);

        void dateInfoAdd() {
          _dateTrueList.add(_trueInfo);
          foodDateInfo = '${year}-${month}';
          print('dateInfo = ${foodDateInfo}');
        }

        print('${year}년 ${month}월 ${day}일');
        if (isStateFoodMonth.value == true) {
          DateTime.now().year == year && DateTime.now().month == month
              ? dateInfoAdd()
              : null;
        } else if (isStateFoodMonthAgo.value == true) {
          DateTime.now().year == year && DateTime.now().month - 1 == month
              ? dateInfoAdd()
              : null;
        } else if (isStateFood3Month.value == true) {
          DateTime.now()
                      .add(Duration(days: -90))
                      .isBefore(DateTime(year, month, day)) ==
                  true
              ? dateInfoAdd()
              : null;
        }
      },
    );
    print(_dateTrueList);

    for (int a = 0; a < _dateTrueList.length; a++) {
      _dateTrueList[a]['않좋은 음식'] == null
          ? null
          : _badFoodList.add(_dateTrueList[a]['않좋은 음식']);
      _dateTrueList[a]['좋은 음식'] == null
          ? null
          : _goodFoodList.add(_dateTrueList[a]['좋은 음식']);
      _dateTrueList[a]['애매한 음식'] == null
          ? null
          : _sosoFoodList.add(_dateTrueList[a]['애매한 음식']);
    }
    badFoodResult.value = _badFoodList.isNotEmpty
        ? _badFoodList.reduce((value, element) => value + element).toDouble()
        : 0.0;
    goodFoodResult.value = _goodFoodList.isNotEmpty
        ? _goodFoodList.reduce((value, element) => value + element).toDouble()
        : 0.0;
    sosoFoodResult.value = _sosoFoodList.isNotEmpty
        ? _sosoFoodList.reduce((value, element) => value + element).toDouble()
        : 0.0;

    print(
        '평균 않좋은 음식합계 ${badFoodResult.toInt()} | 평균 좋은 음식합계 ${goodFoodResult.toInt()} | 평균 애매한 음식합계 ${sosoFoodResult.toInt()}');
  }

  void healthSumAverage() {
    dynamic _trueInfo;
    List _dateTrueList = [];
    List<int> _healthList = [];

    print(healthEventBox?.toMap());

    List.generate(
      healthEventBox?.toMap().length == null
          ? 0
          : healthEventBox!.toMap().length,
      (index) {
        int year = int.parse(
            '${healthEventBox?.toMap().keys.elementAt(index).toString().replaceRange(4, null, '')}');
        int month = int.parse(
            '${healthEventBox?.toMap().keys.elementAt(index).toString().replaceRange(0, 5, '').replaceRange(2, null, '')}');
        int day = int.parse(
            '${healthEventBox?.toMap().keys.elementAt(index).toString().replaceRange(0, 8, '').replaceRange(2, null, '')}');
        _trueInfo = healthEventBox?.toMap().values.elementAt(index);

        void dateInfoAdd() {
          _dateTrueList.add(_trueInfo);
          healthDateInfo = '${year}-${month}';
          print('dateInfo = ${healthDateInfo}');
        }

        print('${year}년 ${month}월 ${day}일');
        if (isStateHealthMonth.value == true) {
          DateTime.now().year == year && DateTime.now().month == month
              ? dateInfoAdd()
              : null;
        } else if (isStateHealthMonthAgo.value == true) {
          DateTime.now().year == year && DateTime.now().month - 1 == month
              ? dateInfoAdd()
              : null;
        } else if (isStateHealth3Month.value == true) {
          DateTime.now()
                      .add(Duration(days: -90))
                      .isBefore(DateTime(year, month, day)) ==
                  true
              ? dateInfoAdd()
              : null;
        }
      },
    );

    for (int a = 0; a < _dateTrueList.length; a++) {
      _healthList.add(_dateTrueList[a]['운동'].length);
    }
    print('운동 집계 ${_healthList}');
    healthSum.value = _healthList.isNotEmpty
        ? _healthList.reduce((value, element) => value + element)
        : 0;
    print('전체 평균 운동횟수 ${healthSum}');
  }
}
