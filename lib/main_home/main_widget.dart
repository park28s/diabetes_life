import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:diabetes_life/main_home/main_controller.dart';
import 'package:diabetes_life/main_home/main_total_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget mainContainer(double width, double height, String text) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.yellow
    ),
    child: Text(text),
  );
}

// main navigationBar
Widget customAnimatedBar() {
  Get.put(CustomNaviBarController());
  final customNaviBarController = Get.find<CustomNaviBarController>();
  return AnimatedBottomNavigationBar.builder(
    itemCount: iconList.length,
    tabBuilder: (int index, bool isAction) {
      final color = isAction ? Colors.deepPurple : Colors.black;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconList[index], size: 24, color: color),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AutoSizeText(
              '$index',
              maxLines: 1,
              style: TextStyle(color: color),
              group: customNaviBarController.autoSizeGroup,
            ),
          )
        ],
      );
    },
    backgroundColor: Colors.white,
    activeIndex: customNaviBarController.bottomNavIndex.value,
    splashColor: Colors.grey,
    notchAndCornersAnimation: customNaviBarController.borderRadiusAnimation,
    notchSmoothness: NotchSmoothness.defaultEdge,
    gapLocation: GapLocation.center,
    leftCornerRadius: 32,
    rightCornerRadius: 32,
    onTap: (index) => customNaviBarController.bottomNavIndex.value = index,
    hideAnimationController:
        customNaviBarController.hideBottomBarAnimationController,
    shadow: BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 12,
      spreadRadius: 0.5,
      color: Colors.black,
    ),
  );
}
