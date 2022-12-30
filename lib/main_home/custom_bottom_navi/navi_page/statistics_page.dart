import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_controller/statistics_controller.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_widget/statistics_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StatisticsController());
    StatisticsController.to.diabetesAverage();
    StatisticsController.to.diabetesResultString();
    StatisticsController.to.bloodPressureAverage();
    StatisticsController.to.bloodPressureResultString();
    StatisticsController.to.foodAverage();
    StatisticsController.to.foodResultString();
    StatisticsController.to.healthSumAverage();
    StatisticsController.to.healthCheckResultString();
    print(check?.toMap().map((key, value) => MapEntry(key, value.bloodPressure1)));

    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: mainWidthSize - 20,
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
