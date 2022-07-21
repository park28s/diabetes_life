import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:diabetes_life/main_config/main_colors.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_controller.dart';
import 'package:diabetes_life/main_home/main_total_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 메인에 배치될 컨테이너
Widget mainContainer(double width, double height, dynamic child) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
     boxShadow: [BoxShadow(color: Colors.black)],
        borderRadius: BorderRadius.circular(10), color: Colors.white),
    child: child,
  );
}

// 메인에 배치 될 목표 위젯
Widget goalMain() {
  return Text('골');
}


// main navigationBar
Widget customAnimatedBar() {
  Get.put(CustomNaviBarController());
  //final customNaviBarController = Get.find<CustomNaviBarController>();
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
