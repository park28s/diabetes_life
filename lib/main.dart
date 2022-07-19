import 'package:diabetes_life/main_home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const DiabetesLife());
}

class DiabetesLife extends StatelessWidget {
  const DiabetesLife({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Diabetes Life Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0)
      ),
      home: const MainHome(),
    );
  }
}
