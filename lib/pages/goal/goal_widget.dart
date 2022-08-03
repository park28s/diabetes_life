import 'package:diabetes_life/main.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/goal/goal_page.dart';
import 'package:flutter/material.dart';

// 월별 목표 혈당 입력
Widget diabetesGoal() {
  return LayoutBuilder(
    builder: (BuildContext, size) => SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.maxHeight * 0.02),
          AutoSizeTextConfig().TextConfig2(
              '${timeNow.month.toString()}월달 목표 혈당을 적어 주세요',
              1,
              30,
              15,
              Colors.black,
              20,
              FontWeight.w700),
          SizedBox(height: size.maxHeight * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AutoSizeTextConfig().TextConfig2(
                      '공복', 1, 30, 15, Colors.deepPurple, 20, FontWeight.w700),
                  textEditForm(diabetesEmptyStomachController, TextInputType.number)
                ],
              ),
              Column(
                children: [
                  AutoSizeTextConfig().TextConfig2(
                      '식전', 1, 30, 15, Colors.deepPurple, 20, FontWeight.w700),
                  textEditForm(diabetesBeforeMealController, TextInputType.number)
                ],
              ),
              Column(
                children: [
                  AutoSizeTextConfig().TextConfig2(
                      '식후', 1, 30, 15, Colors.deepPurple, 20, FontWeight.w700),
                  textEditForm(diabetesAfterMealController, TextInputType.number)
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

// 월별 목표 혈압 입력
Widget bloodPressureGoal() {
  return LayoutBuilder(
    builder: (BuildContext, size) => SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.maxHeight * 0.02),
          AutoSizeTextConfig().TextConfig2(
              '${timeNow.month.toString()}월달 목표 혈압을 적어 주세요',
              1,
              30,
              15,
              Colors.black,
              20,
              FontWeight.w700),
          SizedBox(height: size.maxHeight * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AutoSizeTextConfig().TextConfig2(
                      '수축기', 1, 30, 15, Colors.deepPurple, 20, FontWeight.w700),
                  textEditForm(bloodPressureController1, TextInputType.number)
                ],
              ),
              Column(
                children: [
                  AutoSizeTextConfig().TextConfig2(
                      '이완기', 1, 30, 15, Colors.deepPurple, 20, FontWeight.w700),
                  textEditForm(bloodPressureController2, TextInputType.number)
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

// 월별 목표 나쁜음식과 운동 입력
Widget badFoodGoal() {
  return LayoutBuilder(
    builder: (BuildContext, size) => SingleChildScrollView(
      child: Column(
        children: [
            SizedBox(height: size.maxHeight * 0.15),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeTextConfig().TextConfig2(
                '${timeNow.month.toString()}월달 나쁜 음식은 ',
                1,
                30,
                15,
                Colors.black,
                20,
                FontWeight.w700),
            textEditForm(badFoodController, TextInputType.number),
            AutoSizeTextConfig().TextConfig2(
                '번 먹고,', 1, 30, 15, Colors.black, 20, FontWeight.w700),
          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.maxHeight * 0.02),
              AutoSizeTextConfig().TextConfig2(
                  '운동은 ',
                  1,
                  30,
                  15,
                  Colors.black,
                  20,
                  FontWeight.w700),
              textEditForm(healthController, TextInputType.number),
              AutoSizeTextConfig().TextConfig2(
                  '번 할래요!,', 1, 30, 15, Colors.black, 20, FontWeight.w700),
            ],
          ),
      ]
      ),
    ),
  );
}
