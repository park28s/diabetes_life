import 'package:diabetes_life/main_config/text_config.dart';
import 'package:flutter/material.dart';

// 메인에 배치 될 예상 당화혈색소 위젯
Widget todayDangHwa() {
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(children: [
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig().TextConfig2(
          '예상 당화혈색소', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig().TextConfig2(
          '6.7', 1, 40, 15, Colors.deepPurpleAccent, 35, FontWeight.w700),
    ]),
  );
}