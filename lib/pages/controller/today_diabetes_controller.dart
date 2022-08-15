import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

TextEditingController diabetesCreateController = TextEditingController();
GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

class TodayDiabetesController extends GetxController {
  static TodayDiabetesController get to => Get.find();

  CalendarFormat calendarFormat1 = CalendarFormat.twoWeeks;
  DateTime focusedDay1 = DateTime.now();
  DateTime? selectedDay1;
  DateTime? rangeStart1;
  DateTime? rangeEnd1;

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

// dropDown Button
  RxString selectedItem = '공복'.obs;
}
