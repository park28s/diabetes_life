import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_colors.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_home/main_controller.dart';
import 'package:diabetes_life/main_home/main_home_view/goalMain.dart';
import 'package:diabetes_life/main_home/main_home_view/todayBloodPressure.dart';
import 'package:diabetes_life/main_home/main_home_view/todayDangHwa.dart';
import 'package:diabetes_life/main_home/main_home_view/todayDiabetes.dart';
import 'package:diabetes_life/main_home/main_home_view/todayFood.dart';
import 'package:diabetes_life/main_home/main_home_view/todayHealth.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:diabetes_life/pages/goal/goal_page.dart';
import 'package:diabetes_life/pages/today_diabetes/today_diabetes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDefault(),
        body: Container(
          alignment: Alignment.center,
          width: mainWidthSize,
          height: mainHeightSize,
          color: Colors.grey.shade200,
          child: LayoutBuilder(
            builder: (context, size) => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.maxHeight * 0.02),
                  InkWell(
                    onTap: () => Get.to(() => GoalPage()),
                    child: mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.4,
                        Colors.white, goalMain()),
                  ),
                  SizedBox(height: size.maxHeight * 0.02),
                  InkWell(
                    onTap: () => Get.to(() => TodayDiabetesPage()),
                    child: mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.2,
                        Colors.white, todayDiabetes()),
                  ),
                  SizedBox(height: size.maxHeight * 0.02),
                  mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.15,
                      Colors.white, todayDangHwa()),
                  SizedBox(height: size.maxHeight * 0.02),
                  mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.2,
                      Colors.white, todayBloodPressure()),
                  SizedBox(height: size.maxHeight * 0.02),
                  mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.17,
                      Colors.white, todayFood()),
                  SizedBox(height: size.maxHeight * 0.02),
                  mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.2,
                      Colors.white, todayHealth()),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: HexColor('#FFA400'),
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            CustomNaviBarController.to.fabAnimationController.reset();
            CustomNaviBarController.to.borderRadiusAnimationController.reset();
            CustomNaviBarController.to.borderRadiusAnimationController
                .forward();
            CustomNaviBarController.to.fabAnimationController.forward();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() => customAnimatedBar()));
  }
}
