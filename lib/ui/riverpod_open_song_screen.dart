import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiosaavn_vip/colors.dart';
import 'package:jiosaavn_vip/data/song_data.dart';
import 'package:jiosaavn_vip/riverpod/riverpod_logic/models/riverpod_song_model.dart';
import 'package:jiosaavn_vip/riverpod/riverpod_logic/music_riverpod.dart';
import 'package:jiosaavn_vip/riverpod/screens/riverpod_favourite_song_screen.dart';

// ignore: must_be_immutable
class RiverPodOpenSongScreen extends ConsumerStatefulWidget {
  const RiverPodOpenSongScreen({super.key});

  @override
  ConsumerState<RiverPodOpenSongScreen> createState() =>
      _RiverPodOpenSongScreenState();
}

class _RiverPodOpenSongScreenState
    extends ConsumerState<RiverPodOpenSongScreen> {
  // late CarouselController carouselController;
  late PageController pageController;
  late PageController pageController2;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: ref.read(musicRiverPodProvider)['c'] == 0
          ? hindiSongs.indexOf(ref.read(musicRiverPodProvider)['songName'])
          : englishSongs.indexOf(ref.read(musicRiverPodProvider)['songName']),
    );
    pageController2 = PageController(
      viewportFraction: 0.75,
      initialPage: ref.read(musicRiverPodProvider)['c'] == 0
          ? hindiSongs.indexOf(ref.read(musicRiverPodProvider)['songName'])
          : englishSongs.indexOf(ref.read(musicRiverPodProvider)['songName']),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    pageController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = ref.watch(musicRiverPodProvider);
    final favouriteSongsProvider =
        ref.read(favouriteSongsRiverPodProvider.notifier);
    final musicProviderRead = ref.read(musicRiverPodProvider.notifier);
    var size = MediaQuery.of(context).size;

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RiverpodFavouriteSongScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
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
                  itemCount: musicProvider['c'] == 0
                      ? hindiSongs.length
                      : englishSongs.length,
                  onPageChanged: (v) async {
                    setState(() {
                      pageController2.jumpToPage(v);
                      pageController.jumpToPage(v);
                    });
                    await musicProviderRead.playSong(
                      currentIndex: v,
                      categoryIndex: musicProvider['c'],
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, idex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        musicProvider['c'] == 0
                            ? hindiSongsImgUrls[idex]
                            : englishSongsImgUrls[idex],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
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
                  itemCount: musicProvider['c'] == 0
                      ? hindiSongs.length
                      : englishSongs.length,
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
                                  musicProvider['c'] == 0
                                      ? hindiSongs[index]
                                      : englishSongs[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18, color: blackColor,
                                    // fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  musicProvider['c'] == 0
                                      ? hindiSongs[hindiSongs
                                          .indexOf(musicProvider['songName'])]
                                      : englishSongs[englishSongs
                                          .indexOf(musicProvider['songName'])],
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
                      musicProvider['c'] == 0
                          ? hindiSongsImgUrls[
                              hindiSongs.indexOf(musicProvider['songName'])]
                          : englishSongsImgUrls[
                              englishSongs.indexOf(musicProvider['songName'])],
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0:00:00",
                    ),
                    Text(
                      "0:00:00",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      favouriteSongsProvider.addToFavouriteSongs(
                        RiverpodSongModel(
                          title: musicProvider['songName'],
                          img: musicProvider['songImg'],
                          category: musicProvider['c'],
                          status: musicProvider['state'],
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if ((musicProvider['c'] == 0
                              ? hindiSongs.indexOf(musicProvider['songName'])
                              : englishSongs
                                  .indexOf(musicProvider['songName'])) >
                          0) {
                        await musicProviderRead.playSong(
                          currentIndex: musicProvider['c'] == 0
                              ? hindiSongs.indexOf(musicProvider['songName'])
                              : englishSongs.indexOf(musicProvider['songName']),
                          categoryIndex: musicProvider['c'],
                        );
                        pageController.jumpToPage(musicProvider['c'] == 0
                            ? hindiSongs.indexOf(musicProvider['songName']) - 1
                            : englishSongs.indexOf(musicProvider['songName']) -
                                1);
                        pageController2.jumpToPage(musicProvider['c'] == 0
                            ? hindiSongs.indexOf(musicProvider['songName']) - 1
                            : englishSongs.indexOf(musicProvider['songName']) -
                                1);
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await musicProviderRead.pauseSong(
                        categoryIndex: musicProvider['c'] as int,
                        currentIndex: musicProvider['c'] as int == 0
                            ? hindiSongs.indexOf(
                                musicProvider['songName'],
                              )
                            : englishSongs.indexOf(
                                musicProvider['songName'],
                              ),
                      );
                    },
                    icon: Icon(
                      musicProvider['state'] == 'resume'
                          ? Icons.pause_circle_filled_rounded
                          : Icons.play_circle_fill,
                      size: 65,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (musicProvider['c'] == 0
                          ? hindiSongs.indexOf(musicProvider['songName']) <
                                  hindiSongs.length - 1 ==
                              true
                          : englishSongs.indexOf(musicProvider['songName']) <
                                  englishSongs.length - 1 ==
                              true) {
                        await musicProviderRead.playSong(
                          currentIndex: musicProvider['c'] == 0
                              ? hindiSongs.indexOf(musicProvider['songName'])
                              : englishSongs.indexOf(musicProvider['songName']),
                          categoryIndex: musicProvider['c'],
                        );
                        pageController.jumpToPage(musicProvider['c'] == 0
                            ? hindiSongs.indexOf(musicProvider['songName']) + 1
                            : englishSongs.indexOf(musicProvider['songName']) +
                                1);
                        pageController2.jumpToPage(musicProvider['c'] == 0
                            ? hindiSongs.indexOf(musicProvider['songName']) + 1
                            : englishSongs.indexOf(musicProvider['songName']) +
                                1);
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
