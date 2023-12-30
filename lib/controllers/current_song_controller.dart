import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  String songTitle = '01  Zara Sa - www.downloadming.com.mp3';
  String songImgPath =
      'https://i1.sndcdn.com/artworks-000497442375-r9olt2-t500x500.jpg';
  changePathAndTitle({required String sIP, required String sT}) {
    // songImgPath = sIP;
    // songTitle = sT;
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
