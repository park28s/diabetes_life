import 'package:diabetes_life/main_config/google_admob/google_admob_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 디폴트 앱바 ( 로고 )
class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDefault();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: TextConfig()
          .TextConfig1('슬기로운 당뇨생활', 25, FontWeight.bold, Colors.black),
      actions: [
        /* userUid == null
            ? loginIconButton(Colors.blue, '  로그인', 11, Colors.lightBlue)
            : Text('')*/
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(mainHeightSize * 0.08);
}
//////////////////////////////////////////////////////////////////////////////

// 디폴트 앱바2 ( 로고, backButton)
class AppBarDefault2 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDefault2();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: TextConfig()
          .TextConfig1('슬기로운 당뇨생활', 25, FontWeight.bold, Colors.black),
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.backspace_outlined,
            color: Colors.black,
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(mainHeightSize * 0.08);
}

// 디폴트 앱바3 ( 로고, backButton)
class AppBarDefault3 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDefault3();

  @override
  Widget build(BuildContext context) {
    createInterstitialAd();
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: TextConfig()
          .TextConfig1('슬기로운 당뇨생활', 25, FontWeight.bold, Colors.black),
      leading: IconButton(
          onPressed: () {
            Get.back();
            showInterstitialAd();
          },
          icon: Icon(
            Icons.backspace_outlined,
            color: Colors.black,
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(mainHeightSize * 0.08);
}
