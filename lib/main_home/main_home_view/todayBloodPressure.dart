import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/controller/today_bloodpressure_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 메인에 배치 될 오늘의 혈압 위젯
Widget todayBloodPressure() {
  Get.put(TodayBloodPressureController());
  todayBloodMain();
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(
      children: [
        SizedBox(height: size.maxHeight * 0.05),
        textView(
            size.maxWidth - 10, '오늘의 혈압', 20.0, Colors.black, FontWeight.w700),
        textView(size.maxWidth - 10, '(마지막 측정 기준)', 15.0, Colors.black,
            FontWeight.w700),
        Row(
          children: [
            SizedBox(width: size.maxWidth * 0.05),
            textView(size.maxWidth -10, '수축기', 20.0, Colors.black, FontWeight.w700),
            Obx(() => textView(size.maxWidth -10, '${Get.find<TodayBloodPressureController>().dayBloodPressure1.value}'
                , 20.0, Colors.deepOrangeAccent, FontWeight.bold)),
            SizedBox(width: size.maxWidth * 0.05),
            textView(size.maxWidth -10, '이완기', 20.0, Colors.black, FontWeight.w700),
            Obx(() => textView(size.maxWidth -10, '${Get.find<TodayBloodPressureController>().dayBloodPressure2.value}'
                , 20.0, Colors.deepOrangeAccent, FontWeight.bold)),
            SizedBox(width: size.maxWidth * 0.05),
          ],
        ),
        SizedBox(height: size.maxHeight * 0.1)
      ],
    ),
  );
}

//note : 이전 메인 소스 (혹시 이상 생기면 참조)
/* TextView().textView(
          '오늘의 혈압', size.maxWidth * 0.05, FontWeight.w700, Colors.black),
      SizedBox(height: size.maxHeight * 0.05),
      TextView().textView(
          '(마지막 측정 기준)', size.maxWidth * 0.05, FontWeight.w700, Colors.black),
      SizedBox(height: size.maxHeight * 0.05),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              TextView().textView(
                  '수축기', size.maxWidth * 0.1, FontWeight.w200, Colors.black),
              SizedBox(width: size.maxWidth * 0.02),
              Obx(() => TextView().textView(
                  '${Get.find<TodayBloodPressureController>().dayBloodPressure1.value}',
                  size.maxWidth * 0.1,
                  FontWeight.bold,
                  Colors.deepOrangeAccent)),
            ],
          ),
          Row(
            children: [
              TextView().textView(
                  '이완기', size.maxWidth * 0.1, FontWeight.w200, Colors.black),
              SizedBox(width: size.maxWidth * 0.02),
              Obx(() => TextView().textView(
                  '${Get.find<TodayBloodPressureController>().dayBloodPressure2.value}',
                  size.maxWidth * 0.1,
                  FontWeight.bold,
                  Colors.deepOrangeAccent)),
            ],
          ),
        ],
      )*/
