import 'package:diabetes_life/main.dart';
import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PagesController extends GetxController{
  static PagesController get to => Get.find();

  int? diaTest;

  final checkModel1 =
  Hive.box<CheckModel>('check').get('${timeNow.year}-${timeNow.month}')?.diabetesEmptyStomach;

  void checkTest() {
    diaTest = checkModel1;
    update();
    print('diaTest == ${checkModel1}');
  }

}