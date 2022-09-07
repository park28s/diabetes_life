import 'package:diabetes_life/main_config/main_container_widget.dart';
import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/controller/today_bloodpressure_controller.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

Widget bloodTableCalendar() {
  Get.put(TodayBloodPressureController());
  TodayBloodPressureController.to.tabOnDayFormat();
  print(TodayBloodPressureController.to.selectedDay2!);
  print('캘린더 클릭시 BloodBoxKey = ${bloodBox?.keys}');
  print('캘린더 클릭시 kEvents2 = ${kEvents2}');

  return GetBuilder<TodayBloodPressureController>(builder: (controller) {
    return coverContainer(
      mainWidthSize - 15,
      Colors.redAccent,
      Colors.white,
      Column(
        children: [
          TableCalendar<BloodEvent>(
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
            focusedDay: controller.focusedDay2,
            firstDay: firstDay,
            lastDay: lastDay,
            locale: 'ko-KR',
            formatAnimationCurve: Curves.easeInOutCirc,
            formatAnimationDuration: Duration(milliseconds: 300),
            calendarFormat: controller.calendarFormat2,
            selectedDayPredicate: (day) {
              return isSameDay(controller.selectedDay2, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(controller.selectedDay2, selectedDay)) {
                print('1');
                print('selectedDay == ${selectedDay}');
                controller.tabOnDaySelected(selectedDay, focusedDay);
                // 하단 리스트 변화 감지해서 이벤트 표시
                controller.selectedEvents2.value =
                    controller.getEventsForDay(selectedDay);
                controller.selectedDay4 = selectedDay;
                print(TodayBloodPressureController.to.selectedEvents2.value);
              }
            },
            onFormatChanged: (format) {
              if (controller.calendarFormat2 != format) {
                print('2');
                controller.tabOnFormatChanged(format);
              }
            },
            onPageChanged: (focusedDay) {
              print('3');
              controller.focusedDay2 = focusedDay;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    TodayBloodPressureController.to.tabOnDayFormat();
                  },
                  child: AutoSizeTextConfig().TextConfig1(
                      '오늘 날짜로 바로가기', 1, Colors.white, FontWeight.w700)),
              MaterialButton(
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    showTimePickerPop2(Get.context);
                  },
                  child: AutoSizeTextConfig()
                      .TextConfig1('혈압 등록', 1, Colors.white, FontWeight.w700)),
            ],
          ),
          SizedBox(height: 5)
        ],
      ),
    );
  });
}

