import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/controller/today_bloodpressure_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 메인에 배치 될 오늘의 혈압 위젯
Widget todayBloodPressure() {
  Get.put(TodayBloodPressureController());
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(children: [
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig()
          .TextConfig2('오늘의 혈압', 1, 30, 13, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig().TextConfig2(
          '(마지막 측정 기준)', 1, 30, 13, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              AutoSizeTextConfig().TextConfig2('수축기', 1, 25, 10, Colors.black, 25, FontWeight.w200),
              SizedBox(width: size.maxWidth * 0.02),
              Obx(() => AutoSizeTextConfig().TextConfig2(
                  '${Get.find<TodayBloodPressureController>().dayBloodPressure1.value}',
                  1,
                  35,
                  10,
                  Colors.deepOrangeAccent,
                  30,
                  FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              AutoSizeTextConfig().TextConfig2('이완기', 1, 25, 10, Colors.black, 25, FontWeight.w200),
              SizedBox(width: size.maxWidth * 0.02),
              Obx(() => AutoSizeTextConfig().TextConfig2(
                  '${Get.find<TodayBloodPressureController>().dayBloodPressure2.value}',
                  1,
                  35,
                  10,
                  Colors.deepOrangeAccent,
                  30,
                  FontWeight.bold)),
            ],
          ),
        ],
      )
    ]),
  );
}