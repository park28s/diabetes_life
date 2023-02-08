import 'dart:collection';
import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:diabetes_life/pages/today_diabetes/today_diabetes_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

TextEditingController diabetesCreateController = TextEditingController();
GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

class TodayDiabetesController extends GetxController {
  static TodayDiabetesController get to => Get.find();

  RxInt? emptyStomach = 0.obs;
  RxInt beforeMeal = 0.obs;
  RxInt afterMeal = 0.obs;

  void mainTodayDiabetesGet() {
    if (todayDiabetesMainMap['공복'] == null) {
      emptyStomach?.value = 0;
    } else {
      emptyStomach!.value = todayDiabetesMainMap['공복']!;
    }

    if (todayDiabetesMainMap['식전'] == null) {
      beforeMeal.value = 0;
    } else {
      beforeMeal.value = todayDiabetesMainMap['식전']!;
    }

    if (todayDiabetesMainMap['식후'] == null) {
      afterMeal.value = 0;
    } else {
      afterMeal.value = todayDiabetesMainMap['식후']!;
    }

    print('GetX === 공복 ${emptyStomach} 식전 ${beforeMeal} 식후 ${afterMeal}');
    print(
        'GetX2 === 공복 ${todayDiabetesMainMap['공복']} 식전 ${todayDiabetesMainMap['식전']} 식후 ${todayDiabetesMainMap['식후']}');
  }

  late final ValueNotifier<List<Event>> selectedEvents;
  CalendarFormat calendarFormat1 = CalendarFormat.twoWeeks;
  DateTime focusedDay1 = DateTime.now();
  DateTime? selectedDay1;
  DateTime? selectedDay3;

  @override
  void onInit() {
    super.onInit();
    selectedDay1 = focusedDay1;
    selectedEvents = ValueNotifier(getEventsForDay(selectedDay1!));
  }

  // Table Calender Event 가져오기
  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
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
    todayDiabetesMain();
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
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() {
    return title;
  }
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  // 아래 옵션들은 특정날(당일)에 대한 이벤트를 넣어 주는듯..
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(eventSource);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

void todayDiabetesWhenComplete() {
  kEvents.clear();
  eventPut().then((value) => getSnackBar('완료', '등록이 완료 되었습니다!'));

  print('등록 누르고 kEvents = ${kEvents}');
  print('등록누르고 mainBoxKey = ${mainBox?.keys}');
}

void todayDiabetesTimePut(saveDateTime) async {
  await Checked2TimeBox?.put('time',
      saveDateTime);
  /*await Checked2TimeBox?.put('time',
      tz.TZDateTime.now(tz.getLocation('Asia/Seoul')));*/
  //print('todayDiabetesTime = ${Checked2TimeBox?.toMap()}');
}

void todayDiabetesMain() {
  var eventKeys = eventSource.keys;
  DateTime dateTime = DateTime(timeNow.year, timeNow.month, timeNow.day);

  try {
    todayDiabetesMainList.clear();
    eventKeys.contains(dateTime)
        ? todayDiabetesMainList.addAll({
            eventSource
                .map((key, value) => MapEntry(dateTime, value))
                .values
                .first
          })
        : null;
    print('todayDiabetesMainList == ${todayDiabetesMainList[0]}');
    todayDiabetesMainMap.clear();
    todayDiabetesMainList[0].forEach((e) {
      String b = e.toString().substring(30, 32);
      int c = int.parse(
          '${e.toString().substring(34, 37).replaceAll('}', '').toString()}');

      todayDiabetesMainMap.addAll({b: c});
      print('todayDiabetesMainMap == ${todayDiabetesMainMap}');
    });
    TodayDiabetesController.to.mainTodayDiabetesGet();
  } catch (e) {
    print('오늘의 혈당 측정 전 입니다.');

    todayDiabetesMainMap.clear();
    Get.put(TodayDiabetesController());
    TodayDiabetesController.to.mainTodayDiabetesGet();
  }
}
