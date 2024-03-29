import 'package:flutter/material.dart';

// 헥사컬러로 변환
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

// 음식 종류별 색상
class FoodListColors {
  Color good = Colors.green;
  Color bad = Colors.redAccent;
  Color soso = Colors.purpleAccent;
}

// 운동 리스트 색상
class HealthListColors {
  Color black = Colors.black;
  Color deepPurple = Colors.deepPurple;
  Color amber = Colors.amber;
  Color red = Colors.red;
  Color blueAccent = Colors.blueAccent;
  Color brown = Colors.brown;
  Color indigoAccent = Colors.indigoAccent;
  Color orange = Colors.orange;
  Color blueGrey = Colors.blueGrey;
  Color pinkAccent = Colors.pinkAccent;
}