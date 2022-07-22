import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'dart:ui';

void main() {
  runApp(const DiabetesLife());
}

class DiabetesLife extends StatelessWidget {
  const DiabetesLife({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        '기기 실 사이즈 = Width : ${window.physicalSize.width} / Height : ${window.physicalSize.height}');
    print('기기 논리 사이즈 = Width : ${mainWidthSize} / Height : ${mainHeightSize}');
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaleFactor: mainWidthSize < 380 ? 1 : 1.4),
            child: child!);
      },
      title: 'Diabetes Life Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0)),
      home: const MainHome(),
    );
  }
}
