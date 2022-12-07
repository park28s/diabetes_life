import 'package:diabetes_life/main_config/main_colors.dart';
import 'package:diabetes_life/main_config/main_container_widget.dart';
import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:diabetes_life/pages/controller/today_health_controller.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:diabetes_life/pages/today_health/health_management_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

Widget healthTableCalendar() {
  Get.put(TodayHealthController());
  TodayHealthController.to.tabOnDayFormat();
  print(TodayHealthController.to.selectedDay3!);

  return GetBuilder<TodayHealthController>(builder: (controller) {
    return coverContainer(
      mainWidthSize - 15,
      Colors.deepPurpleAccent,
      Colors.white,
      Column(
        children: [
          TableCalendar<HealthEvent>(
            calendarBuilders:
                CalendarBuilders(markerBuilder: (context, day, list) {
              if (list.length == 0) {
                return null;
              } else
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
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
            focusedDay: controller.focusedDay3,
            firstDay: firstDay,
            lastDay: lastDay,
            locale: 'ko-KR',
            formatAnimationCurve: Curves.easeInOutCirc,
            formatAnimationDuration: Duration(milliseconds: 300),
            calendarFormat: controller.calendarFormat3,
            selectedDayPredicate: (day) {
              return isSameDay(controller.selectedDay3, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(controller.selectedDay3, selectedDay)) {
                print('1');
                print('selectedDay == ${selectedDay}');
                controller.tabOnDaySelected(selectedDay, focusedDay);
                // 하단 리스트 변화 감지해서 이벤트 표시
                controller.selectedEvents4.value =
                    controller.getEventsForDay(selectedDay);
                controller.selectedDay5 = selectedDay;
                print(TodayHealthController.to.selectedEvents4.value);
                TodayHealthController.to.health.clear();
                TodayHealthController.to.healthColor.clear();
                TodayHealthController.to.dayHealthUpdate();
              }
            },
            onFormatChanged: (format) {
              if (controller.calendarFormat3 != format) {
                print('2');
                controller.tabOnFormatChanged(format);
              }
            },
            onPageChanged: (focusedDay) {
              print('3');
              controller.focusedDay3 = focusedDay;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    TodayHealthController.to.tabOnDayFormat();
                  },
                  child: AutoSizeTextConfig().TextConfig1(
                      '오늘 날짜로 바로가기', 1, Colors.white, FontWeight.w700)),
              MaterialButton(
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    TodayHealthController.to.healthSelect2.clear();
                    TodayHealthController.to.healthSelect3.clear();
                    showTimePickerPop4(Get.context);
                  },
                  child: AutoSizeTextConfig()
                      .TextConfig1('운동 등록', 1, Colors.white, FontWeight.w700)),
            ],
          ),
          SizedBox(height: 5)
        ],
      ),
    );
  });
}

Widget healthListButton() {
  return MaterialButton(
      color: Colors.deepPurpleAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: () {
        // healthEventBox?.clear();
        textFormClear();
        Get.to(() => HealthManagement());
      },
      child: AutoSizeTextConfig()
          .TextConfig1('운동 관리', 1, Colors.white, FontWeight.w700));
}

