import 'package:diabetes_life/main_config/main_container_widget.dart';
import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/controller/today_diabetes_controller.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// 테이블 캘린더 위젯
Widget tableCalendar() {
  Get.put(TodayDiabetesController());
  TodayDiabetesController.to.tabOnDayFormat();
  print(DateTime.now());
  print(TodayDiabetesController.to.selectedDay1!);
  print('캘린더 클릭시 mainBoxKey = ${mainBox?.keys}');
  print('캘린더 클릭시 kEvents = ${kEvents}');

  return GetBuilder<TodayDiabetesController>(builder: (controller) {
    return coverContainer(
      mainWidthSize - 15,
      Colors.blueAccent,
      Colors.white,
      Column(
        children: [
          TableCalendar<Event>(
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
                controller.selectedEvents.value =
                    controller.getEventsForDay(selectedDay);
                controller.selectedDay3 = selectedDay;
                print(TodayDiabetesController.to.selectedEvents.value);
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
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    TodayDiabetesController.to.tabOnDayFormat();
                  },
                  child: AutoSizeTextConfig().TextConfig1(
                      '오늘 날짜로 바로가기', 1, Colors.white, FontWeight.w700)),
              MaterialButton(
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    showTimePickerPop(Get.context);
                  },
                  child: AutoSizeTextConfig()
                      .TextConfig1('혈당 등록', 1, Colors.white, FontWeight.w700)),
            ],
          ),
          SizedBox(height: 5)
        ],
      ),
    );
  });
}

