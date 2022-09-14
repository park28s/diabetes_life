import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/pages/goal/goal_widget.dart';
import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

TextEditingController diabetesEmptyStomachController = TextEditingController();
TextEditingController diabetesBeforeMealController = TextEditingController();
TextEditingController diabetesAfterMealController = TextEditingController();
TextEditingController bloodPressureController1 = TextEditingController();
TextEditingController bloodPressureController2 = TextEditingController();
TextEditingController badFoodController = TextEditingController();
TextEditingController healthController = TextEditingController();
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
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            width: mainWidthSize,
            height: mainHeightSize,
            color: Colors.grey.shade200,
            child: LayoutBuilder(
              builder: (context, size) => Form(
                key: formKey1,
                child: Column(
                  children: [
                    SizedBox(height: size.maxHeight * 0.02),
                    diabetesGoal(size.maxWidth * 0.9, size.maxHeight * 0.25),
                    SizedBox(height: size.maxHeight * 0.02),
                    bloodPressureGoal(
                        size.maxWidth * 0.9, size.maxHeight * 0.25),
                    SizedBox(height: size.maxHeight * 0.02),
                    badFoodGoal(size.maxWidth * 0.9, size.maxHeight * 0.25),
                    SizedBox(height: 20),
                    MaterialButton(
                      color: Colors.deepPurple,
                      child: AutoSizeTextConfig()
                          .TextConfig1('저 장', 1, Colors.white, FontWeight.w700),
                      onPressed: () async {
                        print('${timeNow.year}-${timeNow.month}');
                        if (formKey1.currentState!.validate()) {
                          return await Hive.box<CheckModel>('check')
                              .put(
                                  '${timeNow.year}-${timeNow.month}',
                                  CheckModel(
                                    diabetesEmptyStomach: int.parse(
                                        diabetesEmptyStomachController.text),
                                    diabetesBeforeMeal: int.parse(
                                        diabetesBeforeMealController.text),
                                    diabetesAfterMeal: int.parse(
                                        diabetesAfterMealController.text),
                                    bloodPressure1: int.parse(
                                        bloodPressureController1.text),
                                    bloodPressure2: int.parse(
                                        bloodPressureController2.text),
                                    badFood: int.parse(badFoodController.text),
                                    health: int.parse(healthController.text),
                                  ))
                              .whenComplete(() => textFormClear())
                              .whenComplete(() => Get.back())
                              .whenComplete(
                                  () => getSnackBar('성공적으로 저장 되었습니다!', ''));
                        } else {
                          return getSnackBar(
                              '입력이 잘못됐어요!', '빈곳이 없는지, 숫자로 넣어주신게 맞는지 확인해 주세요');
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
