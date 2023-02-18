import 'package:diabetes_life/main_config/main_colors.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:diabetes_life/pages/controller/today_food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 메인에 배치 될 오늘의 음식 위젯
Widget todayFood() {
  Get.put(TodayFoodController());
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(
      children: [
        //SizedBox(height: size.maxHeight * 0.05),
        textView(
            size.maxWidth - 10, '오늘의 음식', 20.0, Colors.black, FontWeight.w700),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                foodContainer(size.maxWidth * 0.25, size.maxHeight * 0.25,
                   FoodListColors().bad, '안좋은음식', size.maxWidth * 0.04),
                SizedBox(height: size.maxHeight * 0.05),
                Obx(() => TextView().textView(
                    '${TodayFoodController.to.badFood.value}',
                    size.maxWidth * 0.06,
                    FontWeight.bold,
                    Colors.black))
              ],
            ),
            Column(
              children: [
                foodContainer(size.maxWidth * 0.25, size.maxHeight * 0.25,
                    FoodListColors().good, '좋은 음식', size.maxWidth * 0.04),
                SizedBox(height: size.maxHeight * 0.05),
                Obx(() => TextView().textView(
                    '${TodayFoodController.to.goodFood.value}',
                    size.maxWidth * 0.06,
                    FontWeight.bold,
                    Colors.black))
              ],
            ),
            Column(
              children: [
                foodContainer(size.maxWidth * 0.25, size.maxHeight * 0.25,
                    FoodListColors().soso, '애매한음식', size.maxWidth * 0.04),
                SizedBox(height: size.maxHeight * 0.05),
                Obx(() => TextView().textView(
                    '${TodayFoodController.to.sosoFood.value}',
                    size.maxWidth * 0.06,
                    FontWeight.bold,
                    Colors.black))
              ],
            )
          ],
        ),
        SizedBox(height: size.maxHeight * 0.1)
      ],
    ),
  );
}


//note : 이전 메인 소스 (혹시 이상 생기면 참조)
/*TextView().textView(
            '오늘의 음식', size.maxWidth * 0.05, FontWeight.w700, Colors.black),
        SizedBox(height: size.maxHeight * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                foodContainer(size.maxWidth * 0.25, size.maxHeight * 0.25,
                    FoodListColors().bad, '안좋은음식', size.maxWidth * 0.04),
                SizedBox(height: size.maxHeight * 0.05),
                Obx(() => TextView().textView(
                    '${TodayFoodController.to.badFood.value}',
                    size.maxWidth * 0.1,
                    FontWeight.bold,
                    Colors.black))
              ],
            ),
            Column(
              children: [
                foodContainer(size.maxWidth * 0.25, size.maxHeight * 0.25,
                    FoodListColors().good, '좋은 음식', size.maxWidth * 0.04),
                SizedBox(height: size.maxHeight * 0.05),
                Obx(() => TextView().textView(
                    '${TodayFoodController.to.goodFood.value}',
                    size.maxWidth * 0.1,
                    FontWeight.bold,
                    Colors.black))
              ],
            ),
            Column(
              children: [
                foodContainer(size.maxWidth * 0.25, size.maxHeight * 0.25,
                    FoodListColors().soso, '애매한음식', size.maxWidth * 0.04),
                SizedBox(height: size.maxHeight * 0.05),
                Obx(() => TextView().textView(
                    '${TodayFoodController.to.sosoFood.value}',
                    size.maxWidth * 0.1,
                    FontWeight.bold,
                    Colors.black))
              ],
            )
          ],
        )*/