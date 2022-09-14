import 'package:diabetes_life/main_config/main_dateTime.dart';
import 'package:diabetes_life/pages/model/check_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// 메인에 배치 될 목표 위젯
Widget goalMain() {
  return LayoutBuilder(
      builder: (BuildContext context, size) => ValueListenableBuilder(
          valueListenable: Hive.box<CheckModel>('check').listenable(),
          builder: (context, Box<CheckModel> box, child) {
            final _diabetesEmptyStomach = box
                .get('${timeNow.year}-${timeNow.month}')
                ?.diabetesEmptyStomach;
            final _diabetesBeforeMeal =
                box.get('${timeNow.year}-${timeNow.month}')?.diabetesBeforeMeal;
            final _diabetesAfterMeal =
                box.get('${timeNow.year}-${timeNow.month}')?.diabetesAfterMeal;
            final _bloodPressure1 =
                box.get('${timeNow.year}-${timeNow.month}')?.bloodPressure1;
            final _bloodPressure2 =
                box.get('${timeNow.year}-${timeNow.month}')?.bloodPressure2;
            final _badFood =
                box.get('${timeNow.year}-${timeNow.month}')?.badFood;
            final _health = box.get('${timeNow.year}-${timeNow.month}')?.health;

            return Column(
              children: [
                SizedBox(height: size.maxHeight * 0.05),
                textView1(size.maxWidth - 10),
                SizedBox(height: size.maxHeight * 0.05),
                textView2(size.maxWidth - 10),
                SizedBox(height: size.maxHeight * 0.05),
                textView3(size.maxWidth - 10, _diabetesEmptyStomach,
                    _diabetesBeforeMeal, _diabetesAfterMeal),
                SizedBox(height: size.maxHeight * 0.05),
                textView4(size.maxWidth - 10, '이번달 평균 혈압 목표는 ', ' 이에요!',
                    _bloodPressure1, _bloodPressure2),
                SizedBox(height: size.maxHeight * 0.05),
                textView5(
                    size.maxWidth - 10, '이번달 나쁜 음식은 ', ' 번만 먹을래요!', _badFood),
                SizedBox(height: size.maxHeight * 0.05),
                textView5(
                    size.maxWidth - 10, '이번달 목표 운동 횟수는 ', ' 번 이에요!', _health),
                SizedBox(height: size.maxHeight * 0.05),
              ],
            );
          }));
}

Widget textView1(double widthSize) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      width: widthSize,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          '${timeNow.month}월달의 목표',
          style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontFamily: 'MaruBuri'),
        ),
      ),
    ),
  );
}

Widget textView2(double widthSize) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      width: widthSize,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          '이번달 평균 혈당 목표는',
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontFamily: 'MaruBuri'),
        ),
      ),
    ),
  );
}

Widget textView3(double widthSize, dynamic a, dynamic b, dynamic c) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      width: widthSize,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('공복 ',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MaruBuri',
                    fontWeight: FontWeight.w700)),
            a == null
                ? Text('-')
                : Text(a.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'MaruBuri',
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text('식전 ',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MaruBuri',
                    fontWeight: FontWeight.w700)),
            b == null
                ? Text('-')
                : Text(b.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'MaruBuri',
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text('식후 ',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MaruBuri',
                    fontWeight: FontWeight.w700)),
            c == null
                ? Text('-')
                : Text(c.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'MaruBuri',
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold)),
            Text(' 이에요!',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MaruBuri',
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    ),
  );
}

Widget textView4(
    double widthSize, String text1, String text2, dynamic a, dynamic b) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      width: widthSize,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text1,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MaruBuri',
                    fontWeight: FontWeight.w300)),
            a == null || b == null
                ? Text('-')
                : Text('${a.toString()} / ${b.toString()}',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'MaruBuri',
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold)),
            Text(text2,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MaruBuri',
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    ),
  );
}

Widget textView5(double widthSize, String text1, String text2, dynamic a) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      width: widthSize,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text1,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MaruBuri',
                    fontWeight: FontWeight.w300)),
            a == null
                ? Text('-')
                : Text('${a.toString()}',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'MaruBuri',
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold)),
            Text(text2,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MaruBuri',
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    ),
  );
}

