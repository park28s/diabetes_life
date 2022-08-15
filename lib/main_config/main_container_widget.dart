import 'package:flutter/material.dart';

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
