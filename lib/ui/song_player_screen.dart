import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiosaavn_vip/colors.dart';
import 'package:jiosaavn_vip/controllers/current_song_controller.dart';

// ignore: must_be_immutable
class SongPlayerScreen extends StatefulWidget {
  final String imgUrl;
  final AudioPlayer audioPlayer;
  final int count;
  final int curr;
  final List<String> songNames;
  final List<String> songsImgUrls;
  const SongPlayerScreen({
    super.key,
    required this.audioPlayer,
    required this.imgUrl,
    required this.count,
    required this.curr,
    required this.songNames,
    required this.songsImgUrls,
  });

  @override
  State<SongPlayerScreen> createState() => _SongPlayerScreenState();
}

class _SongPlayerScreenState extends State<SongPlayerScreen> {
  // late CarouselController carouselController;
  late PageController pageController;
  late PageController pageController2;
  Duration duration = const Duration();
  Duration position = const Duration();
  final CurrentSongController _currentSongController =
      Get.find<CurrentSongController>();
  @override
  void initState() {
    super.initState();
    // carouselController = CarouselController();
    checkPlay();
    pageController = PageController(
      initialPage: widget.curr,
    );
    pageController2 = PageController(
      viewportFraction: 0.75,
      initialPage: widget.curr,
    );
    duration = _currentSongController.duration;
    position = _currentSongController.position;
    setPlayer(widget.curr);
  }

  @override
  void dispose() {
    pageController.dispose();
    pageController2.dispose();
    super.dispose();
  }

  checkPlay() {
    if (_currentSongController.isPlay) {
      setState(() {
        isPlaying = true;
        position = _currentSongController.position;
        duration = _currentSongController.duration;
      });
    }
  }

  setPlayer(int currIndex) {
    setState(() {
      isPlaying = true;
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
      widget.audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          // duration = const Duration(seconds: 0);
          widget.audioPlayer.seek(Duration.zero);
          // if (isRepeat) {
          //   isPlaying = true;
          // } else {
          //   isPlaying = false;
          //   isRepeat = false;
          // }
        });
      });
      widget.audioPlayer.setSource(AssetSource(widget.songNames[currIndex]));
      widget.audioPlayer.play(AssetSource(widget.songNames[currIndex]));
    });
  }

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    int index = widget.curr;
    var size = MediaQuery.of(context).size;
    isPlayingg() {
      if (isPlaying) {
        _currentSongController.duration = duration;
        _currentSongController.position = position;
        _currentSongController.index = index;
        _currentSongController.isPlay = true;
        _currentSongController.songTitle = widget.songNames[index];
        _currentSongController.changePathAndTitleAndCategory(
            sIP: widget.songsImgUrls[index],
            sT: widget.songNames[index],
            category: _currentSongController.categoryy);
        _currentSongController.songImgPath = widget.songsImgUrls[index];
        return;
      }
    }

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        isPlayingg();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              isPlayingg();
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              SizedBox(
                height: size.height * 0.4,
                width: size.width,
                child: PageView.builder(
                  controller: pageController2,
                  itemCount: widget.songsImgUrls.length,
                  onPageChanged: (v) {
                    setState(() {
                      index = v;
                      pageController2.jumpToPage(v);
                      pageController.jumpToPage(v);
                      isPlaying = true;
                      widget.audioPlayer.stop().then((value) {
                        setState(() {
                          widget.audioPlayer.play(
                            AssetSource(
                              widget.songNames[v],
                            ),
                          );
                        });
                      });
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, idex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        widget.songsImgUrls[idex],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                //     CarouselSlider.builder(
                //   itemCount: widget.songsImgUrls.length,
                //   carouselController: carouselController,
                //   itemBuilder: (_, idx, realIndex) {
                //     return Image.network(
                //       widget.songsImgUrls[idx],
                //       fit: BoxFit.cover,
                //     );
                //   },
                //   options: CarouselOptions(
                //     viewportFraction: 0.65,
                //     aspectRatio: 0.9,
                //     scrollDirection: Axis.horizontal,
                //     onPageChanged: (idx, reason) {
                //       setState(() {
                //         index = idx;
                //         pageController.jumpToPage(index);
                //       });
                //     },
                //   ),
                // ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              SizedBox(
                height: 100,
                child: PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.songsImgUrls.length,
                  itemBuilder: (context, index) => SizedBox(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.75,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.songNames[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18, color: blackColor,
                                    // fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.songNames[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    // fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.more_vert_rounded,
                              size: 35,
                              color: blackColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                label:
                    '${_currentSongController.position.toString().split('.')[0].split(':')[1]} : ${_currentSongController.position.toString().split('.')[0].split(':')[2]}',
                activeColor: Colors.pink.shade600,
                thumbColor: Colors.pink.shade500,
                inactiveColor: Colors.pink.shade200,
                onChanged: (v) {
                  setState(() {
                    widget.audioPlayer.seek(Duration(seconds: v.toInt()));
                  });
                },
              ),
              GetBuilder<CurrentSongController>(
                builder: (currSongController) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currSongController.position.toString().split('.')[0],
                      ),
                      Text(
                        currSongController.duration.toString().split('.')[0],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      index -= 1;
                      if (index >= 0) {
                        setState(() {
                          // _currentSongController.index = index;
                          // _currentSongController.songTitle =
                          //     widget.songNames[index];
                          // _currentSongController.songImgPath =
                          //     widget.songNames[index];
                          pageController2.jumpToPage(index);
                          pageController.jumpToPage(index);
                          setPlayer(index);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                    ),
                  ),
                  GetBuilder<CurrentSongController>(
                    builder: (cSC) => IconButton(
                      onPressed: () {
                        // if (cSC.isPlay) {
                        //   cSC.isPlay = false;
                        //   cSC.index = index;
                        //   widget.audioPlayer.pause();
                        // }
                        setState(() {
                          if (isPlaying) {
                            isPlaying = false;
                            widget.audioPlayer.pause();
                          } else {
                            isPlaying = true;
                            setPlayer(index);
                          }
                        });
                      },
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                        size: 65,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      index += 1;
                      if (index < widget.songNames.length) {
                        setState(() {
                          // _currentSongController.index = index;
                          // _currentSongController.songTitle =
                          //     widget.songNames[index];
                          // _currentSongController.songImgPath =
                          //     widget.songNames[index];
                          pageController2.jumpToPage(index);
                          pageController.jumpToPage(index);
                          setPlayer(index);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.music_note_outlined,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
