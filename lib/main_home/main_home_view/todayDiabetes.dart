import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/controller/today_diabetes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 메인에 배치 될 오늘의 혈당 위젯
Widget todayDiabetes() {
  Get.put(TodayDiabetesController());
  TodayDiabetesController.to.mainTodayDiabetesGet();
  todayDiabetesMain();
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(
      children: [
        SizedBox(height: size.maxHeight * 0.05),
        textView(
            size.maxWidth - 10, '오늘의 혈당', 20.0, Colors.black, FontWeight.w700),
        textView(size.maxWidth - 10, '(마지막 측정 기준)', 15.0, Colors.black,
            FontWeight.w700),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: size.maxWidth * 0.05),
            textView(
                size.maxWidth - 10, '공복', 20.0, Colors.black, FontWeight.w700),
            Obx(() => textView(
                size.maxWidth - 10,
                '${Get.find<TodayDiabetesController>().emptyStomach?.value}',
                20.0,
                Colors.deepOrangeAccent,
                FontWeight.bold)),
            SizedBox(width: size.maxWidth * 0.05),
            textView(
                size.maxWidth - 10, '식전', 20.0, Colors.black, FontWeight.w700),
            Obx(() => textView(
                size.maxWidth - 10,
                '${Get.find<TodayDiabetesController>().beforeMeal.value}',
                20.0,
                Colors.deepOrangeAccent,
                FontWeight.bold)),
            SizedBox(width: size.maxWidth * 0.05),
            textView(
                size.maxWidth - 10, '식후', 20.0, Colors.black, FontWeight.w700),
            Obx(() => textView(
                size.maxWidth - 10,
                '${Get.find<TodayDiabetesController>().afterMeal.value}',
                20.0,
                Colors.deepOrangeAccent,
                FontWeight.bold)),
            SizedBox(width: size.maxWidth * 0.05),
          ],
        ),
        SizedBox(height: size.maxHeight * 0.1)
      ],
    ),
  );
}

//note : 이전 메인 소스 (혹시 이상 생기면 참조)
/*SizedBox(height: size.maxHeight * 0.05),
        TextView().textView(
            '오늘의 혈당', size.maxWidth * 0.03, FontWeight.w700, Colors.black),
        SizedBox(height: size.maxHeight * 0.05),
        TextView().textView(
            '(마지막 측정 기준)', size.maxWidth * 0.05, FontWeight.w700, Colors.black),
        SizedBox(height: size.maxHeight * 0.05),
        Container(
          width: size.maxWidth - 1,
          child: LayoutBuilder(
            builder: (context, containerSize) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      TextView().textView(
                          '공복', containerSize.maxWidth * 0.08, FontWeight.w200, Colors.black),
                      SizedBox(width: containerSize.maxWidth * 0.02),
                      Obx(() => TextView().textView(
                          '${Get.find<TodayDiabetesController>().emptyStomach?.value}',
                          containerSize.maxWidth * 0.09,
                          FontWeight.bold,
                          Colors.deepOrangeAccent)),
                    ],
                  ),
                  Row(
                    children: [
                      TextView().textView(
                          '식전', containerSize.maxWidth * 0.08, FontWeight.w200, Colors.black),
                      SizedBox(width: containerSize.maxWidth * 0.02),
                      Obx(() => TextView().textView(
                          '${Get.find<TodayDiabetesController>().beforeMeal.value}',
                          containerSize.maxWidth * 0.09,
                          FontWeight.bold,
                          Colors.deepOrangeAccent)),
                    ],
                  ),
                  Row(
                    children: [
                      TextView().textView(
                          '식후', containerSize.maxWidth * 0.08, FontWeight.w200, Colors.black),
                      SizedBox(width: containerSize.maxWidth * 0.02),
                      Obx(() => TextView().textView(
                          '${Get.find<TodayDiabetesController>().afterMeal.value}',
                          containerSize.maxWidth * 0.09,
                          FontWeight.bold,
                          Colors.deepOrangeAccent)),
                    ],
                  ),
                ],
              );
            }
          ),
        ),*/