/*
Widget goalMain() {
  return LayoutBuilder(
      builder: (BuildContext context, size) => ValueListenableBuilder(
          valueListenable: Hive.box<CheckModel>('check').listenable(),
          builder: (context, Box<CheckModel> box, child) {
            final _diabetesEmptyStomach = box
                .get('${timeNow.year}-${timeNow.month}')
                ?.diabetesEmptyStomach;
            final _diabetesBeforeMeal =
                box.get('${timeNow.year}-${timeNow.month}')?.diabetesBeforeMeal;
            final _diabetesAfterMeal =
                box.get('${timeNow.year}-${timeNow.month}')?.diabetesAfterMeal;
            final _bloodPressure1 =
                box.get('${timeNow.year}-${timeNow.month}')?.bloodPressure1;
            final _bloodPressure2 =
                box.get('${timeNow.year}-${timeNow.month}')?.bloodPressure2;
            final _badFood =
                box.get('${timeNow.year}-${timeNow.month}')?.badFood;
            final _health = box.get('${timeNow.year}-${timeNow.month}')?.health;

            return SafeArea(
              child: Column(
                children: [
                  SizedBox(height: size.maxHeight * 0.05),
                  Expanded(child: AutoSizeTextConfig().TextConfig2('${timeNow.month}월달의 목표', 1,
                      30, 25, Colors.black, 20, FontWeight.w700)),
                  SizedBox(height: size.maxHeight * 0.05),
                  Expanded(child: AutoSizeTextConfig().TextConfig2('이번달 평균 혈당 목표는', 1, 25, 20,
                      Colors.black, 15, FontWeight.w300)),
                  SizedBox(height: 5),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '공복 ', style: TextStyle(fontFamily: 'MaruBuri', fontWeight: FontWeight.w700)),
                          _diabetesEmptyStomach == null
                              ? Text('-')
                              : Text(
                              _diabetesEmptyStomach.toString(),
                              style: TextStyle(fontFamily: 'MaruBuri', color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text(
                              '식전 ', style: TextStyle(fontFamily: 'MaruBuri', fontWeight: FontWeight.w700)),
                          _diabetesBeforeMeal == null
                              ? Text('-')
                              : Text(
                              _diabetesBeforeMeal.toString(),
                              style: TextStyle(fontFamily: 'MaruBuri', color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text(
                              '식후 ', style: TextStyle(fontFamily: 'MaruBuri', fontWeight: FontWeight.w700)),
                          _diabetesAfterMeal == null
                              ? Text('-')
                              : Text(
                              _diabetesAfterMeal.toString(),
                              style: TextStyle(fontFamily: 'MaruBuri', color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                          Text(
                              ' 이에요!', style: TextStyle(fontFamily: 'MaruBuri', fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      width: size.maxWidth -15,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('이번달 평균 혈압 목표는 ', style: TextStyle(fontFamily: 'MaruBuri', fontWeight: FontWeight.w300)),
                            _bloodPressure1 == null || _bloodPressure2 == null
                                ? Text('-')
                                : Text(
                                '${_bloodPressure1.toString()} / ${_bloodPressure2.toString()}',
                                style: TextStyle(fontFamily: 'MaruBuri', color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                            Text(
                                ' 이에요!', style: TextStyle(fontFamily: 'MaruBuri', fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeTextConfig().TextConfig2('이번달 나쁜 음식은 ', 1, 30, 10,
                          Colors.black, 15, FontWeight.w300),
                      _badFood == null
                          ? Text('-')
                          : AutoSizeTextConfig().TextConfig2(_badFood.toString(),
                          1, 35, 15, Colors.deepOrange, 20, FontWeight.bold),
                      AutoSizeTextConfig().TextConfig2(' 번만 먹을래요!', 1, 30, 10,
                          Colors.black, 15, FontWeight.w300),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeTextConfig().TextConfig2('이번달 목표 운동 횟수는 ', 1, 30,
                          10, Colors.black, 15, FontWeight.w300),
                      _health == null
                          ? Text('-')
                          : AutoSizeTextConfig().TextConfig2(_health.toString(),
                          1, 35, 15, Colors.deepOrange, 20, FontWeight.bold),
                      AutoSizeTextConfig().TextConfig2(
                          '번 이에요!', 1, 30, 10, Colors.black, 15, FontWeight.w300),
                    ],
                  )
                ],
              ),
            );
          }));
}*/
