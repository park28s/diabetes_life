import 'package:diabetes_life/main_config/main_container_widget.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_controller/statistics_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 평균 혈당 선택 및 차트 보기 위젯
Widget diabetesDaySetting() {
  Get.lazyPut(() => StatisticsController());

  Widget buttonSetting(dynamic isItem, String text, var onPressed) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            isItem ? null : MaterialStateProperty.all(Colors.white),
      ),
      child: TextConfig().TextConfig2(text, 15, FontWeight.w500,
          isItem ? Colors.white : Colors.indigoAccent),
      onPressed: onPressed,
    );
  }

  Widget graphIcon() {
    return GestureDetector(
      onTap: () => print('차트보기 클릭'),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Icon(Icons.show_chart, color: Colors.white),
              SizedBox(width: 5),
              Text('차트 보기', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  return Obx(
    () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonSetting(StatisticsController.to.isStateDiabetesMonth.isFalse,
            '이번 달', () => StatisticsController.to.stateDiabetesMonth()),
        buttonSetting(StatisticsController.to.isStateDiabetesMonthAgo.isFalse,
            '지난 달', () => StatisticsController.to.stateDiabetesMonthAge()),
        buttonSetting(StatisticsController.to.isStateDiabetes3Month.isFalse,
            '3개월', () => StatisticsController.to.stateDiabetes3Month()),
        graphIcon()
      ],
    ),
  );
}

// 평균 혈압 선택 및 차트 보기 위젯
Widget bloodPressureDaySetting() {
  Get.lazyPut(() => StatisticsController());

  Widget buttonSetting(dynamic isItem, String text, var onPressed) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            isItem ? null : MaterialStateProperty.all(Colors.white),
      ),
      child: TextConfig().TextConfig2(text, 15, FontWeight.w500,
          isItem ? Colors.white : Colors.indigoAccent),
      onPressed: onPressed,
    );
  }

  Widget graphIcon() {
    return GestureDetector(
      onTap: () => print('차트보기 클릭'),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Icon(Icons.show_chart, color: Colors.white),
              SizedBox(width: 5),
              Text('차트 보기', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  return Obx(
    () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonSetting(StatisticsController.to.isStateBloodMonth.isFalse, '이번 달',
            () => StatisticsController.to.stateBloodMonth()),
        buttonSetting(StatisticsController.to.isStateBloodMonthAgo.isFalse,
            '지난 달', () => StatisticsController.to.stateBloodMonthAge()),
        buttonSetting(StatisticsController.to.isStateBlood3Month.isFalse, '3개월',
            () => StatisticsController.to.stateBlood3Month()),
        graphIcon()
      ],
    ),
  );
}

// 평균 음식 선택 및 차트 보기 위젯
Widget foodDaySetting() {
  Get.lazyPut(() => StatisticsController());

  Widget buttonSetting(dynamic isItem, String text, var onPressed) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            isItem ? null : MaterialStateProperty.all(Colors.white),
      ),
      child: TextConfig().TextConfig2(text, 15, FontWeight.w500,
          isItem ? Colors.white : Colors.indigoAccent),
      onPressed: onPressed,
    );
  }

  Widget graphIcon() {
    return GestureDetector(
      onTap: () => print('차트보기 클릭'),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Icon(Icons.show_chart, color: Colors.white),
              SizedBox(width: 5),
              Text('차트 보기', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  return Obx(
    () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonSetting(StatisticsController.to.isStateFoodMonth.isFalse, '이번 달',
            () => StatisticsController.to.stateFoodMonth()),
        buttonSetting(StatisticsController.to.isStateFoodMonthAgo.isFalse,
            '지난 달', () => StatisticsController.to.stateFoodMonthAge()),
        buttonSetting(StatisticsController.to.isStateFood3Month.isFalse, '3개월',
            () => StatisticsController.to.stateFood3Month()),
        graphIcon()
      ],
    ),
  );
}

// 평균 운동 선택 및 차트 보기 위젯
Widget healthDaySetting() {
  Get.lazyPut(() => StatisticsController());

  Widget buttonSetting(dynamic isItem, String text, var onPressed) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            isItem ? null : MaterialStateProperty.all(Colors.white),
      ),
      child: TextConfig().TextConfig2(text, 15, FontWeight.w500,
          isItem ? Colors.white : Colors.indigoAccent),
      onPressed: onPressed,
    );
  }

  Widget graphIcon() {
    return GestureDetector(
      onTap: () => print('차트보기 클릭'),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Icon(Icons.show_chart, color: Colors.white),
              SizedBox(width: 5),
              Text('차트 보기', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  return Obx(
    () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonSetting(StatisticsController.to.isStateHealthMonth.isFalse,
            '이번 달', () => StatisticsController.to.stateHealthMonth()),
        buttonSetting(StatisticsController.to.isStateHealthMonthAgo.isFalse,
            '지난 달', () => StatisticsController.to.stateHealthMonthAge()),
        buttonSetting(StatisticsController.to.isStateHealth3Month.isFalse,
            '3개월', () => StatisticsController.to.stateHealth3Month()),
        graphIcon()
      ],
    ),
  );
}

