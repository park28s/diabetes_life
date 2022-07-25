import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:flutter/material.dart';

// 메인에 배치 될 오늘의 운동 위젯
Widget todayHealth() {
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(children: [
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig()
          .TextConfig2('오늘의 운동', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      healthContainer(size.maxWidth * 0.25, size.maxHeight * 0.25, Colors.grey.shade700, '달리기')
    ]),
  );
}