// 혈당등록 팝업 위젯 상단
void showTimePickerPop2(context) {
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
          final saveDateTime =
              '${TodayBloodPressureController.to.selectedDay2!.year}-'
              '${TodayBloodPressureController.to.selectedDay2!.month < 10 ? '0${TodayBloodPressureController.to.selectedDay2!.month}' : TodayBloodPressureController.to.selectedDay2!.month}-'
              '${TodayBloodPressureController.to.selectedDay2!.day < 10 ? '0${TodayBloodPressureController.to.selectedDay2!.day}' : TodayBloodPressureController.to.selectedDay2!.day} '
              '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}:'
              '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}:'
              '${'00.000'}';
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: AlertDialog(
              shape: Border.all(color: Colors.redAccent, width: 3),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextConfig().TextConfig1(
                        '지금 혈압을', 20, FontWeight.w700, Colors.redAccent),
                    SizedBox(height: 10),
                    TextConfig().TextConfig1(
                        '등록해 볼까요?', 20, FontWeight.w700, Colors.redAccent),
                  ]),
              content: alertDialogCreate(
                '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}시 '
                '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}분',
              ),
              actions: [
                Center(
                  child: MaterialButton(
                    color: Colors.pinkAccent,
                    child: Text('등록',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    onPressed: () async {
                      if (formKey3.currentState!.validate()) {
                        await bloodBox?.put(saveDateTime.toString(), {
                          '날짜': saveDateTime,
                          '수축기': int.parse(bloodCreateController1.text),
                          '이완기': int.parse(bloodCreateController2.text)
                        }).whenComplete(() {
                          todayBloodWhenComplete();
                        }).whenComplete(() => kEvents2.addAll(eventSource2));
                        return TodayBloodPressureController.to
                            .selectedEventWrite();
                      } else {
                        return getSnackBar(
                            '입력이 잘못됐어요!', '빈곳이 없는지, 숫자로 넣어주신게 맞는지 확인해 주세요');
                      }
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

// 혈당등록 팝업 위젯 하단
Widget alertDialogCreate(String timeOfDay) {
  return SingleChildScrollView(
    child: Container(
      child: Form(
        key: formKey3,
        child: Column(
          children: [
            Text(
              '${TodayBloodPressureController.to.selectedDay2!.year}년 '
              '${TodayBloodPressureController.to.selectedDay2!.month}월 '
              '${TodayBloodPressureController.to.selectedDay2!.day}일',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              timeOfDay,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            Text('- 혈압 입력 -', style: TextStyle(fontSize: 20)),
            SizedBox(width: 10),
            bloodTextFormMain(),
            SizedBox(height: 20),
            TextConfig().TextConfig1(
                '이렇게 등록 할까요?', 20, FontWeight.w700, Colors.redAccent),
            SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}

Widget bloodTextFormMain() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextConfig().TextConfig2('수축기 : ', 20, FontWeight.w500, Colors.black),
          bloodTextForm(bloodCreateController1),
        ],
      ),
      SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextConfig().TextConfig2('이완기 : ', 20, FontWeight.w500, Colors.black),
          bloodTextForm(bloodCreateController2),
        ],
      ),
    ],
  );
}

// 혈압 입력 텍스트폼 위젯
Widget bloodTextForm(dynamic controller) {
  return textEditCreateForm(controller, TextInputType.number);
}

// 혈압 이벤트 등록
Future eventPut2() async {
  eventSource2.clear();
  print('eventPut2 실행시 bloodBox = ${bloodBox?.toMap()}');
  bloodBox?.toMap().forEach(
    (boxKey, boxValue) {
      String date = boxKey.toString().substring(0, 11);
      DateTime dateTime = DateTime.parse('$date${'00:00:00.000'}');
      if (eventSource2.containsKey(dateTime)) {
        eventSource2.update(
            dateTime,
            (value) => value
              ..add(
                BloodEvent('${boxValue}'),
              ));
        print('eventSource2 = ${eventSource2}');
      } else {
        eventSource2.addAll({
          dateTime: [BloodEvent('${boxValue}')]
        });
        print('eventSource2 = ${eventSource2}');
      }
    },
  );
}

Widget selectedList2() {
  return GetBuilder<TodayBloodPressureController>(builder: (controller1) {
    controller1.selectedDay4 = controller1.focusedDay2;
    final date = controller1.selectedDay4.toString().substring(0, 11);
    DateTime dateTime = DateTime.parse('$date${'00:00:00.000'}');
    controller1.selectedEvents2.value = controller1.getEventsForDay(dateTime);
    return Expanded(
      child: ValueListenableBuilder<List<BloodEvent>>(
          valueListenable: controller1.selectedEvents2,
          builder: (BuildContext, value, child) {
            //print('bloodBox Map = ${bloodBox?.values.first['날짜']}');
            return Container(
              width: mainWidthSize - 15,
              child: ListView.builder(
                  itemCount: value.length, //box.keys.length,
                  itemBuilder: (BuildContext, int index) {
                    var result = value
                        .asMap()[index]
                        .toString()
                        .replaceRange(0, 30, '')
                        .replaceAll('}', '');
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
                              Colors.redAccent,
                              Colors.white,
                              Padding(
                                padding: const EdgeInsets.all(7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        TextConfig().TextConfig2(
                                            '${result} (mmHg)',
                                            15,
                                            FontWeight.w500,
                                            Colors.black),
                                        SizedBox(height: 8),
                                        TextConfig().TextConfig2(
                                            '측정 시간  ${timeResult}',
                                            15,
                                            FontWeight.w500,
                                            Colors.black),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        MaterialButton(
                            color: Colors.grey.shade600,
                            minWidth: 60,
                            height: 60,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () async {
                              final kEventsKey = await value
                                  .toList()[index]
                                  .toString()
                                  .substring(5, 28);

                              await bloodBox?.delete(kEventsKey);
                              kEvents2.clear();
                              await eventPut2().whenComplete(
                                  () => kEvents2.addAll(eventSource2));
                              print('삭제 누르고 kEvents2 ${kEvents2}');
                              print(
                                  '삭제 누르고 bloodBox ${bloodBox?.toMap().values}');
                              controller1.selectedEventDel();
                              todayBloodMainList[0].removeAt(index);
                              todayBloodMain();
                            },
                            child: TextConfig().TextConfig2(
                                '삭제', 15, FontWeight.w500, Colors.white))
                      ],
                    );
                  }),
            );
          }),
    );
  });
}
