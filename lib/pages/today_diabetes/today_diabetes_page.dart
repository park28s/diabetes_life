import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/pages/today_diabetes/today_diabetes_widget.dart';
import 'package:flutter/material.dart';

class TodayDiabetesPage extends StatelessWidget {
  const TodayDiabetesPage({Key? key}) : super(key: key);

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
                    pageName('혈당 관리'),
                    SizedBox(height: 10),
                    tableCalendar(),
                    SizedBox(height: 10),
                    selectedList()
                  ],
                )),
      ),
    );
  }
}
