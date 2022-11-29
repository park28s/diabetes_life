import 'package:diabetes_life/main_config/main_colors.dart';
import 'package:diabetes_life/main_config/main_size.dart';
import 'package:diabetes_life/main_config/main_snackbar.dart';
import 'package:diabetes_life/main_config/main_widget.dart';
import 'package:diabetes_life/main_config/text_config.dart';
import 'package:diabetes_life/main_home/main_widget.dart';
import 'package:diabetes_life/pages/controller/today_health_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

TextEditingController healthListTextEditing = TextEditingController();
GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
int healthListLength = 0;

Widget healthListContainer() {
  return ValueListenableBuilder(
      valueListenable: Hive.box<dynamic>('healthListBox').listenable(),
      builder: (BuildContext context, dynamic value, Widget? child) {
        final _name = value.toMap().keys;
        List<Color> colorList = [];
        void _colorCheck() {
          for (int a = 0; a < value.length; a++)
            if (value.values.elementAt(a) == 'pinkAccent')
              colorList.add(HealthListColors().pinkAccent);
            else if (value.values.elementAt(a) == 'blueGrey')
              colorList.add(HealthListColors().blueGrey);
            else if (value.values.elementAt(a) == 'orange')
              colorList.add(HealthListColors().orange);
            else if (value.values.elementAt(a) == 'blueAccent')
              colorList.add(HealthListColors().blueAccent);
            else if (value.values.elementAt(a) == 'brown')
              colorList.add(HealthListColors().brown);
            else if (value.values.elementAt(a) == 'indigoAccent')
              colorList.add(HealthListColors().indigoAccent);
            else if (value.values.elementAt(a) == 'red')
              colorList.add(HealthListColors().red);
            else if (value.values.elementAt(a) == 'amber')
              colorList.add(HealthListColors().amber);
            else if (value.values.elementAt(a) == 'deepPurple')
              colorList.add(HealthListColors().deepPurple);
            else if (value.values.elementAt(a) == 'black')
              colorList.add(HealthListColors().black);
        }

        void _popup(context, int index) {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(child: Text('삭제 하시겠습니까?')),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  MaterialButton(
                      color: Colors.deepPurpleAccent,
                      elevation: 5,
                      child: TextConfig().TextConfig2(
                          '삭 제', 15, FontWeight.w500, Colors.white),
                      onPressed: () {
                        Hive.box<dynamic>('healthListBox').deleteAt(index);
                        colorList.removeAt(index);
                        Get.back();
                      }),
                  SizedBox(width: 10),
                  MaterialButton(
                      color: Colors.deepPurpleAccent,
                      elevation: 5,
                      child: TextConfig().TextConfig2(
                          '취 소', 15, FontWeight.w500, Colors.white),
                      onPressed: () => Get.back())
                ],
              );
            },
          );
        }

        return Container(
          width: mainWidthSize - 10,
          height: mainHeightSize / 3.5,
          child: GridView.builder(
            itemCount: value.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            itemBuilder: (BuildContext context, int index) {
              _colorCheck();
              print('colorList = ${colorList.length}');
              return InkWell(
                onTap: () {
                  _popup(context, index);
                },
                child: healthContainer(65, 20, Color(colorList[index].value),
                    _name.elementAt(index)),
              );
            },
          ),
        );
      });
}

Widget healthInputForm() {
  return Container(
      width: 310,
      child: Container(
          width: mainWidthSize - 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 1))
              ]),
          child: Form(
            key: formKey4,
            child: TextFormField(
              controller: healthListTextEditing,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              textAlign: TextAlign.center,
              validator: (v) {
                if (v!.isEmpty) {
                  print(v.toString());
                  return '';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: '운동명을 적어주세요',
                  contentPadding: EdgeInsets.all(5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      borderSide: BorderSide(color: Colors.grey, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      borderSide: BorderSide(color: Colors.grey, width: 0))),
            ),
          )));
}

