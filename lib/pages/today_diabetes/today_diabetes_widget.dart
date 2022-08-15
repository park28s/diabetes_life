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
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

Widget pageName(String text) {
  return AutoSizeTextConfig()
      .TextConfig2(text, 1, 20, 15, Colors.blueAccent, 20, FontWeight.w700);
}

// 테이블 캘린더 위젯
Widget tableCalendar() {
  Get.put(TodayDiabetesController());
  TodayDiabetesController.to.tabOnDayFormat();
  return GetBuilder<TodayDiabetesController>(builder: (controller) {
    return coverContainer(
      mainWidthSize - 15,
      Colors.blueAccent,
      Colors.white,
      Column(
        children: [
          TableCalendar(
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
              ElevatedButton(
                  onPressed: () {
                    TodayDiabetesController.to.tabOnDayFormat();
                  },
                  child: AutoSizeTextConfig().TextConfig1(
                      '오늘 날짜로 바로가기', 1, Colors.white, FontWeight.w700)),
              ElevatedButton(
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
        return null;
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          final saveDate = '${TodayDiabetesController.to.selectedDay1!.year}-'
              '${TodayDiabetesController.to.selectedDay1!.month < 10 ? '0${TodayDiabetesController.to.selectedDay1!.month}' : TodayDiabetesController.to.selectedDay1!.month}-'
              '${TodayDiabetesController.to.selectedDay1!.day < 10 ? '0${TodayDiabetesController.to.selectedDay1!.day}' : TodayDiabetesController.to.selectedDay1!.day}';
          final saveTime =
              '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}-'
              '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}';
          final saveDateTime =
              '${TodayDiabetesController.to.selectedDay1!.year}-'
              '${TodayDiabetesController.to.selectedDay1!.month < 10 ? '0${TodayDiabetesController.to.selectedDay1!.month}' : TodayDiabetesController.to.selectedDay1!.month}-'
              '${TodayDiabetesController.to.selectedDay1!.day < 10 ? '0${TodayDiabetesController.to.selectedDay1!.day}' : TodayDiabetesController.to.selectedDay1!.day}-'
              '${TimeOfDay.hour < 10 ? '0${TimeOfDay.hour}' : TimeOfDay.hour}-'
              '${TimeOfDay.minute < 10 ? '0${TimeOfDay.minute}' : TimeOfDay.minute}';
          ;
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: AlertDialog(
              shape: Border.all(color: Colors.blueAccent, width: 3),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('지금 혈당을',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: 10),
                    Text('등록해 볼까요?',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w700))
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
                          mainBox?.put(saveDateTime, {
                            '공복': int.parse(diabetesCreateController.text)
                          }).whenComplete(
                              () => getSnackBar('완료', '등록이 완료 되었습니다!'));
                        if (TodayDiabetesController.to.selectedItem.value ==
                            '식전')
                          mainBox?.put(saveDateTime, {
                            '식전': int.parse(diabetesCreateController.text)
                          }).whenComplete(
                              () => getSnackBar('완료', '등록이 완료 되었습니다!'));
                        if (TodayDiabetesController.to.selectedItem.value ==
                            '식후')
                          mainBox?.put(saveDateTime, {
                            '식후': int.parse(diabetesCreateController.text)
                          }).whenComplete(
                              () => getSnackBar('완료', '등록이 완료 되었습니다!'));

                        return Get.back();
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
  return ValueListenableBuilder(
      valueListenable: Hive.box<Map<dynamic, dynamic>>('mainBox').listenable(),
      builder: (BuildContext, Box box, child) {
        return Container(
          width: mainWidthSize,
          height: 100,
          child: ListView.builder(
              itemCount: box.keys.length,
              itemBuilder: (BuildContext, int index) {
                final itemDate = box.keys.toList()[index];
                final itemKey = box.values.toList()[index].keys.join();
                final itemValue = box.values.toList()[index].values.join();
                return Text(
                    '${itemDate.toString().substring(0, 10)} / ${itemDate.toString().substring(11, 16)} / ${itemKey} / ${itemValue}');
              }),
        );
      });
}
// 날짜를 선택하면 a 변수에 선택 날짜+10 등록 /  box.get(a) 있으면 가져오고 없으면 널 반환
