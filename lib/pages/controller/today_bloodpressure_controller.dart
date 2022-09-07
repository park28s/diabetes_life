import 'dart:collection';
import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:diabetes_life/pages/today_bloodpressure/today_bloodpressure_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

TextEditingController bloodCreateController1 = TextEditingController();
TextEditingController bloodCreateController2 = TextEditingController();
GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

class TodayBloodPressureController extends GetxController {
  static TodayBloodPressureController get to => Get.find();

  RxInt dayBloodPressure1 = 0.obs;
  RxInt dayBloodPressure2 = 0.obs;

  late final ValueNotifier<List<BloodEvent>> selectedEvents2;
  CalendarFormat calendarFormat2 = CalendarFormat.twoWeeks;
  DateTime focusedDay2 = DateTime.now();
  DateTime? selectedDay2;
  DateTime? selectedDay4;

  @override
  void onInit() {
    super.onInit();
    selectedDay2 = focusedDay2;
    selectedEvents2 = ValueNotifier(getEventsForDay(selectedDay2!));
  }

  void mainTodayBloodGet() {
    if (todayBloodMainMap['수축기'] == null) {
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
        'GetX2 === 수축기 ${todayBloodMainMap['수축기']} 이완기 ${todayBloodMainMap['이완기']}');
  }

  void tabOnDaySelected(selectedDay, focusedDay) {
    selectedDay2 = selectedDay;
    focusedDay2 = focusedDay;
    update();
  }

  void tabOnFormatChanged(format) {
    calendarFormat2 = format;
    update();
  }

  void tabOnDayFormat() {
    print('tabOnDayFormat');
    focusedDay2 = DateTime.now();
    selectedDay2 = focusedDay2;
    update();
  }

  void selectedEventWrite() {
    selectedDay2 = focusedDay2;
    todayBloodMain();
    update();
    Get.back();
  }

  void selectedEventDel() {
    selectedDay2 = focusedDay2;
    update();
  }

// Table Calender Event 가져오기
  List<BloodEvent> getEventsForDay(DateTime day) {
    return kEvents2[day] ?? [];
  }

// dropDown Button
  RxString selectedItem = '공복'.obs;
}

/////////////////////////
class BloodEvent {
  final String title;

  const BloodEvent(this.title);

  @override
  String toString() {
    return title;
  }
}

final kEvents2 = LinkedHashMap<DateTime, List<BloodEvent>>(
  // 아래 옵션들은 특정날(당일)에 대한 이벤트를 넣어 주는듯..
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(eventSource2);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

void todayBloodWhenComplete() {
  kEvents2.clear();
  eventPut2().then((value) => getSnackBar('완료', '등록이 완료 되었습니다!'));

  print('등록 누르고 kEvents2 = ${kEvents2}');
  print('등록누르고 bloodBoxKey = ${bloodBox?.keys}');
}

void todayBloodMain() {
  var eventKeys = eventSource2.keys;
  DateTime dateTime = DateTime(timeNow.year, timeNow.month, timeNow.day);

  try {
    todayBloodMainList.clear();
    eventKeys.contains(dateTime)
        ? todayBloodMainList.addAll({
            eventSource2
                .map((key, value) => MapEntry(dateTime, value))
                .values
                .first
          })
        : null;
    print('todayBloodMainList == ${todayBloodMainList[0]}');
    print('eventSource2 == ${eventSource2.values.first[0]}');
    todayBloodMainMap.clear();
    todayBloodMainList[0].forEach((e) {
      String a = e.toString().substring(30, 33);
      int b =
          int.parse('${e.toString().substring(34, 38).replaceAll(',', '')}');
      String c = e
          .toString()
          .substring(39, 43)
          .replaceAll(':', '')
          .replaceAll(' ', '');
      int d =
          int.parse('${e.toString().substring(44, null).replaceAll('}', '')}');

      print('a = ${a}');
      print('b = ${b}');
      print('c = ${c}');
      print('d = ${d}');
      todayBloodMainMap.addAll({a: b, c: d});
      print('todayBloodMainMap == ${todayBloodMainMap}');
    });
    TodayBloodPressureController.to.mainTodayBloodGet();
  } catch (e) {
    print(e);
    print('오늘의 혈압 측정 전 입니다.');

    todayBloodMainMap.clear();
    Get.put(TodayBloodPressureController());
    TodayBloodPressureController.to.mainTodayBloodGet();
  }
}
