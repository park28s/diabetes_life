import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 디폴트 앱바 ( 로고, 로그인 버튼)
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

// 디폴트 앱바2 ( 로고, 로그인 버튼)
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
          onPressed: () => Get.back(), icon: Icon(Icons.backspace_outlined, color: Colors.black,)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(mainHeightSize * 0.08);
}

// 디폴트2 앱바 ( 로고, 스캔 용도 버튼)
/*class AppBarDefault2 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDefault2();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.blue, size: 30),
      elevation: 0,
      title: Text('로또의 신', style: Get.textTheme.headline1),
      leadingWidth: mainWidthSize,
     // leading: scanPageBack(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(mainHeightSize * 0.07);
}

//////////////////////////////////////////////////////////////////////////////

// 디폴트3 앱바 ( 로고, 뒤로가기 변수 초기화 용도 버튼)
class AppBarDefault3 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDefault3();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.blue, size: 30),
      elevation: 0,
      title: Text('로또의 신', style: Get.textTheme.headline1),
      leadingWidth: mainWidthSize,
   //   leading: loadSaveBack(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(mainHeightSize * 0.07);
}

// 디폴트4 앱바 ( 앱바 삭제효과 용도 )
class AppBarDefault4 extends StatelessWidget implements PreferredSizeWidget {
  AppBarDefault4();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}*/
