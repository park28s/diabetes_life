import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:diabetes_life/pages/goal/goal_page.dart';
import 'package:flutter/material.dart';

// 월별 목표 혈당 입력
Widget diabetesGoal(double width, double height) {
  return Expanded(
    child: mainContainer(
      width,
      height,
      Colors.white,
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${timeNow.month.toString()}월달 목표 혈당을 적어 주세요',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'MaruBuri'),
            ),
            SizedBox(height: 20),
            diabetesItem(),
            SizedBox(height: 10)
          ],
        ),
      ),
    ),
  );
}

// 혈당 아이템
Widget diabetesItem() {
  return Row(
    children: [
      Column(
        children: [
          Text('공복',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'MaruBuri')),
          textEditForm(diabetesEmptyStomachController, TextInputType.number),
        ],
      ),
      SizedBox(width: 30),
      Column(
        children: [
          Text('식전',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'MaruBuri')),
          textEditForm(diabetesBeforeMealController, TextInputType.number),
        ],
      ),
      SizedBox(width: 30),
      Column(
        children: [
          Text('식후',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'MaruBuri')),
          textEditForm(diabetesAfterMealController, TextInputType.number),
        ],
      )
    ],
  );
}

// 월별 목표 혈압 입력
Widget bloodPressureGoal(double width, double height) {
  return Expanded(
    child: mainContainer(
      width,
      height,
      Colors.white,
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Text(
              '${timeNow.month.toString()}월달 목표 혈압을 적어 주세요',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'MaruBuri'),
            ),
            SizedBox(height: 20),
            bloodPressureItem(),
            SizedBox(height: 10)
          ],
        ),
      ),
    ),
  );
}

// 혈압 아이템
Widget bloodPressureItem() {
  return Row(
    children: [
      Column(
        children: [
          AutoSizeTextConfig().TextConfig2(
              '수축기', 1, 25, 10, Colors.deepPurple, 20, FontWeight.w700),
          textEditForm(bloodPressureController1, TextInputType.number)
        ],
      ),
      SizedBox(width: 30),
      Column(
        children: [
          AutoSizeTextConfig().TextConfig2(
              '이완기', 1, 25, 10, Colors.deepPurple, 20, FontWeight.w700),
          textEditForm(bloodPressureController2, TextInputType.number)
        ],
      ),
    ],
  );
}

// 월별 목표 나쁜음식과 운동 입력
Widget badFoodGoal(double width, double height) {
  return Expanded(
    child: mainContainer(
      width,
      height,
      Colors.white,
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${timeNow.month.toString()}월달 나쁜 음식은 ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'MaruBuri'),
                ),
                textEditForm(badFoodController, TextInputType.number),
                Text(
                  '번 먹고,',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'MaruBuri'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '운동은 ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'MaruBuri'),
                ),
                textEditForm(healthController, TextInputType.number),
                Text(
                  '번 할래요!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'MaruBuri'),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}
