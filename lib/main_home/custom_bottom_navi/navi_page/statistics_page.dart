import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_widget/statistics_widget.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 날짜에 맞는 box 를 가져온다
    // 공복, 식전, 식후를 가져온다
    print(mainBox?.toMap().values.elementAt(0));
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: mainWidthSize -20,
          child: Column(
            children: [
              diabetesStatistics(),
              SizedBox(height: 10),
              bloodPressureStatistics(),
              SizedBox(height: 10),
              foodStatistics(),
              SizedBox(height: 10),
              healthStatistics()
            ],
          ),
        ),
      ),
    );
  }
}
