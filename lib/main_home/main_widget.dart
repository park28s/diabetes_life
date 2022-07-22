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

// 메인에 배치 될 목표 위젯
Widget goalMain() {
  return LayoutBuilder(
      builder: (BuildContext context, size) => Column(
            children: [
              SizedBox(height: size.maxHeight * 0.05),
              AutoSizeTextConfig().TextConfig2(
                  '이번달 목표', 1, 30, 15, Colors.black, 20, FontWeight.w700),
              SizedBox(height: size.maxHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeTextConfig().TextConfig2('이번달 평균 혈당 목표는 ', 1, 30, 10,
                      Colors.black, 15, FontWeight.w300),
                  AutoSizeTextConfig().TextConfig2(
                      '120', 1, 40, 18, Colors.deepOrange, 20, FontWeight.bold),
                  AutoSizeTextConfig().TextConfig2(
                      ' 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeTextConfig().TextConfig2('이번달 평균 혈압 목표는 ', 1, 30, 10,
                      Colors.black, 15, FontWeight.w300),
                  AutoSizeTextConfig().TextConfig2('120 / 80', 1, 40, 18,
                      Colors.deepOrange, 20, FontWeight.bold),
                  AutoSizeTextConfig().TextConfig2(
                      ' 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeTextConfig().TextConfig2('이번달 나쁜 음식은 ', 1, 30, 10,
                      Colors.black, 15, FontWeight.w300),
                  AutoSizeTextConfig().TextConfig2(
                      '1', 1, 40, 18, Colors.deepOrange, 20, FontWeight.bold),
                  AutoSizeTextConfig().TextConfig2(' 번만 먹을래요!', 1, 30, 10,
                      Colors.black, 15, FontWeight.w300),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeTextConfig().TextConfig2('이번달 목표 운동 횟수는 ', 1, 30, 10,
                      Colors.black, 15, FontWeight.w300),
                  AutoSizeTextConfig().TextConfig2(
                      '10', 1, 40, 18, Colors.deepOrange, 20, FontWeight.bold),
                  AutoSizeTextConfig().TextConfig2(
                      '번 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
                ],
              )
            ],
          ));
}

// 메인에 배치 될 오늘의 혈당 위젯
Widget todayDiabetes() {
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(
      children: [
        SizedBox(height: size.maxHeight * 0.05),
        AutoSizeTextConfig().TextConfig2(
            '오늘의 혈당', 1, 30, 15, Colors.black, 10, FontWeight.w700),
        SizedBox(height: size.maxHeight * 0.05),
        AutoSizeTextConfig().TextConfig2(
            '(마지막 측정 기준)', 1, 30, 15, Colors.black, 10, FontWeight.w700),
        SizedBox(height: size.maxHeight * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                AutoSizeTextConfig().TextConfig2('식전', 1, 25, 10, Colors.black, 25, FontWeight.w200),
                SizedBox(width: size.maxWidth * 0.02),
                AutoSizeTextConfig().TextConfig2('110', 1, 35, 10, Colors.deepOrangeAccent, 35, FontWeight.bold),
              ],
            ),
            Row(
              children: [
                AutoSizeTextConfig().TextConfig2('식후', 1, 25, 10, Colors.black, 25, FontWeight.w200),
                SizedBox(width: size.maxWidth * 0.02),
                AutoSizeTextConfig().TextConfig2('130', 1, 35, 10, Colors.deepOrangeAccent, 35, FontWeight.bold),
              ],
            ),
          ],
        )
      ],
    ),
  );
}

// 메인에 배치 될 예상 당화혈색소 위젯
Widget todayDangHwa() {
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(children: [
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig().TextConfig2(
          '예상 당화혈색소', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig().TextConfig2(
          '6.7', 1, 40, 15, Colors.deepPurpleAccent, 35, FontWeight.w700),
    ]),
  );
}

// 메인에 배치 될 오늘의 혈압 위젯
Widget todayBloodPressure() {
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(children: [
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig()
          .TextConfig2('오늘의 혈압', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig().TextConfig2(
          '(마지막 측정 기준)', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              AutoSizeTextConfig().TextConfig2('수축기', 1, 25, 10, Colors.black, 25, FontWeight.w200),
              SizedBox(width: size.maxWidth * 0.02),
              AutoSizeTextConfig().TextConfig2('120', 1, 35, 10, Colors.deepOrangeAccent, 35, FontWeight.bold),
            ],
          ),
          Row(
            children: [
              AutoSizeTextConfig().TextConfig2('이완기', 1, 25, 10, Colors.black, 25, FontWeight.w200),
              SizedBox(width: size.maxWidth * 0.02),
              AutoSizeTextConfig().TextConfig2('80', 1, 35, 10, Colors.deepOrangeAccent, 35, FontWeight.bold),
            ],
          ),
        ],
      )
    ]),
  );
}

// 메인에 배치 될 오늘의 음식 위젯
Widget todayFood() {
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(children: [
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig()
          .TextConfig2('오늘의 음식', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
    ]),
  );
}

// 메인에 배치 될 오늘의 음식 위젯
Widget todayHealth() {
  return LayoutBuilder(
    builder: (BuildContext context, size) => Column(children: [
      SizedBox(height: size.maxHeight * 0.05),
      AutoSizeTextConfig()
          .TextConfig2('오늘의 운동', 1, 30, 15, Colors.black, 10, FontWeight.w700),
      SizedBox(height: size.maxHeight * 0.05),
    ]),
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