// 평군 혈당 메인 위젯
Widget diabetesStatistics() {
  return LayoutBuilder(builder: (BuildContext context, size) {
    Widget _boxContainer() {
      Widget _resultInfo(
          String item, int result, dynamic resultMsg, Color color) {
        return Row(
          children: [
            SizedBox(width: 5),
            TextConfig().TextConfig1(item, 20, FontWeight.w500, Colors.black),
            SizedBox(width: 5),
            TextConfig().TextConfig1(
                '${result}', 20, FontWeight.w700, Colors.deepOrange),
            SizedBox(width: 15),
            Text('|',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            SizedBox(width: 15),
            TextConfig()
                .TextConfig1('${resultMsg}', 20, FontWeight.w700, color),
          ],
        );
      }

      return Obx(() => coverContainer(
            size.maxWidth - 20,
            Colors.white,
            Colors.white,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 5),
                _resultInfo(
                    '공복',
                    StatisticsController.to.diabetesEmpty.value.toInt(),
                    StatisticsController.to.diabetesEmptyResultString.value,
                    StatisticsController.to.diabetesEmptyResultString.value == '실패 에요!' ? Colors.red : Colors.black),
                SizedBox(height: 10),
                _resultInfo(
                    '식전',
                    StatisticsController.to.diabetesBefore.value.toInt(),
                    StatisticsController.to.diabetesBeforeResultString.value,
                    StatisticsController.to.diabetesBeforeResultString.value == '실패 에요!' ? Colors.red : Colors.black),
                SizedBox(height: 10),
                _resultInfo(
                    '식후',
                    StatisticsController.to.diabetesAfter.value.toInt(),
                    StatisticsController.to.diabetesAfterResultString.value,
                    StatisticsController.to.diabetesAfterResultString.value == '실패 에요!' ? Colors.red : Colors.black),
                SizedBox(height: 5),
              ],
            ),
          ));
    }

    return coverContainer(
      size.maxWidth,
      Colors.indigoAccent,
      Colors.indigoAccent,
      Column(
        children: [
          SizedBox(height: 5),
          TextConfig().TextConfig1('평균 혈당', 20, FontWeight.w600, Colors.white),
          SizedBox(height: 5),
          diabetesDaySetting(),
          SizedBox(height: 5),
          _boxContainer(),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextConfig()
                  .TextConfig1('전체 평균 혈당', 20, FontWeight.w500, Colors.white),
              SizedBox(width: 10),
              Obx(
                () => TextConfig().TextConfig1(
                    StatisticsController.to.totalDiabetesAverage.value
                        .toInt()
                        .toString(),
                    30,
                    FontWeight.w700,
                    Colors.orange),
              )
            ],
          )
        ],
      ),
    );
  });
}

// 평군 혈압 메인 위젯
Widget bloodPressureStatistics() {
  return LayoutBuilder(builder: (BuildContext context, size) {
    Widget _boxContainer() {
      Widget _resultInfo() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextConfig().TextConfig1('수축기', 20, FontWeight.w500, Colors.black),
            SizedBox(width: 5),
            TextConfig().TextConfig1(
                '${StatisticsController.to.bloodSys.value.toInt()}',
                30,
                FontWeight.w500,
                Colors.deepOrange),
            SizedBox(width: 15),
            Text('|',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            SizedBox(width: 15),
            TextConfig().TextConfig1('이완기', 20, FontWeight.w500, Colors.black),
            SizedBox(width: 5),
            TextConfig().TextConfig1(
                '${StatisticsController.to.bloodDia.value.toInt()}',
                30,
                FontWeight.w500,
                Colors.deepOrange),
          ],
        );
      }

      return Obx(
        () => coverContainer(
          size.maxWidth - 20,
          Colors.white,
          Colors.white,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 5),
              _resultInfo(),
              SizedBox(height: 20),
              TextConfig()
                  .TextConfig1(StatisticsController.to.bloodSysResultString.value, 25, FontWeight.w500,
                  StatisticsController.to.bloodSysResultString.value == '실패 에요!' ? Colors.red : Colors.black),
              SizedBox(height: 5),
            ],
          ),
        ),
      );
    }

    return coverContainer(
      size.maxWidth,
      Colors.deepOrange,
      Colors.deepOrange,
      Column(
        children: [
          SizedBox(height: 5),
          TextConfig().TextConfig1('평균 혈압', 20, FontWeight.w600, Colors.white),
          TextConfig()
              .TextConfig1('(수축기 기준)', 15, FontWeight.w600, Colors.white),
          SizedBox(height: 5),
          bloodPressureDaySetting(),
          SizedBox(height: 5),
          _boxContainer(),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextConfig()
                  .TextConfig1('고혈압 이에요', 20, FontWeight.w500, Colors.white),
              SizedBox(height: 10)
            ],
          )
        ],
      ),
    );
  });
}

