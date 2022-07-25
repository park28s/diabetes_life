import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:diabetes_life/pages/goal/goal_widget.dart';
import 'package:flutter/material.dart';

TextEditingController diabetesEmptyStomach = TextEditingController();
TextEditingController diabetesBeforeMeal = TextEditingController();
TextEditingController diabetesAfterMeal = TextEditingController();
TextEditingController bloodPressure1 = TextEditingController();
TextEditingController bloodPressure2 = TextEditingController();
TextEditingController badFood = TextEditingController();
TextEditingController health = TextEditingController();
GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

class GoalPage extends StatelessWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBarDefault2(),
        body: Container(
          alignment: Alignment.center,
          width: mainWidthSize,
          height: mainHeightSize,
          color: Colors.grey.shade200,
          child: LayoutBuilder(
            builder: (context, size) => SingleChildScrollView(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey1,
                  child: Column(
                    children: [
                      SizedBox(height: size.maxHeight * 0.02),
                      mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.25,
                          Colors.white, diabetesGoal()),
                      SizedBox(height: size.maxHeight * 0.02),
                      mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.25,
                          Colors.white, bloodPressureGoal()),
                      SizedBox(height: size.maxHeight * 0.02),
                      mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.15,
                          Colors.white, badFoodGoal()),
                      SizedBox(height: 20),
                      MaterialButton(
                        color: Colors.deepPurple,
                        child: AutoSizeTextConfig().TextConfig1(
                            '저 장', 1, Colors.white, FontWeight.w700),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
