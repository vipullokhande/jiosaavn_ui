import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiosaavn_vip/data/song_data.dart';
import 'colors.dart';
import 'riverpod/riverpod_logic/music_riverpod.dart';
import 'widgets/recently_played_widget.dart';

class RiverPodPlayerScreen extends ConsumerStatefulWidget {
  const RiverPodPlayerScreen({super.key});

  @override
  ConsumerState<RiverPodPlayerScreen> createState() =>
      _RiverPodPlayerScreenState();
}

class _RiverPodPlayerScreenState extends ConsumerState<RiverPodPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final musicProviderWatch = ref.watch(musicRiverPodProvider);
    final musicRiverpodProvider = ref.watch(musicRiverPodProvider.notifier);
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12)
                    .copyWith(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                      child: Text(
                        'Hindi Songs',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hindiSongs.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) => RecentlyPlayedWidget(
                          recentAlbumText: hindiSongs[index],
                          onPressed: () {},
                          onTap: () {},
                          onLongPressed: () {},
                          recentSongImg: hindiSongsImgUrls[index],
                          recHeadColor: blackColor,
                          recDescColor: recdescColor,
                          recentAlbumDescText: hindiSongs[index],
                          widgett: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              await musicRiverpodProvider.playSong(
                                currentIndex: index,
                                categoryIndex: 0,
                              );
                            },
                            icon: const Icon(
                              Icons.play_circle_fill,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12)
                    .copyWith(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                      child: Text(
                        'English Songs',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: englishSongs.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) => RecentlyPlayedWidget(
                          recentAlbumText: englishSongs[index],
                          onPressed: () {},
                          onTap: () {},
                          onLongPressed: () {},
                          recentSongImg: englishSongsImgUrls[index],
                          recHeadColor: blackColor,
                          recDescColor: recdescColor,
                          recentAlbumDescText: englishSongs[index],
                          widgett: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              await musicRiverpodProvider.playSong(
                                currentIndex: index,
                                categoryIndex: 1,
                              );
                            },
                            icon: const Icon(
                              Icons.play_circle_fill,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: size.height * 0.065,
                width: size.width,
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          musicProviderWatch['songImg'],
                          height: double.maxFinite,
                          fit: BoxFit.cover,
                          width: size.width * 0.15,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: size.width * 0.65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                musicProviderWatch['songName'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                musicProviderWatch['songName'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () async {
                            await musicRiverpodProvider.pauseSong(
                              categoryIndex: musicProviderWatch['c'] as int,
                              currentIndex: musicProviderWatch['c'] as int == 0
                                  ? hindiSongs
                                      .indexOf(musicProviderWatch['songName'])
                                  : englishSongs
                                      .indexOf(musicProviderWatch['songName']),
                            );
                          },
                          icon: Icon(
                            musicProviderWatch['state'] == 'play'
                                ? Icons.pause_circle_filled_rounded
                                : Icons.play_circle_fill,
                            size: 40,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
