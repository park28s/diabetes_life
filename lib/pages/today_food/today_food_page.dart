import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/pages/today_food/today_food_widget.dart';
import 'package:flutter/material.dart';

class TodayFood extends StatelessWidget {
  const TodayFood({Key? key}) : super(key: key);

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
                pageName('음식 관리', Colors.green.shade800),
                SizedBox(height: 10),
                tableCalendar(),
                SizedBox(height: 10),
                selectedList3()
              ],
            )),
      ),
    );
  }
}
