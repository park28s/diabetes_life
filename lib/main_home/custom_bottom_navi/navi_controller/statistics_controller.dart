import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  static StatisticsController get to => Get.find(); // find 명령을 안쓰고 .to로 사용이 가능

  RxBool isStateDiabetesMonth = true.obs;
  RxBool isStateDiabetesMonthAgo = false.obs;
  RxBool isStateDiabetes3Month = false.obs;

  RxBool isStateBloodMonth = true.obs;
  RxBool isStateBloodMonthAgo = false.obs;
  RxBool isStateBlood3Month = false.obs;

  RxBool isStateFoodMonth = true.obs;
  RxBool isStateFoodMonthAgo = false.obs;
  RxBool isStateFood3Month = false.obs;

  RxBool isStateHealthMonth = true.obs;
  RxBool isStateHealthMonthAgo = false.obs;
  RxBool isStateHealth3Month = false.obs;

  void stateDiabetesMonth() {
    isStateDiabetesMonth.value = true;
    isStateDiabetesMonthAgo.value = false;
    isStateDiabetes3Month.value = false;

    print(
        '${isStateDiabetesMonth.value} / ${isStateDiabetesMonthAgo.value} / ${isStateDiabetes3Month.value}');
  }

  void stateDiabetesMonthAge() {
    isStateDiabetesMonthAgo.value = true;
    isStateDiabetesMonth.value = false;
    isStateDiabetes3Month.value = false;

    print(
        '${isStateDiabetesMonth.value} / ${isStateDiabetesMonthAgo.value} / ${isStateDiabetes3Month.value}');
  }

  void stateDiabetes3Month() {
    isStateDiabetes3Month.value = true;
    isStateDiabetesMonth.value = false;
    isStateDiabetesMonthAgo.value = false;

    print(
        '${isStateDiabetesMonth.value} / ${isStateDiabetesMonthAgo.value} / ${isStateDiabetes3Month.value}');
  }

  void stateBloodMonth() {
    isStateBloodMonth.value = true;
    isStateBloodMonthAgo.value = false;
    isStateBlood3Month.value = false;

    print(
        '${isStateBloodMonth.value} / ${isStateBloodMonthAgo.value} / ${isStateBlood3Month.value}');
  }

  void stateBloodMonthAge() {
    isStateBloodMonthAgo.value = true;
    isStateBloodMonth.value = false;
    isStateBlood3Month.value = false;

    print(
        '${isStateBloodMonth.value} / ${isStateBloodMonthAgo.value} / ${isStateBlood3Month.value}');
  }

  void stateBlood3Month() {
    isStateBlood3Month.value = true;
    isStateBloodMonth.value = false;
    isStateBloodMonthAgo.value = false;

    print(
        '${isStateBloodMonth.value} / ${isStateBloodMonthAgo.value} / ${isStateBlood3Month.value}');
  }

  void stateFoodMonth() {
    isStateFoodMonth.value = true;
    isStateFoodMonthAgo.value = false;
    isStateFood3Month.value = false;

    print(
        '${isStateFoodMonth.value} / ${isStateFoodMonthAgo.value} / ${isStateFood3Month.value}');
  }

  void stateFoodMonthAge() {
    isStateFoodMonthAgo.value = true;
    isStateFoodMonth.value = false;
    isStateFood3Month.value = false;

    print(
        '${isStateFoodMonth.value} / ${isStateFoodMonthAgo.value} / ${isStateFood3Month.value}');
  }

  void stateFood3Month() {
    isStateFood3Month.value = true;
    isStateFoodMonth.value = false;
    isStateFoodMonthAgo.value = false;

    print(
        '${isStateFoodMonth.value} / ${isStateFoodMonthAgo.value} / ${isStateFood3Month.value}');
  }

  void stateHealthMonth() {
    isStateHealthMonth.value = true;
    isStateHealthMonthAgo.value = false;
    isStateHealthMonth.value = false;

    print(
        '${isStateHealthMonth.value} / ${isStateHealthMonthAgo.value} / ${isStateHealth3Month.value}');
  }

  void stateHealthMonthAge() {
    isStateHealthMonthAgo.value = true;
    isStateHealthMonth.value = false;
    isStateHealthMonth.value = false;

    print(
        '${isStateHealthMonth.value} / ${isStateHealthMonthAgo.value} / ${isStateHealth3Month.value}');
  }

  void stateHealth3Month() {
    isStateHealth3Month.value = true;
    isStateHealthMonth.value = false;
    isStateHealthMonthAgo.value = false;

    print(
        '${isStateHealthMonth.value} / ${isStateHealthMonthAgo.value} / ${isStateHealth3Month.value}');
  }
}

