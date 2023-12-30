import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiosaavn_vip/ui/favourite_screen.dart';

import '../colors.dart';
import '../controllers/current_song_controller.dart';

class SongPlayer extends StatefulWidget {
  final List<String> img;
  final List<String> song;
  final AudioPlayer audioPlayer;
  const SongPlayer({
    super.key,
    required this.img,
    required this.song,
    required this.audioPlayer,
  });

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  int index = 0;
  var c = Get.find<CurrentSongController>();
  setPlayer(int currIndex) {
    setState(() {
      c.isPlay = true;
      widget.audioPlayer.onDurationChanged.listen((event) {
        setState(() {
          c.duration = event;
        });
      });
      widget.audioPlayer.onPositionChanged.listen((event) {
        setState(() {
          c.position = event;
        });
      });
      widget.audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          widget.audioPlayer.seek(Duration.zero);
        });
      });
      AssetSource main = AssetSource(widget.song[currIndex]);
      widget.audioPlayer.setSource(main);
      widget.audioPlayer.play(main);
    });
  }

  late PageController pageController1 = PageController();
  late PageController pageController2 = PageController();
  @override
  void initState() {
    super.initState();
    pageController1 = PageController(
      initialPage: c.index,
      viewportFraction: 0.8,
    );
    pageController2 = PageController(
      initialPage: c.index,
    );
    setPlayer(c.index);
    index = c.index;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        setState(() {
          c.songTitle = widget.song[index];
          c.songImgPath = widget.img[index];
          c.index = index;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(FavouriteScreen(
                  audioPlayer: widget.audioPlayer,
                ));
              },
              icon: const Icon(
                Icons.favorite_border,
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
              GetBuilder<CurrentSongController>(
                builder: (cSC) => SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                  child: PageView.builder(
                    controller: pageController1,
                    itemCount: widget.song.length,
                    onPageChanged: (v) {
                      setState(() {
                        pageController1.jumpToPage(v);
                        pageController2.jumpToPage(v);
                        setPlayer(v);
                        index = v;
                        c.index = v;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, idex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          widget.img[idex],
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
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              SizedBox(
                height: 100,
                child: PageView.builder(
                  controller: pageController2,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.song.length,
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
                                  widget.song[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18, color: blackColor,
                                    // fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.song[index],
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
              Container(
                height: size.height * 0.075,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.img[index],
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: SizedBox.expand(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Video Available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          fixedSize: Size(size.width * 0.38, 40),
                          backgroundColor: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.videocam_rounded,
                          color: Colors.cyan,
                        ),
                        label: const Text(
                          'Switch to Video',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GetBuilder<CurrentSongController>(
                builder: (csc) => SizedBox(
                  height: 3,
                  child: Slider(
                    min: 0,
                    max: csc.duration.inSeconds.toDouble(),
                    value: csc.position.inSeconds.toDouble(),
                    label:
                        '${csc.position.toString().split('.')[0].split(':')[1]} : ${csc.position.toString().split('.')[0].split(':')[2]}',
                    activeColor: Colors.pink.shade600,
                    thumbColor: Colors.pink.shade500,
                    inactiveColor: Colors.pink.shade200,
                    onChanged: (v) {
                      setState(() {
                        widget.audioPlayer.seek(Duration(seconds: v.toInt()));
                      });
                    },
                  ),
                ),
              ),
              GetBuilder<CurrentSongController>(
                builder: (csc) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${csc.position.toString().split('.')[0].split(':')[1]}:${csc.position.toString().split('.')[0].split(':')[2]}',
                      ),
                      Text(
                        '${csc.duration.toString().split('.')[0].split(':')[1]}:${csc.duration.toString().split('.')[0].split(':')[2]}',
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetBuilder<CurrentSongController>(
                    builder: (con) => IconButton(
                      onPressed: () {
                        if (!con.favList.contains(widget.song[index])) {
                          con.addToFavourite(
                            widget.song[index],
                            context,
                          );
                        } else {
                          con.removeFromFavourite(
                            widget.song[index],
                            context,
                          );
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        con.favList.contains(
                          widget.song[index],
                        )
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 35,
                        color: con.favList.contains(widget.song[index])
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (index <= 0) {
                          return;
                        }
                        index -= 1;
                        c.index = index;
                        pageController1.jumpToPage(index);
                        pageController2.jumpToPage(index);
                        widget.audioPlayer.stop().then((value) {
                          widget.audioPlayer
                              .play(AssetSource(widget.song[index]));
                        });
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                    ),
                  ),
                  GetBuilder<CurrentSongController>(
                    builder: (cSC) => IconButton(
                      onPressed: () {
                        setState(() {
                          if (cSC.isPlay) {
                            cSC.isPlay = false;
                            widget.audioPlayer.pause();
                          } else {
                            cSC.isPlay = true;
                            widget.audioPlayer.resume();
                          }
                        });
                      },
                      icon: Icon(
                        cSC.isPlay
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                        size: 65,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (index == widget.song.length - 1) {
                          return;
                        }
                        index += 1;
                        c.index = index;
                        pageController1.jumpToPage(index);
                        pageController2.jumpToPage(index);
                        widget.audioPlayer.stop().then((value) {
                          widget.audioPlayer
                              .play(AssetSource(widget.song[index]));
                        });
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        builder: (context) => Container(
                          alignment: Alignment.topCenter,
                          height: size.height * 0.7,
                          width: double.maxFinite,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                height: size.height * 0.1,
                                width: size.width * 0.95,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.network(
                                      widget.img[index],
                                      height: size.height * 0.1,
                                      width: size.width * 0.2,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.song[index],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            widget.song[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(
                                                  255, 74, 74, 74),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.play_circle_filled_outlined,
                                      color: Colors.teal,
                                      size: 50,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  foregroundColor: Colors.white,
                                  fixedSize: Size(size.width * 0.9, 50),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Set JioTune',
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
