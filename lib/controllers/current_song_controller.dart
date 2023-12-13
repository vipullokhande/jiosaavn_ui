import 'package:get/get.dart';

class CurrentSongController extends GetxController {
  bool isPlay = false;
  int index = 0;
  // bool isPause = false;
  // bool isRepeat = false;

  //
  changeIsPlay(bool value) {
    isPlay = value;
    update();
  }
  //
}
