import 'package:get/get.dart';

class CurrentSongController extends GetxController {
  bool isPlay = false;
  int index = 0;
  String songTitle = '01  Zara Sa - www.downloadming.com.mp3';
  String songImgPath =
      'https://i1.sndcdn.com/artworks-000497442375-r9olt2-t500x500.jpg';
  changePathAndTitle({required String sIP, required String sT}) {
    songImgPath = sIP;
    songTitle = sT;
    update();
  }

  // ignore: prefer_const_constructors
  Duration duration =  Duration();
  // ignore: prefer_const_constructors
  Duration position =  Duration();
  changePosition( Duration pos) {
    position = pos;
    update();
  }
  changeDuration( Duration dur) {
    duration = dur;
    update();
  }

  List<bool> categories = [false, false];
  // bool isPause = false;
  // bool isRepeat = false;

  //
  changeIsPlay(bool value) {
    isPlay = value;
    update();
  }
  //
}
