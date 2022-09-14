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
        SizedBox(height: size.maxHeight * 0.05),
        AutoSizeTextConfig().TextConfig2(
            '오늘의 음식', 1, 30, 13, Colors.black, 10, FontWeight.w700),
        SizedBox(height: size.maxHeight * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                foodContainer(size.maxWidth * 0.25, size.maxHeight * 0.25, FoodListColors().bad, '안좋은음식'),
                SizedBox(height: size.maxHeight * 0.05),
              Obx(() => AutoSizeTextConfig().TextConfig1('${TodayFoodController.to.badFood.value}', 1, Colors.black, FontWeight.w500))
              ],
            ),
            Column(
              children: [
                foodContainer(size.maxWidth * 0.25, size.maxHeight * 0.25, FoodListColors().good, '좋은 음식'),
                SizedBox(height: size.maxHeight * 0.05),
                Obx(() => AutoSizeTextConfig().TextConfig1('${TodayFoodController.to.goodFood.value}', 1, Colors.black, FontWeight.w500))
              ],
            ),
            Column(
              children: [
                foodContainer(size.maxWidth * 0.25, size.maxHeight * 0.25, FoodListColors().soso, '애매한음식'),
                SizedBox(height: size.maxHeight * 0.05),
                Obx(() => AutoSizeTextConfig().TextConfig1('${TodayFoodController.to.sosoFood.value}', 1, Colors.black, FontWeight.w500))
              ],
            )
          ],
        )
      ],
    ),
  );
}
