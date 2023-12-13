import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiosaavn_vip/controllers/current_song_controller.dart';

// ignore: must_be_immutable
class SongScreen extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final String path;
  int index;
  SongScreen({
    super.key,
    required this.audioPlayer,
    required this.path,
    required this.index,
  });

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = true;
  bool isPaused = false;
  bool isRepeat = false;
  List<IconData> icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() {
    if (Get.find<CurrentSongController>().isPlay) {
      //
    } else {
      widget.audioPlayer.onDurationChanged.listen((event) {
        setState(() {
          duration = event;
        });
      });
      widget.audioPlayer.onPositionChanged.listen((event) {
        setState(() {
          position = event;
        });
      });
      widget.audioPlayer.setSource(AssetSource(widget.path));
      widget.audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          // duration = const Duration(seconds: 0);
          widget.audioPlayer.seek(Duration.zero);
          if (isRepeat) {
            isPlaying = true;
          } else {
            isPlaying = false;
            isRepeat = false;
          }
        });
      });
      widget.audioPlayer.play(AssetSource(widget.path));
    }
  }

  @override
  void dispose() {
    // widget.audioPlayer.stop();
    // setState(() {
    //   isPlaying = false;
    //   isPaused = false;
    //   isRepeat = false;
    // });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrentSongController>(
      builder: (con) => PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          setState(() {
            if (isPlaying) {
              Get.find<CurrentSongController>().changeIsPlay(true);
            }
          });
        },
        child: Scaffold(
          body: Container(
            color: Colors.grey,
            margin:
                const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 100),
            height: 100,
            child: Column(
              children: [
                Slider(
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey,
                  min: 0.0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (valuee) {
                    setState(() {
                      widget.audioPlayer
                          .seek(Duration(seconds: valuee.toInt()));
                    });
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (!isRepeat) {
                          widget.audioPlayer.setReleaseMode(ReleaseMode.loop);
                          setState(() {
                            isRepeat = true;
                          });
                        } else {
                          widget.audioPlayer
                              .setReleaseMode(ReleaseMode.release);
                          setState(() {
                            isRepeat = false;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.repeat_rounded,
                        color: isRepeat ? Colors.red : Colors.black,
                      ),
                    ),
                    Text(position.toString().split('.')[0]),
                    IconButton(
                      onPressed: () {
                        if (con.isPlay == false) {
                          widget.audioPlayer.play(AssetSource(widget.path));
                          setState(() {
                            con.isPlay = true;
                            con.index = widget.index;
                          });
                        } else {
                          widget.audioPlayer.pause();
                          setState(() {
                            con.isPlay = false;
                            con.index = widget.index;
                          });
                        }
                      },
                      icon: Icon(con.index == widget.index && con.isPlay
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill),
                    ),
                    Text(duration.toString().split('.')[0]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