void showTimePickerPop4(context) {
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
          final saveDateTime = '${TodayHealthController.to.selectedDay3!.year}-'
              '${TodayHealthController.to.selectedDay3!.month < 10 ? '0${TodayHealthController.to.selectedDay3!.month}' : TodayHealthController.to.selectedDay3!.month}-'
              '${TodayHealthController.to.selectedDay3!.day < 10 ? '0${TodayHealthController.to.selectedDay3!.day}' : TodayHealthController.to.selectedDay3!.day} '
              '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}:'
              '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}:'
              '${'00.000'}';
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: AlertDialog(
              shape: Border.all(color: Colors.deepPurpleAccent, width: 3),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextConfig().TextConfig1(
                        '지금 운동을', 20, FontWeight.w700, Colors.deepPurpleAccent),
                    SizedBox(height: 10),
                    TextConfig().TextConfig1('등록해 볼까요?', 20, FontWeight.w700,
                        Colors.deepPurpleAccent),
                  ]),
              content: alertDialogCreate3(
                '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}시 '
                '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}분',
              ),
              actions: [
                Center(
                  child: Hive.box<dynamic>('healthListBox').isEmpty
                      ? MaterialButton(
                          color: Colors.deepPurpleAccent,
                          child: Text('취소',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          onPressed: () => Get.back())
                      : MaterialButton(
                          color: Colors.deepPurpleAccent,
                          child: Text('등록',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          onPressed: () async {
                            print(
                                '등록누를때 운동 = ${TodayHealthController.to.healthSelect2}');
                            print(
                                '등록누를때 색상 = ${TodayHealthController.to.healthSelect3}');
                            print('등록누를때 시간 = ${saveDateTime}');

                            await healthEventBox
                                ?.put(saveDateTime.toString(), {
                                  '날짜': saveDateTime,
                                  '운동': TodayHealthController.to.healthSelect2
                                      .toList(),
                                  '색상': TodayHealthController.to.healthSelect3
                                      .toList()
                                })
                                .whenComplete(() => todayHealthWhenComplete())
                                .whenComplete(
                                    () => hEvents.addAll(eventSource4))
                                .whenComplete(() =>
                                    TodayHealthController.to.health.clear())
                                .whenComplete(() => TodayHealthController
                                    .to.healthColor
                                    .clear());

                            print('등록하고 운동 --- ${healthEventBox?.values}');
                            TodayHealthController.to.dayHealthUpdate();
                            TodayHealthController.to.voidTodayHealthMainItem();

                            print('등록하고 이벤트박스맵 = ${healthEventBox?.toMap()}');
                            return TodayHealthController.to
                                .selectedEventWrite();
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

// 운동등록 팝업 위젯 하단
Widget alertDialogCreate3(String timeOfDay) {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        children: [
          Text(
            '${TodayHealthController.to.selectedDay3!.year}년 '
            '${TodayHealthController.to.selectedDay3!.month}월 '
            '${TodayHealthController.to.selectedDay3!.day}일',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Text(
            timeOfDay,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20),
          healthListContainer2(),
          SizedBox(height: 20),
          Hive.box<dynamic>('healthListBox').isEmpty
              ? Text('')
              : TextConfig().TextConfig1(
                  '이렇게 등록 할까요?', 20, FontWeight.w700, Colors.deepPurpleAccent),
          SizedBox(height: 5),
        ],
      ),
    ),
  );
}

Widget healthListContainer2() {
  return ValueListenableBuilder(
    valueListenable: Hive.box<dynamic>('healthListBox').listenable(),
    builder: (BuildContext context, dynamic value, Widget? child) {
      final _name = value.toMap().keys;
      List<Color> colorList = [];
      void _colorCheck() {
        for (int a = 0; a < value.length; a++)
          if (value.values.elementAt(a) == 'pinkAccent')
            colorList.add(HealthListColors().pinkAccent);
          else if (value.values.elementAt(a) == 'blueGrey')
            colorList.add(HealthListColors().blueGrey);
          else if (value.values.elementAt(a) == 'orange')
            colorList.add(HealthListColors().orange);
          else if (value.values.elementAt(a) == 'blueAccent')
            colorList.add(HealthListColors().blueAccent);
          else if (value.values.elementAt(a) == 'brown')
            colorList.add(HealthListColors().brown);
          else if (value.values.elementAt(a) == 'indigoAccent')
            colorList.add(HealthListColors().indigoAccent);
          else if (value.values.elementAt(a) == 'red')
            colorList.add(HealthListColors().red);
          else if (value.values.elementAt(a) == 'amber')
            colorList.add(HealthListColors().amber);
          else if (value.values.elementAt(a) == 'deepPurple')
            colorList.add(HealthListColors().deepPurple);
          else if (value.values.elementAt(a) == 'black')
            colorList.add(HealthListColors().black);
      }

      void _healthSelect(String listName, int index) {
        // Get.put(TodayHealthController());
        void _remove() {
          TodayHealthController.to.healthSelect2.remove(listName);
          TodayHealthController.to.healthSelect3.remove(colorList[index].value);
          print(
              'remove healthListBox = ${healthListBox?.values.elementAt(index)}');
        }

        void _add() {
          TodayHealthController.to.healthSelect2.add(listName);
          TodayHealthController.to.healthSelect3.add(colorList[index].value);
          print(
              'add healthListBox = ${healthListBox?.values.elementAt(index)}');
        }

        TodayHealthController.to.healthSelect2.contains(listName)
            ? _remove()
            : _add();
        print('healthSelect2 = ${TodayHealthController.to.healthSelect2}');
        print('healthSelect3 = ${TodayHealthController.to.healthSelect3}');
      }

      Widget _noColors() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextConfig().TextConfig1(
                  '등록된 운동이', 30, FontWeight.w400, Colors.redAccent),
              TextConfig()
                  .TextConfig1('없어요!', 30, FontWeight.w400, Colors.redAccent)
            ],
          ),
        );
      }

      return Container(
        width: mainWidthSize - 10,
        height: mainHeightSize / 3.5,
        child: Hive.box<dynamic>('healthListBox').isEmpty
            ? _noColors()
            : GridView.builder(
                itemCount: value.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5),
                itemBuilder: (BuildContext context, int index) {
                  _colorCheck();
                  print('colorList = ${colorList.length}');
                  return InkWell(
                      onTap: () {
                        _healthSelect(_name.elementAt(index), index);
                      },
                      child: containerStack(Color(colorList[index].value),
                          _name.elementAt(index)));
                },
              ),
      );
    },
  );
}

