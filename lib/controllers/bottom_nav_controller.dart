import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int index = 0;
  changeIndex(int idx) {
    index = idx;
    update();
  }
}
