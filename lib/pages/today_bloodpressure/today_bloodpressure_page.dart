import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/pages/today_bloodpressure/today_bloodpressure_widget.dart';
import 'package:flutter/material.dart';

class TodayBloodPressure extends StatelessWidget {
  const TodayBloodPressure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault2(),
      body: Container(
        width: mainWidthSize,
        height: mainHeightSize,
        child: LayoutBuilder(
            builder: (context, size) => Column(
              children: [
                pageName('혈압 관리', Colors.redAccent),
                SizedBox(height: 10),
                bloodTableCalendar(),
                SizedBox(height: 10),
                selectedList2()
              ],
            )
        ),
      ),
    );
  }
}