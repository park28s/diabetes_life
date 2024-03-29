import 'package:diabetes_life/firebase_options.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_home/main_home.dart';
import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:diabetes_life/pages/model/today_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(CheckModelAdapter());
  Hive.registerAdapter(TodayModelAdapter());
  await HiveConfig().openBox();
  await HiveConfig().boxSetting();
  await HiveConfig().eventSetting();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDateFormatting().then((value) => runApp(const DiabetesLife()));
}

class DiabetesLife extends StatelessWidget {
  const DiabetesLife({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    mainStart();
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