Widget healthInputButton() {
  return MaterialButton(
      color: Colors.deepPurpleAccent,
      elevation: 5,
      child: TextConfig().TextConfig2('등 록', 15, FontWeight.w500, Colors.white),
      onPressed: () {
        if (formKey4.currentState!.validate()) {
          print(healthListTextEditing.text);
          healthListGet();
          print(TodayHealthController.to.healthSelect);
          Hive.box<dynamic>('healthListBox').put(healthListTextEditing.text,
              '${TodayHealthController.to.healthSelect.toString()}');
          print(Hive.box<dynamic>('healthListBox').toMap());
          textFormClear();
        } else
          return getSnackBar('입력이 잘못됐어요!', '운동명을 입력하시고 등록을 눌러 주세요');
      });
}

void healthListGet() async {
  healthListLength = await Hive.box<dynamic>('healthListBox').keys.length;

  print('healthListLength = ${healthListLength}');
}

Widget healthListColor() {
  return Container(
    width: mainWidthSize - 10,
    height: 40,
    child: LayoutBuilder(
        builder: (BuildContext context, size) => Obx(
              () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    colorSelect(
                        'pinkAccent',
                        HealthListColors().pinkAccent,
                        size.maxWidth / 10 + 5,
                        size.maxHeight,
                        size.maxWidth / 10,
                        size.maxHeight - 5),
                    colorSelect(
                        'blueGrey',
                        HealthListColors().blueGrey,
                        size.maxWidth / 10 + 5,
                        size.maxHeight,
                        size.maxWidth / 10,
                        size.maxHeight - 5),
                    colorSelect(
                        'orange',
                        HealthListColors().orange,
                        size.maxWidth / 10 + 5,
                        size.maxHeight,
                        size.maxWidth / 10,
                        size.maxHeight - 5),
                    colorSelect(
                        'indigoAccent',
                        HealthListColors().indigoAccent,
                        size.maxWidth / 10 + 5,
                        size.maxHeight,
                        size.maxWidth / 10,
                        size.maxHeight - 5),
                    colorSelect(
                        'brown',
                        HealthListColors().brown,
                        size.maxWidth / 10 + 5,
                        size.maxHeight,
                        size.maxWidth / 10,
                        size.maxHeight - 5),
                  ]),
            )),
  );
}

Widget healthListColor2() {
  return Container(
    width: mainWidthSize - 10,
    height: 40,
    child: LayoutBuilder(
        builder: (BuildContext context, size) => Obx(() =>
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              colorSelect(
                  'blueAccent',
                  HealthListColors().blueAccent,
                  size.maxWidth / 10 + 5,
                  size.maxHeight,
                  size.maxWidth / 10,
                  size.maxHeight - 5),
              colorSelect('red', HealthListColors().red, size.maxWidth / 10 + 5,
                  size.maxHeight, size.maxWidth / 10, size.maxHeight - 5),
              colorSelect(
                  'amber',
                  HealthListColors().amber,
                  size.maxWidth / 10 + 5,
                  size.maxHeight,
                  size.maxWidth / 10,
                  size.maxHeight - 5),
              colorSelect(
                  'deepPurple',
                  HealthListColors().deepPurple,
                  size.maxWidth / 10 + 5,
                  size.maxHeight,
                  size.maxWidth / 10,
                  size.maxHeight - 5),
              colorSelect(
                  'black',
                  HealthListColors().black,
                  size.maxWidth / 10 + 5,
                  size.maxHeight,
                  size.maxWidth / 10,
                  size.maxHeight - 5),
            ]))),
  );
}

Widget colorSelect(String colorName, Color color, double width, double height,
    double width2, double height2) {
  final controller = Get.put(TodayHealthController());
  return InkWell(
      onTap: () => controller.healthSelect.value = '${colorName}',
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height,
            color: controller.healthSelect.value != '${colorName}'
                ? Colors.white
                : Colors.tealAccent,
          ),
          Container(
            width: width2,
            height: height2,
            color: color,
          ),
        ],
      ));
}
