import 'package:diabetes_life/pages/controller/today_diabetes_controller.dart';
import 'package:diabetes_life/pages/goal/goal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 메인페이지 텍스트폼
Widget textEditForm(dynamic controller, dynamic keyboardType) {
  return Container(
    width: 60,
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

// 텍스트폼에 입력 되어 있는 거 클리어
void textFormClear() {
  diabetesEmptyStomachController.clear();
  diabetesBeforeMealController.clear();
  diabetesAfterMealController.clear();
  bloodPressureController1.clear();
  bloodPressureController2.clear();
  badFoodController.clear();
  healthController.clear();
  diabetesCreateController.clear();
}
