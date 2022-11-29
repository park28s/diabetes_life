import 'dart:collection';
import 'package:diabetes_life/main.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:diabetes_life/pages/today_health/today_health_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class TodayHealthController extends GetxController {
  static TodayHealthController get to => Get.find();

  late final ValueNotifier<List<HealthEvent>> selectedEvents4;
  CalendarFormat calendarFormat3 = CalendarFormat.twoWeeks;
  DateTime focusedDay3 = DateTime.now();
  DateTime? selectedDay3;
  DateTime? selectedDay5;
  RxString healthSelect = 'pinkAccent'.obs;
  RxList<dynamic> healthSelect2 = [].obs; //운동리스트
  RxList<dynamic> healthSelect3 = [].obs; //운동색상리스트
  List<dynamic> health = []; //이벤트박스에 운동리스트
  List<dynamic> healthColor = []; //이벤트박스에 운동색상리스트
  //List<dynamic> testText = []; //선택 이벤트 내용

  @override
  void onInit() {
    super.onInit();
    selectedDay3 = focusedDay3;
    selectedEvents4 = ValueNotifier(getEventsForDay(selectedDay3!));
  }


  void dayHealthUpdate() async {
    int index = healthEventBox?.values.length == null
        ? 0
        : healthEventBox!.values.length;
    print('//////////');
    print(focusedDay3.toString().replaceRange(11, null, ''));
    print(healthEventBox?.values.length);

    for (int a = 0; a < index; a++)
      if (healthEventBox?.values
              .elementAt(a)['날짜']
              .toString()
              .replaceRange(11, null, '') ==
          focusedDay3.toString().replaceRange(11, null, '')) {
        print(a);
        print('운동  -- ${healthEventBox?.values.elementAt(a)['운동']}');
        print(healthEventBox?.values.elementAt(a)['날짜'].toString());


        health.addAll({healthEventBox?.values.elementAt(a)['운동']});
        healthColor.addAll({healthEventBox?.values.elementAt(a)['색상']});
      }

    print(
        '헬스?? == ${await Hive.box<Map<dynamic, dynamic>>('healthEventBox').toMap()}');
    print('health == ${health}');
    print('셀렉트이벤트 = ${selectedEvents4.value}');
    print('헬스이벤트박스 = ${healthEventBox?.values}');

    //health.clear();
    print('///////////');
    update();
  }

  // Table Calender Event 가져오기
  List<HealthEvent> getEventsForDay(DateTime day) {
    return hEvents[day] ?? [];
  }

  void tabOnDaySelected(selectedDay, focusedDay) {
    selectedDay3 = selectedDay;
    focusedDay3 = focusedDay;
    update();
  }

  void tabOnFormatChanged(format) {
    calendarFormat3 = format;
    update();
  }

  void tabOnDayFormat() {
    print('tabOnDayFormat');
    focusedDay3 = DateTime.now();
    selectedDay3 = focusedDay3;
    update();
  }

  void selectedEventWrite() {
    selectedDay3 = focusedDay3;
    // todayFoodMain();
    update();
    Get.back();
  }

  void selectedEventDel() {
    selectedDay3 = focusedDay3;
    update();
  }
}
/////////////////////////////////////////////////////////

// Table Calender 에서 제공하는 이벤트 생성
class HealthEvent {
  final dynamic title;

  const HealthEvent(this.title);

  @override
  String toString() {
    return title;
  }
}

final hEvents = LinkedHashMap<DateTime, List<HealthEvent>>(
  // 아래 옵션들은 특정날(당일)에 대한 이벤트를 넣어 주는듯..
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(eventSource4);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

void todayHealthWhenComplete() {
  hEvents.clear();
  eventPut4().then((value) => getSnackBar('완료', '등록이 완료 되었습니다!'));
  print('등록 누르고 hEvents = ${hEvents}');
  print('등록누르고 healthBoxKey = ${healthEventBox?.keys}');
}
