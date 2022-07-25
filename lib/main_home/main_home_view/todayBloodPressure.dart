import 'package:diabetes_life/main_config/text_config.dart';
import 'package:flutter/material.dart';

// 메인에 배치 될 오늘의 혈압 위젯
Widget todayBloodPressure() {
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(children: [
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig()
          .TextConfig2('오늘의 혈압', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig().TextConfig2(
          '(마지막 측정 기준)', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              AutoSizeTextConfig().TextConfig2('수축기', 1, 25, 10, Colors.black, 25, FontWeight.w200),
              SizedBox(width: size.maxWidth * 0.02),
              AutoSizeTextConfig().TextConfig2('120', 1, 35, 10, Colors.deepOrangeAccent, 35, FontWeight.bold),
            ],
          ),
          Row(
            children: [
              AutoSizeTextConfig().TextConfig2('이완기', 1, 25, 10, Colors.black, 25, FontWeight.w200),
              SizedBox(width: size.maxWidth * 0.02),
              AutoSizeTextConfig().TextConfig2('80', 1, 35, 10, Colors.deepOrangeAccent, 35, FontWeight.bold),
            ],
          ),
        ],
      )
    ]),
  );
}