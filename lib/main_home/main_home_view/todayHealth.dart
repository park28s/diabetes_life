import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:diabetes_life/pages/controller/today_health_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 메인에 배치 될 오늘의 운동 위젯
Widget todayHealth() {
  Get.lazyPut(() => TodayHealthController());
  TodayHealthController.to.health.clear();
  TodayHealthController.to.healthColor.clear();
  TodayHealthController.to.dayHealthUpdate();

  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(
      children: [
        textView(
            size.maxWidth - 10, '오늘의 운동', 20.0, Colors.black, FontWeight.w700),
        Obx(() => todayHealthMainItem()),
      SizedBox(height: size.maxHeight * 0.1)
      ],
    ),
  );
}

Widget todayHealthMainItem() {
  TodayHealthController.to.voidTodayHealthMainItem();

  return Expanded(
    child: LayoutBuilder(
      builder: (context, size) {
        int itemLength = TodayHealthController.to.mainPageHealthItem.length;
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
              itemLength,
              (index2) {
                return TodayHealthController.to.health.length == 0
                    ? Text('')
                    : healthContainer(
                        80,
                        30,
                        Color(int.parse(TodayHealthController
                            .to.mainPageHealthItemColors[index2]
                            .toString())),
                        TodayHealthController.to.mainPageHealthItem[index2]);
              },
            ),
          ),
        );
      },
    ),
  );
}
