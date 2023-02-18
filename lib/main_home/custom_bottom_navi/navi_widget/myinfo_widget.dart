import 'package:diabetes_life/main_config/google_admob/google_admob_config.dart';
import 'package:diabetes_life/main_config/main_hive_config.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/custom_bottom_navi/navi_controller/myinfo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Widget userAvatar() {
  return Center(
    child: CircleAvatar(
      radius: mainWidthSize * 0.09,
      backgroundColor: Colors.grey,
      child: Text(
        'G',
        style: TextStyle(
            color: Colors.white,
            fontSize: mainWidthSize * 0.09,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget userName() {
  return Center(
    child: Text(
      'Guest',
      style: TextStyle(
          color: Colors.grey,
          fontSize: mainWidthSize * 0.06,
          fontWeight: FontWeight.bold),
    ),
  );
}

Widget notice() {
  Widget noticeList(String text, double size) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black, fontSize: size, fontWeight: FontWeight.bold),
    );
  }

  return Center(
    child: Container(
      alignment: Alignment.center,
      width: mainWidthSize - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade500)),
      child: Column(
        children: [
          SizedBox(height: 10),
          noticeList('곧 2.0 버전이 출시 됩니다!', 20),
          SizedBox(height: 3),
          noticeList('👉 로그인 기능', 15),
          SizedBox(height: 3),
          noticeList('👉 광고 제거 기능', 15),
          SizedBox(height: 3),
          noticeList('👉 백업 기능', 15),
          SizedBox(height: 10)
        ],
      ),
    ),
  );
}

Widget myPromise() {
  /* Widget _myPromiseText(String text, double size, Color color) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }*/

  return Center(
      child: Container(
    alignment: Alignment.center,
    width: mainWidthSize - 20,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade500)),
    child: LayoutBuilder(
      builder: (context, size) {
        return Column(
          children: [
            SizedBox(height: 10),
            TextView().textView1('내 몸은 내가 관리 한다!', size.maxWidth * 0.05,
                FontWeight.bold, Colors.black),
            SizedBox(height: 5),
            TextView().textView1(
                '나의 다짐은?', size.maxWidth * 0.05, FontWeight.bold, Colors.black),
            SizedBox(height: 10),
            Container(
              width: mainWidthSize - 50,
              child: ValueListenableBuilder(
                valueListenable: Hive.box<String>('myPromiseBox').listenable(),
                builder: (context, Box<String> box, child) {
                  return box.values.isEmpty
                      ? Center(
                          child: TextView().textView1(
                              '아직 등록이 안되어 있어요!',
                              size.maxWidth * 0.05,
                              FontWeight.normal,
                              Colors.redAccent),
                        )
                      : Text(
                          '${box.values.first}',
                          style: TextStyle(
                              fontSize: size.maxWidth * 0.05, height: 1.5),
                          textAlign: TextAlign.center,
                        );
                },
              ),
            )
          ],
        );
      },
    ),
  ));
}

Widget registerButton(context) {
  Future _myPromisePage() async {
    await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: TextConfig().TextConfig1(
                '나의 다짐을 입력해 주세요', 20, FontWeight.w600, Colors.black),
          ),
          actionsAlignment: MainAxisAlignment.center,
          content: TextField(
            controller: myPromiseTextController,
            maxLines: 5,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: '여기에 입력해 주세요',
              labelStyle: TextStyle(fontSize: 20),
              contentPadding: EdgeInsets.all(25),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            MaterialButton(
              color: Colors.black,
              child: Text(
                '등록',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(myPromiseTextController.text);
                await myPromiseBox
                    ?.put('다짐', myPromiseTextController.text)
                    .whenComplete(
                        () => print('myPromiseBox = ${myPromiseBox?.values}'))
                    .whenComplete(() => Get.back())
                    .whenComplete(() => showInterstitialAd());
              },
            ),
          ],
        );
      },
    );
  }

  return MaterialButton(
    color: Colors.black,
    child: Text(
      '다짐 등록',
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      myPromiseTextController.clear();
      _myPromisePage();
    },
  );
}
