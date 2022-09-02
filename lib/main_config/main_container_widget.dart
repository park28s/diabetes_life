import 'package:flutter/material.dart';

// 그냥 데코레이션 적용된 컨테이너
Widget coverContainer(
    double width, dynamic color1, dynamic color2, dynamic child) {
  return Container(
    width: width,
    //height: height,
    decoration: BoxDecoration(
        border: Border.all(color: color1),
        boxShadow: [BoxShadow(color: Colors.black)],
        borderRadius: BorderRadius.circular(10),
        color: color2),
    child: child,
  );
}

// coverContainer 에서 inkWell 적용
Widget clickContainer(
    double width, dynamic color1, dynamic color2, dynamic child, dynamic onTap) {
  return InkWell(
    child: Container(
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: color1),
          boxShadow: [BoxShadow(color: Colors.black)],
          borderRadius: BorderRadius.circular(10),
          color: color2),
      child: child,
    ),
    onTap: onTap
  );
}