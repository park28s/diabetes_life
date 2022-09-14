import 'dart:collection';
import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:diabetes_life/pages/today_diabetes/today_diabetes_widget.dart';
import 'package:diabetes_life/pages/today_food/today_food_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class TodayFoodController extends GetxController {
  static TodayFoodController get to => Get.find();

  RxInt goodFood = 0.obs;
  RxInt badFood = 0.obs;
  RxInt sosoFood = 0.obs;
  RxInt? selectedFood = 0.obs;

  void selectedFoodSet(int int) {
    selectedFood!.value = int;
    print(selectedFood);
  }

  void foodNumAdd() {
    if (selectedFood!.value == 1) {
      badFood.value++;
    } else if (selectedFood!.value == 2) {
      goodFood.value++;
    } else if (selectedFood!.value == 3) {
      sosoFood.value++;
    }
  }

  void foodNumMinus() {
    if (selectedFood!.value == 1) {
      badFood.value--;
    } else if (selectedFood!.value == 2) {
      goodFood.value--;
    } else if (selectedFood!.value == 3) {
      sosoFood.value--;
    }
  }

  void mainTodayFoodGet() {
    //todayFoodSumMainList.clear();
    final b = todayFoodMainMap['않좋은 음식'] == null? 0 : todayFoodMainMap['않좋은 음식'];
    print('dfdf == ${todayFoodMainMap['않좋은 음식']}');
    todayFoodSumMainList.addAll({b!});
    print(todayFoodSumMainList);
    final cc = todayFoodSumMainList.reduce((value, element)  {
      print('${value} / ${element}');
      return value + element;});
    print('cc == ${cc}');
    //todayFoodSumMainList.clear();

    /*if (todayBloodMainMap['수축기'] == null) {
      dayBloodPressure1.value = 0;
    } else {
      dayBloodPressure1.value = todayBloodMainMap['수축기']!;
    }

    if (todayBloodMainMap['이완기'] == null) {
      dayBloodPressure2.value = 0;
    } else {
      dayBloodPressure2.value = todayBloodMainMap['이완기']!;
    }

    print('GetX === 수축기 ${dayBloodPressure1} 이완기 ${dayBloodPressure2}');
    print(
        'GetX2 === 수축기 ${todayBloodMainMap['수축기']} 이완기 ${todayBloodMainMap['이완기']}');*/
  }

  late final ValueNotifier<List<FoodEvent>> selectedEvents3;
  CalendarFormat calendarFormat1 = CalendarFormat.twoWeeks;
  DateTime focusedDay1 = DateTime.now();
  DateTime? selectedDay1;
  DateTime? selectedDay3;

  @override
  void onInit() {
    super.onInit();
    selectedDay1 = focusedDay1;
    selectedEvents3 = ValueNotifier(getEventsForDay(selectedDay1!));
  }

  // Table Calender Event 가져오기
  List<FoodEvent> getEventsForDay(DateTime day) {
    return fEvents[day] ?? [];
  }

  void tabOnDaySelected(selectedDay, focusedDay) {
    selectedDay1 = selectedDay;
    focusedDay1 = focusedDay;
    update();
  }

  void tabOnFormatChanged(format) {
    calendarFormat1 = format;
    update();
  }

  void tabOnDayFormat() {
    print('tabOnDayFormat');
    focusedDay1 = DateTime.now();
    selectedDay1 = focusedDay1;
    update();
  }

  void selectedEventWrite() {
    selectedDay1 = focusedDay1;
    todayFoodMain();
    update();
    Get.back();
  }

  void selectedEventDel() {
    selectedDay1 = focusedDay1;
    update();
  }

// dropDown Button
  RxString selectedItem = '공복'.obs;
}
/////////////////////////////////////////////////////////

// Table Calender 에서 제공하는 이벤트 생성
class FoodEvent {
  final String title;

  const FoodEvent(this.title);

  @override
  String toString() {
    return title;
  }
}

final fEvents = LinkedHashMap<DateTime, List<FoodEvent>>(
  // 아래 옵션들은 특정날(당일)에 대한 이벤트를 넣어 주는듯..
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(eventSource3);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

void todayFoodWhenComplete() {
  fEvents.clear();
  eventPut3().then((value) => getSnackBar('완료', '등록이 완료 되었습니다!'));

  print('등록 누르고 fEvents = ${fEvents}');
  print('등록누르고 foodBoxKey = ${foodBox?.keys}');
}

void todayFoodMain() {
  var eventKeys = eventSource3.keys;
  DateTime dateTime = DateTime(timeNow.year, timeNow.month, timeNow.day);
  print('todayFoodMainList == ${todayFoodMainList}');
  print('eventSource3 == ${eventSource3}');

  try {
    todayFoodMainList.clear();
    eventKeys.contains(dateTime)
        ? todayFoodMainList.addAll({
            eventSource3
                .map((key, value) => MapEntry(dateTime, value))
                .values
                .first
          })
        : null;
    print('todayFoodMainList == ${todayFoodMainList[0]}');
    print('eventSource3 == ${eventSource3.values.first[0]}');
    todayFoodMainMap.clear();
    todayFoodMainList[0].forEach((e) {
      print('e == ${e.toString()}');
      String a = e.toString().substring(30, 36);
      int b =
          int.parse('${e.toString().substring(37, 40).replaceAll(',', '')}');
      String c = e
          .toString()
          .substring(41, 48)
          .replaceAll(':', '')
          .replaceAll(' ', '');
      int d = int.parse(
          '${e.toString().substring(47, 51).replaceAll(':', '').replaceAll(',', '').replaceAll(' ', '')}');
      String f = e
          .toString()
          .substring(51, 59)
          .replaceAll(':', '')
          .replaceAll(',', '')
          .replaceAll(' ', '');
      int g = int.parse(
          '${e.toString().substring(59, null).replaceAll(':', '').replaceAll('}', '')}');

      print('a = ${a}'); // 안좋은음식
      print('b = ${b}'); // 안좋은음식 갯수
      print('c = ${c}'); // 좋은음식
      print('d = ${d}'); // 좋은음식 갯수
      print('f = ${f}'); // 애매한음식
      print('g = ${g}'); // 애매한음식 갯수
      todayFoodMainMap.addAll({a: b, c: d, f: g});
      print('todayFoodMainMap == ${todayFoodMainMap}');
    });
    TodayFoodController.to.mainTodayFoodGet();
  } catch (e) {
    print(e);
    print('오늘의 음식 등록 전 입니다.');

    todayFoodMainMap.clear();
    Get.put(TodayFoodController());
    TodayFoodController.to.mainTodayFoodGet();
  }
}
