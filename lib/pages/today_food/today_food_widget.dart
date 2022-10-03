import 'dart:async';

import 'package:diabetes_life/main_config/main_colors.dart';
import 'package:diabetes_life/main_config/main_container_widget.dart';
import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:diabetes_life/pages/controller/today_food_controller.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

// 테이블 캘린더 위젯
Widget tableCalendar() {
  Get.put(TodayFoodController());
  TodayFoodController.to.tabOnDayFormat();
  print(DateTime.now());
  print(TodayFoodController.to.selectedDay1!);
  print('캘린더 클릭시 foodBoxKey = ${foodBox?.keys}');
  print('캘린더 클릭시 fEvents = ${fEvents}');

  return GetBuilder<TodayFoodController>(builder: (controller) {
    return coverContainer(
      mainWidthSize - 15,
      Colors.green.shade800,
      Colors.white,
      Column(
        children: [
          TableCalendar<FoodEvent>(
            calendarBuilders:
                CalendarBuilders(markerBuilder: (context, day, list) {
              if (list.length == 0) {
                return null;
              } else
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      maxRadius: 10,
                      minRadius: 7,
                      child: Text(
                        list.length.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
            }),
            eventLoader: (day) => controller.getEventsForDay(day),
            focusedDay: controller.focusedDay1,
            firstDay: firstDay,
            lastDay: lastDay,
            locale: 'ko-KR',
            formatAnimationCurve: Curves.easeInOutCirc,
            formatAnimationDuration: Duration(milliseconds: 300),
            calendarFormat: controller.calendarFormat1,
            selectedDayPredicate: (day) {
              return isSameDay(controller.selectedDay1, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(controller.selectedDay1, selectedDay)) {
                print('1');
                print('selectedDay == ${selectedDay}');
                controller.tabOnDaySelected(selectedDay, focusedDay);
                // 하단 리스트 변화 감지해서 이벤트 표시
                controller.selectedEvents3.value =
                    controller.getEventsForDay(selectedDay);
                controller.selectedDay3 = selectedDay;
                print(TodayFoodController.to.selectedEvents3.value);
              }
            },
            onFormatChanged: (format) {
              if (controller.calendarFormat1 != format) {
                print('2');
                controller.tabOnFormatChanged(format);
              }
            },
            onPageChanged: (focusedDay) {
              print('3');
              controller.focusedDay1 = focusedDay;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // MaterialButton(onPressed: () {}, child: Text('data'), color: Colors.blue),
              MaterialButton(
                  color: Colors.green.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    TodayFoodController.to.tabOnDayFormat();
                  },
                  child: AutoSizeTextConfig().TextConfig1(
                      '오늘 날짜로 바로가기', 1, Colors.white, FontWeight.w700)),
              MaterialButton(
                  color: Colors.green.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    showTimePickerPop3(Get.context);
                  },
                  child: AutoSizeTextConfig()
                      .TextConfig1('음식 등록', 1, Colors.white, FontWeight.w700)),
            ],
          ),
          SizedBox(height: 5)
        ],
      ),
    );
  });
}

