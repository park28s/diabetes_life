import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/controller/today_diabetes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double dangHwaResult = 0;

// 메인에 배치 될 예상 당화혈색소 위젯
Widget todayDangHwa() {
  diabetesAverage();
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(children: [
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig().TextConfig2(
          '예상 당화혈색소', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig().TextConfig2(
          '${dangHwaResult.toPrecision(1)}', 1, 40, 15, Colors.deepPurpleAccent, 35, FontWeight.w700),


    ]),
  );
}

void diabetesAverage() {
  List result = [];
  int eventResult;
  double? averageResult;
  final todayDate = timeNow.month - 3;
  final eventValue = kEvents.values;
  final eventKeys = kEvents.keys;
  final eventLength = eventKeys.length;

  for(int i = 0; i < eventLength; i++)
  if(eventKeys.map((e) => e.month).elementAt(i) > todayDate) {
    eventResult = int.parse(eventValue.elementAt(i)[0].toString().substring(34, null).replaceAll('}', ''));
    result.addAll({eventResult});
    averageResult = result.reduce((value, element) => value + element) / result.length;
  }
  dangHwaResult = (averageResult! + 46.7) / 28.7;
  print('3개월 평균혈당 = ${averageResult}');
  print('예상 당화혈색소 = ${dangHwaResult.toPrecision(1)}');

}