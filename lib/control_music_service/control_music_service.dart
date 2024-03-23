import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/data/song_data.dart';

class ControlMusicService {
  //
  ControlMusicService._();
  //
  static ControlMusicService get instance => ControlMusicService._();
  //
  static AudioPlayer audioPlayer = AudioPlayer();
  //
  Future setPlayer(int currIndex, int idx) async {
    //
    await audioPlayer.stop();
    //
    audioPlayer.onDurationChanged.listen((event) {
      // changeDuration(event);
    });
    //
    audioPlayer.onPositionChanged.listen((event) {
      // changePosition(event);
    });
    //
    audioPlayer.onPlayerComplete.listen((event) {
      // audioPlayer.seek(Duration.zero);
    });
    //
    AssetSource? main;
    //
    if (idx == 0) {
      main = AssetSource(hindiSongs[currIndex]);
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: currIndex,
          channelKey: 'vip',
          groupKey: 'vip',
          title: hindiSongs[currIndex],
          body: hindiSongs[currIndex],
          fullScreenIntent: true,
          hideLargeIconOnExpand: true,
          bigPicture: hindiSongsImgUrls[currIndex],
          notificationLayout: NotificationLayout.BigPicture,
          backgroundColor: Colors.white,
          displayOnForeground: true,
          displayOnBackground: true,
        ),
      );
    } else if (idx == 1) {
      main = AssetSource(englishSongs[currIndex]);
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: currIndex,
          channelKey: 'vip',
          groupKey: 'vip',
          title: englishSongs[currIndex],
          body: englishSongs[currIndex],
          fullScreenIntent: true,
          hideLargeIconOnExpand: true,
          largeIcon: englishSongsImgUrls[currIndex],
          bigPicture: englishSongsImgUrls[currIndex],
          notificationLayout: NotificationLayout.BigPicture,
          backgroundColor: Colors.white,
          displayOnForeground: true,
          displayOnBackground: true,
        ),
      );
    }
    //
    await audioPlayer.setSource(main!);
    await audioPlayer.play(main);
    // ignore: avoid_print
    print('Playing song $main');
    //
  }

  //
  Future pause() async {
    await audioPlayer.pause();
  }

  //
  Future resume() async {
    await audioPlayer.resume();
  }
}
