import 'dart:ui';

import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_controller/setup_controller.dart';
import 'package:diabetes_life/pages/controller/today_bloodpressure_controller.dart';
import 'package:diabetes_life/pages/controller/today_diabetes_controller.dart';
import 'package:diabetes_life/pages/controller/today_food_controller.dart';
import 'package:diabetes_life/pages/goal/goal_page.dart';
import 'package:diabetes_life/pages/today_health/health_management_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 메인 페이지 텍스트 폼
Widget textEditForm(dynamic controller, dynamic keyboardType) {
  return Container(
    width: 50,
    height: 30,
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (v) {
        if (v == null || v.isEmpty || !v.isNum) {
          return '숫자만입력';
        }
        return null;
      },
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(overflow: TextOverflow.clip, fontSize: 15),
    ),
  );
}

Widget textEditCreateForm(dynamic controller, dynamic keyboardType) {
  return Container(
    width: 100,
    height: 50,
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (v) {
        if (v == null || v.isEmpty || !v.isNum) {
          return '숫자만입력';
        }
        return null;
      },
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(overflow: TextOverflow.clip, fontSize: 15),
    ),
  );
}

// 텍스트 폼에 입력 되어 있는 거 클리어
void textFormClear() {
  diabetesEmptyStomachController.clear();
  diabetesBeforeMealController.clear();
  diabetesAfterMealController.clear();
  bloodPressureController1.clear();
  bloodPressureController2.clear();
  badFoodController.clear();
  healthController.clear();
  diabetesCreateController.clear();
  healthListTextEditing.clear();
}

// 각 페이지 별 메인 네임 설정
Widget pageName(String text, Color color) {
  return AutoSizeTextConfig()
      .TextConfig2(text, 1, 20, 13, color, 20, FontWeight.w700);
}

//main start void
void mainStart() {
  todayDiabetesMain();
  todayBloodMain();
  todayFoodMain();
  Get.put(SetupPageController());
  isSettingCheck1!.values.isEmpty
      ? null
      : SetupPageController.to.isChecked1.value = isSettingCheck1!.values.first;
  isSettingCheck2!.values.isEmpty
      ? null
      : SetupPageController.to.isChecked2.value = isSettingCheck2!.values.first;
  Checked1HourBox!.values.isEmpty
      ? null
      : SetupPageController.to.selectIndex1.value =
          Checked1HourBox!.values.first;
  Checked1MinBox!.values.isEmpty
      ? null
      : SetupPageController.to.selectIndex2.value =
          Checked1MinBox!.values.first;
  Checked2HourBox!.values.isEmpty
      ? null
      : SetupPageController.to.selectIndex3.value =
          Checked2HourBox!.values.first;

  print(
      '기기 실 사이즈 = Width : ${window.physicalSize.width} / Height : ${window.physicalSize.height}');
  print('기기 논리 사이즈 = Width : ${mainWidthSize} / Height : ${mainHeightSize}');
}