// 음식등록 팝업 위젯 상단
void showTimePickerPop3(context) {
  TodayFoodController.to.badFood.value = 0;
  TodayFoodController.to.goodFood.value = 0;
  TodayFoodController.to.sosoFood.value = 0;
  Future<TimeOfDay?> selectedTime =
      showTimePicker(context: context, initialTime: TimeOfDay.now());
  selectedTime.then(
    (TimeOfDay) {
      if (TimeOfDay == null) {
        print(TimeOfDay);
        return null;
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          final saveDateTime = '${TodayFoodController.to.selectedDay1!.year}-'
              '${TodayFoodController.to.selectedDay1!.month < 10 ? '0${TodayFoodController.to.selectedDay1!.month}' : TodayFoodController.to.selectedDay1!.month}-'
              '${TodayFoodController.to.selectedDay1!.day < 10 ? '0${TodayFoodController.to.selectedDay1!.day}' : TodayFoodController.to.selectedDay1!.day} '
              '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}:'
              '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}:'
              '${'00.000'}';
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: AlertDialog(
              shape: Border.all(color: Colors.green.shade500, width: 3),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextConfig().TextConfig1(
                        '지금 음식을', 20, FontWeight.w700, Colors.green.shade900),
                    SizedBox(height: 10),
                    TextConfig().TextConfig1(
                        '등록해 볼까요?', 20, FontWeight.w700, Colors.green.shade900),
                  ]),
              content: alertDialogCreate3(
                '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}시 '
                '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}분',
              ),
              actions: [
                Center(
                  child: MaterialButton(
                    color: Colors.green.shade500,
                    child: Text('등록',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    onPressed: () async {
                      await foodBox?.put(saveDateTime.toString(), {
                        '날짜': saveDateTime,
                        '않좋은 음식': TodayFoodController.to.badFood.value,
                        '좋은 음식': TodayFoodController.to.goodFood.value,
                        '애매한 음식': TodayFoodController.to.sosoFood.value,
                      }).whenComplete(() {
                        todayFoodWhenComplete();
                      }).whenComplete(() => fEvents.addAll(eventSource3));
                      return TodayFoodController.to.selectedEventWrite();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

// 음식등록 팝업 위젯 하단
Widget alertDialogCreate3(String timeOfDay) {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        children: [
          Text(
            '${TodayFoodController.to.selectedDay1!.year}년 '
            '${TodayFoodController.to.selectedDay1!.month}월 '
            '${TodayFoodController.to.selectedDay1!.day}일',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Text(
            timeOfDay,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20),
          foodIconSet(),
          SizedBox(height: 20),
          foodSetButton(),
          SizedBox(height: 20),
          TextConfig().TextConfig1(
              '이렇게 등록 할까요?', 20, FontWeight.w700, Colors.green.shade900),
          SizedBox(height: 5),
        ],
      ),
    ),
  );
}

Widget foodIconSet() {
  return Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          foodIcon(
              () => TodayFoodController.to.selectedFoodSet(1),
              TodayFoodController.to.selectedFood!.value == 1
                  ? Colors.black
                  : Colors.white,
              Colors.red,
              '나쁜 음식',
              '${TodayFoodController.to.badFood}'),
          foodIcon(
              () => TodayFoodController.to.selectedFoodSet(2),
              TodayFoodController.to.selectedFood!.value == 2
                  ? Colors.black
                  : Colors.white,
              Colors.green,
              '좋은 음식',
              '${TodayFoodController.to.goodFood}'),
          foodIcon(
              () => TodayFoodController.to.selectedFoodSet(3),
              TodayFoodController.to.selectedFood!.value == 3
                  ? Colors.black
                  : Colors.white,
              Colors.indigo,
              '애매한 음식',
              '${TodayFoodController.to.sosoFood}')
        ],
      ));
}

Widget foodIcon(
    dynamic onTap, Color color1, Color color2, String text, dynamic text2) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: 33,
          backgroundColor: color1,
          child: CircleAvatar(
              radius: 30,
              backgroundColor: color2,
              child: AutoSizeTextConfig()
                  .TextConfig1(text, 1, Colors.white, FontWeight.w700)),
        ),
      ),
      SizedBox(height: 10),
      Text(text2, style: TextStyle(fontSize: 25))
    ],
  );
}

Widget foodSetButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => TodayFoodController.to.foodNumAdd(),
        child: Icon(Icons.add),
      ),
      SizedBox(width: 15),
      FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => TodayFoodController.to.foodNumMinus(),
        child: Center(child: Icon(Icons.remove)),
      ),
    ],
  );
}

// 음식 이벤트 등록
Future eventPut3() async {
  eventSource3.clear();
  print('eventPut3 실행시 foodBox = ${foodBox?.toMap()}');
  foodBox?.toMap().forEach(
    (boxKey, boxValue) {
      String date = boxKey.toString().substring(0, 11);
      DateTime dateTime = DateTime.parse('$date${'00:00:00.000'}');
      if (eventSource3.containsKey(dateTime)) {
        eventSource3.update(
            dateTime,
            (value) => value
              ..add(
                FoodEvent('${boxValue}'),
              ));
        print('eventSource3 = ${eventSource3}');
      } else {
        eventSource3.addAll({
          dateTime: [FoodEvent('${boxValue}')]
        });
        print('eventSource3 = ${eventSource3}');
      }
    },
  );
}

