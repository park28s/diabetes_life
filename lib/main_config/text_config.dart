import 'package:flutter/material.dart';

class TextConfig {
   TextConfig1(String text, double size, dynamic weight, dynamic color) {
  return Text(text, style: TextStyle(fontSize: size, fontWeight: weight, color: color));
  }
}