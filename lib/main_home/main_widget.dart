import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:diabetes_life/main_config/main_colors.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_controller.dart';
import 'package:diabetes_life/main_home/main_total_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 메인에 배치될 컨테이너
Widget mainContainer(
    double width, double height, dynamic color, dynamic child) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [BoxShadow(color: Colors.black)],
        borderRadius: BorderRadius.circular(10),
        color: color),
    child: child,
  );
}

// main navigationBar
Widget customAnimatedBar() {
  Get.put(CustomNaviBarController());
  return AnimatedBottomNavigationBar.builder(
    itemCount: iconList.length,
    tabBuilder: (int index, bool isAction) {
      final color = isAction ? HexColor('#FFA400') : Colors.black;
      final menuName = ['빠른입력', '내정보', '통계', '설정'];
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconList[index], size: 24, color: color),
          SizedBox(height: 4),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AutoSizeTextConfig()
                  .TextConfig1(menuName[index], 1, color, FontWeight.w300))
        ],
      );
    },
    backgroundColor: Colors.white,
    activeIndex: CustomNaviBarController.to.bottomNavIndex.value,
    splashColor: HexColor('#FFA400'),
    notchAndCornersAnimation: CustomNaviBarController.to.borderRadiusAnimation,
    notchSmoothness: NotchSmoothness.defaultEdge,
    gapLocation: GapLocation.center,
    leftCornerRadius: 32,
    rightCornerRadius: 32,
    onTap: (index) => CustomNaviBarController.to.bottomNavIndex.value = index,
    hideAnimationController:
        CustomNaviBarController.to.hideBottomBarAnimationController,
    shadow: BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 12,
      spreadRadius: 0.5,
      color: Colors.grey,
    ),
  );
}

// 오늘의 음식 메인 컨테이너
Widget foodContainer(double width, double height, dynamic color, String text) {
  return Container(
    alignment: Alignment.center,
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5)
    ),
    child: Text(text, style: TextStyle(color: Colors.white),)
  );
}

// 오늘의 운동 메인 컨테이너
Widget healthContainer(double width, double height, dynamic color, String text) {
  return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Text(text, style: TextStyle(color: Colors.white),)
  );
}