// 평군 음식 메인 위젯
Widget foodStatistics() {
  return LayoutBuilder(builder: (BuildContext context, size) {
    Widget _boxContainer() {
      Widget _resultInfo() {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextConfig()
                        .TextConfig1('안좋은음식', 15, FontWeight.w500, Colors.black),
                    SizedBox(width: 5),
                    TextConfig().TextConfig1(
                        '${StatisticsController.to.badFoodResult.toInt()}',
                        30,
                        FontWeight.w500,
                        Colors.deepOrange),
                  ],
                ),
                SizedBox(width: 15),
                Text('|',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                SizedBox(width: 15),
                Column(
                  children: [
                    TextConfig()
                        .TextConfig1('좋은 음식', 15, FontWeight.w500, Colors.black),
                    SizedBox(width: 5),
                    TextConfig().TextConfig1(
                        '${StatisticsController.to.goodFoodResult.toInt()}',
                        30,
                        FontWeight.w500,
                        Colors.deepOrange),
                  ],
                ),
                SizedBox(width: 15),
                Text('|',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                SizedBox(width: 15),
                Column(
                  children: [
                    TextConfig()
                        .TextConfig1('애매한음식', 15, FontWeight.w500, Colors.black),
                    SizedBox(width: 5),
                    TextConfig().TextConfig1(
                        '${StatisticsController.to.sosoFoodResult.toInt()}',
                        30,
                        FontWeight.w500,
                        Colors.deepOrange),
                  ],
                ),
              ],
            ),
            TextConfig().TextConfig1(StatisticsController.to.badFoodResultString.value, 20, FontWeight.w500,
                StatisticsController.to.badFoodResultString.value == '실패 에요!' ? Colors.red : Colors.black
            )
          ],
        );
      }

      return Obx(
        () => coverContainer(
          size.maxWidth - 20,
          Colors.white,
          Colors.white,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 5),
              _resultInfo(),
            ],
          ),
        ),
      );
    }

    return coverContainer(
      size.maxWidth,
      Colors.green,
      Colors.green,
      Column(
        children: [
          SizedBox(height: 5),
          TextConfig()
              .TextConfig1('음식 섭취 합계', 20, FontWeight.w600, Colors.white),
          SizedBox(height: 5),
          foodDaySetting(),
          SizedBox(height: 5),
          _boxContainer(),
          SizedBox(height: 10),
        ],
      ),
    );
  });
}

// 평군 운동 메인 위젯
Widget healthStatistics() {
  return LayoutBuilder(builder: (BuildContext context, size) {
    Widget _boxContainer() {
      Widget _resultInfo() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextConfig()
                    .TextConfig1('${StatisticsController.to.monthName.value}', 20, FontWeight.w500, Colors.black),
                SizedBox(width: 10),
                TextConfig().TextConfig1(
                    '평균 운동 횟수는', 20, FontWeight.w500, Colors.black),
              ],
            ),
            SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextConfig().TextConfig1('${StatisticsController.to.healthSum}',
                    25, FontWeight.w500, Colors.deepOrange),
                SizedBox(width: 10),
                TextConfig()
                    .TextConfig1('회 입니다', 20, FontWeight.w500, Colors.black),
              ],
            )
          ],
        );
      }

      return Obx(
        () => coverContainer(
          size.maxWidth - 20,
          Colors.white,
          Colors.white,
          Column(
            children: [
              SizedBox(height: 5),
              _resultInfo(),
              SizedBox(height: 20),
              TextConfig()
                  .TextConfig1(StatisticsController.to.healthResultString.value, 25, FontWeight.w500, Colors.black),
            ],
          ),
        ),
      );
    }

    return coverContainer(
      size.maxWidth,
      Colors.deepPurpleAccent,
      Colors.deepPurpleAccent,
      Column(
        children: [
          SizedBox(height: 5),
          TextConfig()
              .TextConfig1('평균 운동 횟수', 20, FontWeight.w600, Colors.white),
          SizedBox(height: 5),
          healthDaySetting(),
          SizedBox(height: 5),
          _boxContainer(),
          SizedBox(height: 10),
        ],
      ),
    );
  });
}
