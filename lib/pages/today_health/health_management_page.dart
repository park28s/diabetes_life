import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/today_health/health_management_widget.dart';
import 'package:flutter/material.dart';

class HealthManagement extends StatelessWidget {
  const HealthManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarDefault2(),
        body: SingleChildScrollView(
          child: Container(
            width: mainWidthSize,
            height: mainHeightSize,
            child: LayoutBuilder(
                builder: (context, size) => Column(
                      children: [
                        pageName('운동 리스트 관리', Colors.deepPurpleAccent),
                        SizedBox(height: 10),
                        healthListContainer(),
                        TextConfig().TextConfig1('삭제 하시려면 운동을 클릭해 주세요', 15,
                            FontWeight.w500, Colors.black),
                        SizedBox(height: 10),
                        Divider(
                            color: Colors.grey.shade500,
                            thickness: 5,
                            indent: 10,
                            endIndent: 10),
                        SizedBox(height: 10),
                        TextConfig().TextConfig1(
                            '새로운 운동을 등록해 주세요', 15, FontWeight.w500, Colors.black),
                        SizedBox(height: 10),
                        healthInputForm(),
                        SizedBox(height: 10),
                        healthListColor(),
                        SizedBox(height: 10),
                        healthListColor2(),
                        SizedBox(height: 10),
                        healthInputButton()
                      ],
                    )),
          ),
        ),
      ),
    );
  }
}
