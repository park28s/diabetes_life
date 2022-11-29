import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:diabetes_life/pages/controller/today_health_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List? mainPageHealthItem;

// 메인에 배치 될 오늘의 운동 위젯
Widget todayHealth() {
  Get.lazyPut(() => TodayHealthController());
  TodayHealthController.to.health.clear();
  TodayHealthController.to.healthColor.clear();
  TodayHealthController.to.dayHealthUpdate();

  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(
      children: [
        SizedBox(height: size.maxHeight * 0.05),
        AutoSizeTextConfig().TextConfig2(
            '오늘의 운동', 1, 30, 13, Colors.black, 10, FontWeight.w700),
        SizedBox(height: size.maxHeight * 0.05),
        //healthContainer(size.maxWidth * 0.25, size.maxHeight * 0.25, Colors.grey.shade700, '달리기')
        todayHealthMainItem()
      ],
    ),
  );
}

Widget todayHealthMainItem() {
  int dayHealthLength = TodayHealthController.to.health.length;
  List.generate(
    dayHealthLength,
    (index) {
      int timeHealthLength = TodayHealthController.to.health[index].length;
      print('timeHealthLength ${timeHealthLength}');
      List.generate(
        timeHealthLength,
        (index1) {
          var healthTest = TodayHealthController.to.health[index][index1];
          mainPageHealthItem?.addAll({healthTest.toString()}); // 우째 안들어ㄱ가냐????
          print('healthTest ${healthTest}');
          print('mainPageHealthItem ${mainPageHealthItem}');
        },
      );
    },
  );

  return Expanded(
    child: LayoutBuilder(builder: (context, size) {
      return Container(
        width: size.maxWidth - 10,
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 3,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: List.generate(
            1,
            (index1) {
              return healthContainer(
                  80,
                  30,
                  /*Color(int.parse(TodayHealthController.to.healthColor[0]
                        .toString())),*/
                  Colors.brown,
                  TodayHealthController.to.health[0][0]);
            },
          ),
        ),
      );
    }),
  );
}

void healthIndexGet() {
  int dayHealthIndex = TodayHealthController.to.health.length;
  List.generate(dayHealthIndex, (dayHealthIndex) => dayHealthIndex);
}
