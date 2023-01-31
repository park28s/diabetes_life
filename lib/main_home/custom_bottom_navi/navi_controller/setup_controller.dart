import 'package:get/get.dart';

class SetupPageController extends GetxController {
  static SetupPageController get to => Get.find();

//note: 토글 버튼 활성 여부
  RxBool isChecked1 = false.obs;
  RxBool isChecked2 = false.obs;

//note: 시간 설정 초기 변수
  RxInt selectIndex1 = 25.obs;
  RxInt selectIndex2 = 60.obs;
  RxInt selectIndex3 = 0.obs;
}
