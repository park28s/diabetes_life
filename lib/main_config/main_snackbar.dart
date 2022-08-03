import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void getSnackBar(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.deepPurple,
      colorText: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      duration: Duration(seconds: 1));
}
