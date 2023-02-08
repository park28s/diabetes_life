import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_controller/setup_controller.dart';
import 'package:flutter/material.dart';

//title: 공복 알람 설정
Widget hiddenTimePut1() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<int>(
              value: SetupPageController.to.selectIndex1.value == 25
                  ? null
                  : SetupPageController.to.selectIndex1.value,
              items: [
                for (int index = 0; index <= 24; index++)
                  DropdownMenuItem(
                      child: Text('${index}',
                          style: TextStyle(color: Colors.black)),
                      value: index),
              ],
              style: TextStyle(fontSize: 20),
              hint: Text('시간'),
              onChanged: (value) {
                SetupPageController.to.selectIndex1.value = value!.toInt();
                Checked1HourBox?.put('hour', value);
                print(Checked1HourBox?.values.first);
                LocalNotification().showNotification2();
              }),
          SizedBox(width: 10),
          TextConfig().TextConfig1('시 :', 20, FontWeight.w500, Colors.black),
          SizedBox(width: 10),
          Row(
            children: [
              DropdownButton<int>(
                  value: SetupPageController.to.selectIndex2.value == 60
                      ? null
                      : SetupPageController.to.selectIndex2.value,
                  items: [
                    for (int index = 0; index <= 59; index++)
                      DropdownMenuItem(
                          child: Text('${index}',
                              style: TextStyle(color: Colors.black)),
                          value: index),
                  ],
                  style: TextStyle(fontSize: 20),
                  hint: Text('분'),
                  onChanged: (value) {
                    SetupPageController.to.selectIndex2.value = value!.toInt();
                    Checked1MinBox?.put('min', value);
                    print(Checked1MinBox?.values.first);
                    LocalNotification().showNotification2();
                  }),
              SizedBox(height: 10),
              TextConfig().TextConfig1('분', 20, FontWeight.w500, Colors.black),
            ],
          ),
        ],
      ),
      SizedBox(width: 10),
      TextConfig()
          .TextConfig1('에 알려 드릴게요 :)', 20, FontWeight.w500, Colors.black)
    ],
  );
}

//title: 식전 체크 후 알람 설정
Widget hiddenTimePut2() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextConfig()
              .TextConfig1('식전 체크 후', 20, FontWeight.w500, Colors.black),
          SizedBox(width: 10),
          DropdownButton<int>(
              value: SetupPageController.to.selectIndex3.value == 0
                  ? null
                  : SetupPageController.to.selectIndex3.value,
              items: [
                for (int index = 0; index <= 5; index++)
                  DropdownMenuItem(
                      child: Text('${index}',
                          style: TextStyle(color: Colors.black)),
                      value: index),
              ],
              style: TextStyle(fontSize: 20),
              hint: Text('시간'),
              onChanged: (value) {
                SetupPageController.to.selectIndex3.value = value!.toInt();
                Checked2HourBox?.put('hour', value);
                print(Checked2HourBox?.values.first);
                LocalNotification().showNotification2();
              }),
        ],
      ),
      SizedBox(height: 10),
      TextConfig()
          .TextConfig1('시간 후에 알려 드릴게요 :)', 20, FontWeight.w500, Colors.black),
    ],
  );
}
