import 'package:diabetes_life/main_config/google_admob/google_admob_config.dart';
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
import 'package:diabetes_life/pages/today_bloodpressure/today_bloodpressure_page.dart';
import 'package:diabetes_life/pages/today_diabetes/today_diabetes_page.dart';
import 'package:diabetes_life/pages/today_food/today_food_page.dart';
import 'package:diabetes_life/pages/today_health/today_health_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

late BannerAd? bannerAd;
late InterstitialAd? interstitialAd;
late RewardedAd? rewardedAd;

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  void initState() {
    super.initState();
    createBannerAd();
    createBannerAd2();
    createInterstitialAd();
    //createRewardedAd();
  }

  @override
  void dispose() {
    super.dispose();
    bannerAd?.dispose();
    interstitialAd?.dispose();
    rewardedAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CustomNaviBarController());
    CustomNaviBarController.to.bottomNavIndex.value = 5;
    naviBarSet();
    return Scaffold(
        appBar: AppBarDefault(),
        body: NotificationListener<ScrollNotification>(
            // child 부분에서 page 등록을 해줘야한다.
            child: Obx(() => naviBarSet())
            ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: HexColor('#FFA400'),
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            // naviBar homeButton click == bottomNaviIndex = 기본값 5 초기화
            CustomNaviBarController.to.bottomNavIndex.value = 5;
            print('bottomNavIndex ${CustomNaviBarController.to.bottomNavIndex}');
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


class MainHomeViewModel extends StatelessWidget {
  const MainHomeViewModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                  child: mainContainer(size.maxWidth * 0.9,
                      size.maxHeight * 0.4, Colors.white, goalMain()),
                ),
                SizedBox(height: size.maxHeight * 0.02),
                InkWell(
                  onTap: () => Get.to(() => TodayDiabetesPage()),
                  child: mainContainer(size.maxWidth * 0.9,
                      size.maxHeight * 0.2, Colors.white, todayDiabetes()),
                ),
                SizedBox(height: size.maxHeight * 0.02),
                mainContainer(size.maxWidth * 0.9, size.maxHeight * 0.15,
                    Colors.white, todayDangHwa()),
                SizedBox(height: size.maxHeight * 0.02),
                InkWell(
                  onTap: () => Get.to(() => TodayBloodPressure()),
                  child: mainContainer(size.maxWidth * 0.9,
                      size.maxHeight * 0.2, Colors.white, todayBloodPressure()),
                ),
                SizedBox(height: size.maxHeight * 0.02),
                InkWell(
                  onTap: () => Get.to(() => TodayFood()),
                  child: mainContainer(size.maxWidth * 0.9,
                      size.maxHeight * 0.2, Colors.white, todayFood()),
                ),
                SizedBox(height: size.maxHeight * 0.02),
                InkWell(
                  onTap: () => Get.to(() => TodayHealth()),
                  child: mainContainer(size.maxWidth * 0.9,
                      size.maxHeight * 0.4, Colors.white, todayHealth()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}