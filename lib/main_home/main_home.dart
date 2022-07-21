import 'package:diabetes_life/main_config/main_appbar_default.dart';
import 'package:diabetes_life/main_config/main_colors.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_home/main_controller.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
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
                  mainContainer(
                      size.maxWidth * 0.9, size.maxHeight * 0.25, goalMain()),
                  SizedBox(height: size.maxHeight * 0.02),
                  mainContainer(
                      size.maxWidth * 0.9, size.maxHeight * 0.15, Text('오늘의 혈당')),
                  SizedBox(height: size.maxHeight * 0.02),
                  mainContainer(
                      size.maxWidth * 0.9, size.maxHeight * 0.15, Text('예상 당화혈색소')),
                  SizedBox(height: size.maxHeight * 0.02),
                  mainContainer(
                      size.maxWidth * 0.9, size.maxHeight * 0.15, Text('오늘의 혈압')),
                  SizedBox(height: size.maxHeight * 0.02),
                  mainContainer(
                      size.maxWidth * 0.9, size.maxHeight * 0.15, Text('오늘의 음식')),
                  SizedBox(height: size.maxHeight * 0.02),
                  mainContainer(
                      size.maxWidth * 0.9, size.maxHeight * 0.15, Text('오늘의 운동')),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: HexColor('#FFA400'),
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            CustomNaviBarController.to.fabAnimationController.reset();
            CustomNaviBarController.to.borderRadiusAnimationController.reset();
            CustomNaviBarController.to.borderRadiusAnimationController.forward();
            CustomNaviBarController.to.fabAnimationController.forward();
          },),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() => customAnimatedBar()));
  }
}