// 혈당등록 팝업 위젯 상단
void showTimePickerPop(context) {
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
          //  print('selectedTime == ${DateFormat('hh:mm').parse(selectedTime.toString())}');
          final saveDateTime =
              '${TodayDiabetesController.to.selectedDay1!.year}-'
              '${TodayDiabetesController.to.selectedDay1!.month < 10 ? '0${TodayDiabetesController.to.selectedDay1!.month}' : TodayDiabetesController.to.selectedDay1!.month}-'
              '${TodayDiabetesController.to.selectedDay1!.day < 10 ? '0${TodayDiabetesController.to.selectedDay1!.day}' : TodayDiabetesController.to.selectedDay1!.day} '
              '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}:'
              '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}:'
              '${'00.000'}';

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: AlertDialog(
              shape: Border.all(color: Colors.blueAccent, width: 3),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextConfig().TextConfig1(
                        '지금 혈당을', 20, FontWeight.w700, Colors.blueAccent),
                    SizedBox(height: 10),
                    TextConfig().TextConfig1(
                        '등록해 볼까요?', 20, FontWeight.w700, Colors.blueAccent),
                  ]),
              content: alertDialogCreate(
                '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}시 '
                '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}분',
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    child: Text('등록',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                    onPressed: () async {
                      if (formKey2.currentState!.validate()) {
                        if (TodayDiabetesController.to.selectedItem.value ==
                            '공복')
                          await mainBox?.put(saveDateTime.toString(), {
                            '날짜': saveDateTime,
                            '공복': int.parse(diabetesCreateController.text)
                          }).whenComplete(() {
                            todayDiabetesWhenComplete();
                          }).whenComplete(() => kEvents.addAll(eventSource));
                        if (TodayDiabetesController.to.selectedItem.value ==
                            '식전')
                          await mainBox
                              ?.put(saveDateTime.toString(), {
                                '날짜': saveDateTime,
                                '식전': int.parse(diabetesCreateController.text)
                              })
                              .then(
                                  (value) => todayDiabetesTimePut(saveDateTime))
                              .whenComplete(() {
                                todayDiabetesWhenComplete();
                              })
                              .whenComplete(() => kEvents.addAll(eventSource));
                        if (TodayDiabetesController.to.selectedItem.value ==
                            '식후')
                          await mainBox?.put(saveDateTime.toString(), {
                            '날짜': saveDateTime,
                            '식후': int.parse(diabetesCreateController.text)
                          }).whenComplete(() {
                            todayDiabetesWhenComplete();
                          }).whenComplete(() => kEvents.addAll(eventSource));

                        return TodayDiabetesController.to.selectedEventWrite();
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
        key: formKey2,
        child: Column(
          children: [
            Text(
              '${TodayDiabetesController.to.selectedDay1!.year}년 '
              '${TodayDiabetesController.to.selectedDay1!.month}월 '
              '${TodayDiabetesController.to.selectedDay1!.day}일',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              timeOfDay,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Obx(() => dropDownDiabetes()),
            SizedBox(height: 20),
            Text('- 혈당 입력 -', style: TextStyle(fontSize: 20)),
            SizedBox(width: 10),
            diabetesTextForm(),
            SizedBox(height: 20),
            TextConfig().TextConfig1(
                '이렇게 등록 할까요?', 20, FontWeight.w700, Colors.blueAccent),
            SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}

Widget dropDownDiabetes() {
  List diabetesItem = ['공복', '식전', '식후'];
  return coverContainer(
    100,
    Colors.deepPurple,
    Colors.white,
    DropdownButton(
      borderRadius: BorderRadius.circular(20),
      iconSize: 40,
      isDense: true,
      isExpanded: true,
      value: TodayDiabetesController.to.selectedItem.value,
      items: diabetesItem
          .map(
            (value) => DropdownMenuItem(
              value: value,
              child: Center(child: Text(value, style: TextStyle(fontSize: 20))),
            ),
          )
          .toList(),
      onChanged: (value) {
        TodayDiabetesController.to.selectedItem.value = value.toString();
        print(TodayDiabetesController.to.selectedItem.value);
      },
    ),
  );
}

// 혈당 입력 텍스트폼 위젯
Widget diabetesTextForm() {
  return textEditCreateForm(diabetesCreateController, TextInputType.number);
}

// 선택날짜에 저장되어 있는 리스트 불러오기
Widget selectedList() {
  return GetBuilder<TodayDiabetesController>(builder: (controller1) {
    controller1.selectedDay3 = controller1.focusedDay1;
    final date = controller1.selectedDay3.toString().substring(0, 11);
    DateTime dateTime = DateTime.parse('$date${'00:00:00.000'}');
    controller1.selectedEvents.value = controller1.getEventsForDay(dateTime);
    return Expanded(
      child: ValueListenableBuilder<List<Event>>(
          valueListenable: controller1.selectedEvents,
          builder: (BuildContext, value, child) {
            return LayoutBuilder(
              builder: (context, boxSize) {
                return Container(
                  width: mainWidthSize - 15,
                  child: ListView.builder(
                      itemCount: value.length, //box.keys.length,
                      itemBuilder: (BuildContext, int index) {
                        var result = value
                            .asMap()[index]
                            .toString()
                            .replaceRange(0, 34, '')
                            .replaceAll('}', '');
                        var nameResult = value
                            .asMap()[index]
                            .toString()
                            .replaceRange(0, 30, '')
                            .replaceRange(2, null, '');
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
                                boxSize.maxWidth * 0.7,
                                      Colors.blueAccent,
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
                                                    '${result} mg/dL',
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
                                            TextConfig().TextConfig2('|', 20,
                                                FontWeight.w500, Colors.redAccent),
                                            TextConfig().TextConfig2(
                                                '${nameResult}',
                                                20,
                                                FontWeight.w500,
                                                Colors.black),
                                          ],
                                        ),
                                      )),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: MaterialButton(
                                      color: Colors.grey.shade600,
                                      height: 60,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      onPressed: () async {
                                        final kEventsKey = await value
                                            .toList()[index]
                                            .toString()
                                            .substring(5, 28);
                                        print('삭제 누르고 kEventsKey ${kEventsKey}');
                                        await mainBox?.delete(kEventsKey);
                                        kEvents.clear();
                                        await eventPut().whenComplete(
                                            () => kEvents.addAll(eventSource));
                                        print('삭제 누르고 kEvents ${kEvents}');
                                        print('삭제 누르고 mainBox ${mainBox?.toMap()}');
                                        print('삭제 누르고 mainBox ${mainBox?.toMap()}');
                                        controller1.selectedEventDel();
                                        todayDiabetesMainList[0].removeAt(index);
                                        todayDiabetesMain();
                                      },
                                      child: TextConfig().TextConfig2(
                                          '삭제', 15, FontWeight.w500, Colors.white)),
                            )
                          ],
                        );
                      }),
                );
              }
            );
          }),
    );
  });
}

Future eventPut() async {
  eventSource.clear();
  print('eventPut 실행시 mainBox = ${mainBox?.toMap()}');
  mainBox?.toMap().forEach(
    (boxKey, boxValue) {
      String date = boxKey.toString().substring(0, 11);
      DateTime dateTime = DateTime.parse('$date${'00:00:00.000'}');
      if (eventSource.containsKey(dateTime)) {
        print('eventSource${eventSource}');
        eventSource.update(
            dateTime,
            (value) => value
              ..add(
                Event('${boxValue}'),
              ));
      } else {
        print('eventSource${eventSource}');
        eventSource.addAll({
          dateTime: [Event('${boxValue}')]
        });
      }
    },
  );
}
