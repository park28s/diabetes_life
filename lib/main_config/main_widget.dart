import 'package:flutter/material.dart';

Widget textEditForm(dynamic controller, dynamic keyboardType) {
  return Container(
    width: 30,
    height: 30,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        overflow: TextOverflow.clip,
        fontSize: 15
      ),
    ),
  );
}