Widget containerStack(Color color, String text) {
  //Get.put(TodayHealthController());
  return Container(
    child: LayoutBuilder(
      builder: (BuildContext context, size) => Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => Container(
              width: size.maxWidth,
              height: size.maxHeight,
              decoration: BoxDecoration(
                  color: TodayHealthController.to.healthSelect2.contains(text)
                      ? Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          healthContainer(size.maxWidth - 5, size.maxHeight - 5, color, text)
        ],
      ),
    ),
  );
}

Future eventPut4() async {
  eventSource4.clear();
  print('eventPut4 실행시 healthEventBox = ${healthEventBox?.toMap()}');
  healthEventBox?.toMap().forEach(
    (boxKey, boxValue) {
      String date = boxKey.toString().substring(0, 11);
      DateTime dateTime = DateTime.parse('$date${'00:00:00.000'}');
      if (eventSource4.containsKey(dateTime)) {
        eventSource4.update(
            dateTime,
            (value) => value
              ..add(
                HealthEvent('${boxValue}'),
              ));
        print('eventSource4 = ${eventSource4}');
      } else {
        eventSource4.addAll({
          dateTime: [HealthEvent('${boxValue}')]
        });
        print('eventSource4 = ${eventSource4}');
      }
    },
  );
}

Widget selectedList4() {
  return GetBuilder<TodayHealthController>(
    builder: (controller1) {
      controller1.selectedDay3 = controller1.focusedDay3;
      final date = controller1.selectedDay3.toString().substring(0, 11);
      DateTime dateTime = DateTime.parse('$date${'00:00:00.000'}');
      controller1.selectedEvents4.value = controller1.getEventsForDay(dateTime);
      return Expanded(
        child: ValueListenableBuilder<List<HealthEvent>>(
          valueListenable: controller1.selectedEvents4,
          builder: (BuildContext, value, child) {
            print('<------------------');
            print('healthBox Map = ${healthListBox?.toMap()}');
            print('healEventBox Map = ${healthEventBox?.values}');
            print('value Test = ${value}');
            print('------------------>');
            return Container(
              width: mainWidthSize - 15,
              child: ListView.builder(
                itemCount: value.length, //box.keys.length,
                itemBuilder: (BuildContext, int index) {
                  int aa = TodayHealthController.to.health[index].length;
                  var _timeResult = value
                      .asMap()[index]
                      .toString()
                      .replaceRange(0, 15, '')
                      .replaceRange(6, null, '');

                  print('_timeResult ${_timeResult}');
                  // print('이벤트박스벨류 ${healthEventBox?.values}');

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        child: coverContainer(
                          mainWidthSize > 750 ? 650 : 280,
                          Colors.deepPurpleAccent,
                          Colors.white,
                          LayoutBuilder(
                            builder: (context, size) => Padding(
                              padding: const EdgeInsets.all(7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextConfig().TextConfig2(
                                      '측정 시간 ${_timeResult}',
                                      15,
                                      FontWeight.w500,
                                      Colors.black),
                                  SizedBox(width: 5),
                                  Text(
                                    '|',
                                    style: TextStyle(
                                        color: Colors.deepPurpleAccent),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Container(
                                      child: GridView.count(
                                        crossAxisCount: 2,
                                        childAspectRatio: 3,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 3,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        children: List.generate(aa, (index1) {
                                          return healthContainer(
                                              80,
                                              30,
                                              Color(int.parse(
                                                  TodayHealthController
                                                      .to
                                                      .healthColor[index]
                                                          [index1]
                                                      .toString())),
                                              //Colors.brown,
                                              TodayHealthController
                                                  .to.health[index][index1]);
                                        }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                          color: Colors.grey.shade600,
                          minWidth: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () async {
                            TodayHealthController.to.health.clear();
                            TodayHealthController.to.healthColor.clear();

                            final kEventsKey4 = await value
                                .toList()[index]
                                .toString()
                                .substring(5, 28);

                            await healthEventBox?.delete(kEventsKey4);
                            hEvents.clear();
                            await eventPut4().whenComplete(
                                () => hEvents.addAll(eventSource4));
                            print('삭제 누르고 hEvents ${hEvents}');
                            print(
                                '삭제 누르고 healthBox ${healthEventBox?.toMap().values}');
                            TodayHealthController.to.dayHealthUpdate();
                            TodayHealthController.to.voidTodayHealthMainItem();
                            controller1.selectedEventDel();
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