Widget selectedList3() {
  return GetBuilder<TodayFoodController>(
    builder: (controller1) {
      controller1.selectedDay3 = controller1.focusedDay1;
      final date = controller1.selectedDay3.toString().substring(0, 11);
      DateTime dateTime = DateTime.parse('$date${'00:00:00.000'}');
      controller1.selectedEvents3.value = controller1.getEventsForDay(dateTime);
      return Expanded(
        child: ValueListenableBuilder<List<FoodEvent>>(
          valueListenable: controller1.selectedEvents3,
          builder: (BuildContext, value, child) {
            //   print('foodBox Map = ${foodBox?.values.first['좋은 음식']}');
            return Container(
              width: mainWidthSize - 15,
              child: ListView.builder(
                itemCount: value.length, //box.keys.length,
                itemBuilder: (BuildContext, int index) {
                  int badResult = int.parse(
                      '${value.asMap()[index].toString().substring(37, 40).replaceAll(',', '')}');
                  int goodResult = int.parse(
                      '${value.asMap()[index].toString().substring(47, 51).replaceAll(':', '').replaceAll(',', '').replaceAll(' ', '')}');
                  int sosoResult = int.parse(
                      '${value.asMap()[index].toString().substring(59, null).replaceAll(':', '').replaceAll('}', '')}');
                  var timeResult = value
                      .asMap()[index]
                      .toString()
                      .replaceRange(0, 15, '')
                      .replaceRange(6, null, '');
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        child: coverContainer(
                          mainWidthSize > 750 ? 650 : 280,
                          Colors.green.shade900,
                          Colors.white,
                          LayoutBuilder(
                            builder: (context, size) => Padding(
                              padding: const EdgeInsets.all(7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextConfig().TextConfig2(
                                      '측정 시간 ${timeResult}',
                                      15,
                                      FontWeight.w500,
                                      Colors.black),
                                  SizedBox(width: 5),
                                  Text(
                                    '|',
                                    style:
                                        TextStyle(color: Colors.green.shade900),
                                  ),
                                  SizedBox(width: 5),
                                  foodUi(size.maxWidth * 0.25, 25),
                                  SizedBox(width: 5),
                                  foodSetResult(
                                      size.maxWidth * 0.15,
                                      25,
                                      '${badResult} 번',
                                      '${goodResult} 번',
                                      '${sosoResult} 번')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                          color: Colors.grey.shade600,
                          minWidth: 60,
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () async {
                            final kEventsKey3 = await value
                                .toList()[index]
                                .toString()
                                .substring(5, 28);

                            await foodBox?.delete(kEventsKey3);
                            fEvents.clear();
                            await eventPut3().whenComplete(
                                () => fEvents.addAll(eventSource3));
                            print('삭제 누르고 fEvents ${fEvents}');
                            print('삭제 누르고 foodBox ${foodBox?.toMap().values}');
                            controller1.selectedEventDel();
                            todayBadFoodSumMainList.clear();
                            todayGoodFoodSumMainList.clear();
                            todaySosoFoodSumMainList.clear();
                             print('SUM = ${todayBadFoodSumMainList}');
                            todayFoodMain();
                          },
                          child: TextConfig().TextConfig2(
                              '삭제', 15, FontWeight.w500, Colors.white))
                    ],
                  );
                },
              ),
            );
          },
        ),
      );
    },
  );
}

Widget foodUi(double wSize, double hSize) {
  return Column(
    children: [
      foodContainer(wSize, hSize, FoodListColors().bad, '안좋은음식'),
      SizedBox(height: 5),
      foodContainer(wSize, hSize, FoodListColors().good, '좋은음식'),
      SizedBox(height: 5),
      foodContainer(wSize, hSize, FoodListColors().soso, '애매한음식'),
    ],
  );
}

Widget foodSetResult(
    double wSize, double hSize, String text1, String text2, String text3) {
  return Column(
    children: [
      foodContainer(wSize, hSize, Colors.grey.shade500, text1),
      SizedBox(height: 5),
      foodContainer(wSize, hSize, Colors.grey.shade500, text2),
      SizedBox(height: 5),
      foodContainer(wSize, hSize, Colors.grey.shade500, text3),
    ],
  );
}
