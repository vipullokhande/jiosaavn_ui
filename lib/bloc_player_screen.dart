import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'bloc/music_bloc/music_bloc.dart';
import 'bloc/music_bloc/music_event.dart';
import 'colors.dart';
import 'data/song_data.dart';
import 'widgets/recently_played_widget.dart';

AudioPlayer audioPlayer = AudioPlayer();

class BlocPlayerScreen extends StatefulWidget {
  const BlocPlayerScreen({super.key});

  @override
  State<BlocPlayerScreen> createState() => _BlocPlayerScreenState();
}

class _BlocPlayerScreenState extends State<BlocPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MusicBloc, MusicState>(
      bloc: MusicBloc(),
      listener: (context, state) {
        if (state is MusicPlayerLoading ||
            state is MusicPlayerLoaded ||
            state is MusicPlayButtonClickedEvent) {}
      },
      listenWhen: (previous, current) {
        if (current is MusicPlayerLoaded ||
            current is MusicPlayerLoading ||
            current is MusicPlayButtonClickedEvent) {
          return true;
        } else {
          return false;
        }
      },
      buildWhen: (previous, current) {
        if (current is MusicPlayerLoaded ||
            current is MusicPlayerLoading ||
            current is MusicPlayButtonClickedEvent ||
            current is MusicPauseButtonClickedEvent) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, musicState) {
        var state = context.watch<MusicBloc>().state;
        if (musicState is MusicPlayerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            body: ListView(
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
                            isBorder:
                                state.index == 0 && state.currIndex == index,
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
                              onPressed: () {
                                context.read<MusicBloc>().add(
                                      MusicPlayButtonClickedEvent(
                                        index,
                                        0,
                                      ),
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
                              fontWeight: FontWeight.w700),
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
                            isBorder:
                                state.index == 1 && state.currIndex == index,
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
                              onPressed: () {
                                context.read<MusicBloc>().add(
                                      MusicPlayButtonClickedEvent(
                                        index,
                                        1,
                                      ),
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
            bottomSheet: BottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              onClosing: () {},
              enableDrag: false,
              builder: (_) {
                return GestureDetector(
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
                              state.index == 0
                                  ? hindiSongsImgUrls[state.currIndex!]
                                  : englishSongsImgUrls[state.currIndex!],
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
                                    state.index == 0
                                        ? hindiSongs[state.currIndex!]
                                        : englishSongs[state.currIndex!],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: blackColor,
                                    ),
                                  ),
                                  Text(
                                    musicState.index == 0
                                        ? hindiSongs[musicState.currIndex!]
                                        : englishSongs[musicState.currIndex!],
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
                              onPressed: () {
                                context.read<MusicBloc>().add(
                                      MusicPauseButtonClickedEvent(
                                        musicState.currIndex,
                                        musicState.index,
                                      ),
                                    );
                              },
                              icon: const Icon(
                                Icons.play_circle_fill,
                                size: 40,
                                color: blackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
