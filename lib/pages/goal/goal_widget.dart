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
              '${DateTime.now().month.toString()}월달 목표 혈당을 적어 주세요',
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
                  textEditForm(diabetesEmptyStomach, TextInputType.number)
                ],
              ),
              Column(
                children: [
                  AutoSizeTextConfig().TextConfig2(
                      '식전', 1, 30, 15, Colors.deepPurple, 20, FontWeight.w700),
                  textEditForm(diabetesBeforeMeal, TextInputType.number)
                ],
              ),
              Column(
                children: [
                  AutoSizeTextConfig().TextConfig2(
                      '식후', 1, 30, 15, Colors.deepPurple, 20, FontWeight.w700),
                  textEditForm(diabetesAfterMeal, TextInputType.number)
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
              '${DateTime.now().month.toString()}월달 목표 혈압을 적어 주세요',
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
                  textEditForm(bloodPressure1, TextInputType.number)
                ],
              ),
              Column(
                children: [
                  AutoSizeTextConfig().TextConfig2(
                      '이완기', 1, 30, 15, Colors.deepPurple, 20, FontWeight.w700),
                  textEditForm(bloodPressure2, TextInputType.number)
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
                '${DateTime.now().month.toString()}월달 나쁜 음식은 ',
                1,
                30,
                15,
                Colors.black,
                20,
                FontWeight.w700),
            textEditForm(badFood, TextInputType.number),
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
              textEditForm(health, TextInputType.number),
              AutoSizeTextConfig().TextConfig2(
                  '번 할래요!,', 1, 30, 15, Colors.black, 20, FontWeight.w700),
            ],
          ),
      ]
      ),
    ),
  );
}
