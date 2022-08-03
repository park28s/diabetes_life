import 'package:diabetes_life/main.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// 메인에 배치 될 목표 위젯
Widget goalMain() {
  return LayoutBuilder(
      builder: (BuildContext context, size) => ValueListenableBuilder(
          valueListenable: Hive.box<CheckModel>('check').listenable(),
          builder: (context, Box<CheckModel> box, child) {
            final _diabetesEmptyStomach = box
                .get('${timeNow.year}-${timeNow.month}')
                ?.diabetesEmptyStomach;
            final _diabetesBeforeMeal =
                box.get('${timeNow.year}-${timeNow.month}')?.diabetesBeforeMeal;
            final _diabetesAfterMeal =
                box.get('${timeNow.year}-${timeNow.month}')?.diabetesAfterMeal;
            final _bloodPressure1 =
                box.get('${timeNow.year}-${timeNow.month}')?.bloodPressure1;
            final _bloodPressure2 =
                box.get('${timeNow.year}-${timeNow.month}')?.bloodPressure2;
            final _badFood =
                box.get('${timeNow.year}-${timeNow.month}')?.badFood;
            final _health = box.get('${timeNow.year}-${timeNow.month}')?.health;

            return Column(
              children: [
                SizedBox(height: size.maxHeight * 0.05),
                AutoSizeTextConfig().TextConfig2('${timeNow.month}월달의 목표', 1,
                    30, 15, Colors.black, 20, FontWeight.w700),
                SizedBox(height: size.maxHeight * 0.05),
                AutoSizeTextConfig().TextConfig2('이번달 평균 혈당 목표는', 1, 30, 10,
                    Colors.black, 15, FontWeight.w300),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeTextConfig().TextConfig2(
                        '공복 ', 1, 30, 10, Colors.black, 20, FontWeight.w700),
                    _diabetesEmptyStomach == null
                        ? Text('-')
                        : AutoSizeTextConfig().TextConfig2(
                            _diabetesEmptyStomach.toString(),
                            1,
                            40,
                            18,
                            Colors.deepOrange,
                            20,
                            FontWeight.bold),
                    SizedBox(width: 5),
                    AutoSizeTextConfig().TextConfig2(
                        '식전 ', 1, 30, 10, Colors.black, 20, FontWeight.w700),
                    _diabetesBeforeMeal == null
                        ? Text('-')
                        : AutoSizeTextConfig().TextConfig2(
                            _diabetesBeforeMeal.toString(),
                            1,
                            40,
                            18,
                            Colors.deepOrange,
                            20,
                            FontWeight.bold),
                    SizedBox(width: 5),
                    AutoSizeTextConfig().TextConfig2(
                        '식후 ', 1, 30, 10, Colors.black, 20, FontWeight.w700),
                    _diabetesAfterMeal == null
                        ? Text('-')
                        : AutoSizeTextConfig().TextConfig2(
                            _diabetesAfterMeal.toString(),
                            1,
                            40,
                            18,
                            Colors.deepOrange,
                            20,
                            FontWeight.bold),
                    AutoSizeTextConfig().TextConfig2(
                        ' 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeTextConfig().TextConfig2('이번달 평균 혈압 목표는 ', 1, 30,
                        10, Colors.black, 15, FontWeight.w300),
                    _bloodPressure1 == null || _bloodPressure2 == null
                        ? Text('-')
                        : AutoSizeTextConfig().TextConfig2(
                            '${_bloodPressure1.toString()} / ${_bloodPressure2.toString()}',
                            1,
                            40,
                            18,
                            Colors.deepOrange,
                            20,
                            FontWeight.bold),
                    AutoSizeTextConfig().TextConfig2(
                        ' 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeTextConfig().TextConfig2('이번달 나쁜 음식은 ', 1, 30, 10,
                        Colors.black, 15, FontWeight.w300),
                    _badFood == null
                        ? Text('-')
                        : AutoSizeTextConfig().TextConfig2(_badFood.toString(),
                            1, 40, 18, Colors.deepOrange, 20, FontWeight.bold),
                    AutoSizeTextConfig().TextConfig2(' 번만 먹을래요!', 1, 30, 10,
                        Colors.black, 15, FontWeight.w300),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeTextConfig().TextConfig2('이번달 목표 운동 횟수는 ', 1, 30,
                        10, Colors.black, 15, FontWeight.w300),
                    _health == null
                        ? Text('-')
                        : AutoSizeTextConfig().TextConfig2(_health.toString(),
                            1, 40, 18, Colors.deepOrange, 20, FontWeight.bold),
                    AutoSizeTextConfig().TextConfig2(
                        '번 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
                  ],
                )
              ],
            );
          }));
}
