import 'package:diabetes_life/main_config/text_config.dart';
import 'package:flutter/material.dart';

// 메인에 배치 될 목표 위젯
Widget goalMain() {
  return LayoutBuilder(
      builder: (BuildContext context, size) => Column(
        children: [
          SizedBox(height: size.maxHeight * 0.05),
          AutoSizeTextConfig().TextConfig2(
              '이번달 목표', 1, 30, 15, Colors.black, 20, FontWeight.w700),
          SizedBox(height: size.maxHeight * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeTextConfig().TextConfig2('이번달 평균 혈당 목표는 ', 1, 30, 10,
                  Colors.black, 15, FontWeight.w300),
              AutoSizeTextConfig().TextConfig2(
                  '120', 1, 40, 18, Colors.deepOrange, 20, FontWeight.bold),
              AutoSizeTextConfig().TextConfig2(
                  ' 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeTextConfig().TextConfig2('이번달 평균 혈압 목표는 ', 1, 30, 10,
                  Colors.black, 15, FontWeight.w300),
              AutoSizeTextConfig().TextConfig2('120 / 80', 1, 40, 18,
                  Colors.deepOrange, 20, FontWeight.bold),
              AutoSizeTextConfig().TextConfig2(
                  ' 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeTextConfig().TextConfig2('이번달 나쁜 음식은 ', 1, 30, 10,
                  Colors.black, 15, FontWeight.w300),
              AutoSizeTextConfig().TextConfig2(
                  '1', 1, 40, 18, Colors.deepOrange, 20, FontWeight.bold),
              AutoSizeTextConfig().TextConfig2(' 번만 먹을래요!', 1, 30, 10,
                  Colors.black, 15, FontWeight.w300),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeTextConfig().TextConfig2('이번달 목표 운동 횟수는 ', 1, 30, 10,
                  Colors.black, 15, FontWeight.w300),
              AutoSizeTextConfig().TextConfig2(
                  '10', 1, 40, 18, Colors.deepOrange, 20, FontWeight.bold),
              AutoSizeTextConfig().TextConfig2(
                  '번 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
            ],
          )
        ],
      ));
}