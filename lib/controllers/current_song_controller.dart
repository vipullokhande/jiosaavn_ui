import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongModel {
  String title;
  String path;
  SongModel({
    required this.title,
    required this.path,
  });
}

class CurrentSongController extends GetxController {
  bool isPlay = false;
  int index = 0;
  List<String> favList = [];
  int categoryy = 0;
  late AudioPlayer audioPlayerr;
  @override
  void onInit() async {
    super.onInit();
    songTitle = getSong();
    songImgPath = getImg();
    categoryy = getCategory();
    audioPlayerr = AudioPlayer();
  }

  changePlayer(AudioPlayer audioPlayer) {
    audioPlayerr = audioPlayer;
    update();
  }

  addToFavourite(String title, BuildContext context) {
    favList.add(title);
    update();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade100,
        content: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 22,
                ),
              ),
              const TextSpan(
                text: ' is added into Favorite list',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  removeFromFavourite(String title, BuildContext context) {
    favList.remove(title);
    update();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade100,
        content: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                ),
              ),
              const TextSpan(
                text: ' is removed from favourite list',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getCategory() async {
    final sf = await SharedPreferences.getInstance();
    return sf.getInt('category');
  }

  getSong() async {
    final sf = await SharedPreferences.getInstance();
    return sf.getString('song');
  }

  getImg() async {
    final sf = await SharedPreferences.getInstance();
    return sf.getString('img');
  }

  String songTitle = 'Apna-Bana-Le(PagalWorld).mp3';
  String songImgPath = 'https://i.ytimg.com/vi/FqchmlJbINs/maxresdefault.jpg';
  changePathAndTitleAndCategory(
      {required String sIP, required String sT, required int category}) {
    // songImgPath = sIP;
    songTitle = sT;
    // songTitle = sT;
    songImgPath = sIP;
    for (var i = 0; i < categories.length; i++) {
      if (i == category) {
        categories[i] = true;
      } else {
        categories[i] = false;
      }
    }
    categoryy = category;
    update();
  }

  // ignore: prefer_const_constructors
  Duration duration = Duration();
  // ignore: prefer_const_constructors
  Duration position = Duration();
  changePosition(Duration pos) {
    position = pos;
    update();
  }

  changeDuration(Duration dur) {
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
