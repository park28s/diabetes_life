import 'package:auto_size_text/auto_size_text.dart';
import 'package:diabetes_life/main_home/main_controller.dart';
import 'package:flutter/material.dart';

class TextConfig {
  TextConfig1(String text, double size, dynamic weight, dynamic color) {
    return Text(text,
        style: TextStyle(
            fontSize: size,
            fontWeight: weight,
            color: color,
            fontFamily: 'MaruBuri'));
  }
}

class AutoSizeTextConfig {
  TextConfig1(String text, int maxLines, dynamic color, dynamic weight) {
    return AutoSizeText(text,
        maxLines: maxLines,
        group: CustomNaviBarController.to.autoSizeGroup,
        style: TextStyle(
            color: color, fontWeight: weight, fontFamily: ''));
  }
}
