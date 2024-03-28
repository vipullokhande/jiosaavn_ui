import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiosaavn_vip/data/song_data.dart';
import '../../control_music_service/control_music_service.dart';

final musicRiverPodProvider =
    StateNotifierProvider<MusicNotifier, Map<String, dynamic>>(
  (ref) => MusicNotifier(
    {
      'songName': hindiSongs[0],
      'songImg': hindiSongsImgUrls[0],
      'state': 'pause',
      'c': 0,
    },
  ),
);

class MusicNotifier extends StateNotifier<Map<String, dynamic>> {
  MusicNotifier(super.state);
  bool isPlay = false;
  //
  Future playSong({
    required int currentIndex,
    required int categoryIndex,
  }) async {
    if (categoryIndex == 0) {
      state = {
        'songName': hindiSongs[currentIndex],
        'songImg': hindiSongsImgUrls[currentIndex],
        'state': 'play',
        'c': 0,
      };
      await ControlMusicService.instance.setPlayer(
        currentIndex,
        categoryIndex,
      );
      isPlay = true;
    } else if (categoryIndex == 1) {
      state = {
        'songName': englishSongs[currentIndex],
        'songImg': englishSongsImgUrls[currentIndex],
        'state': 'play',
        'c': 1,
      };
      await ControlMusicService.instance.setPlayer(
        currentIndex,
        categoryIndex,
      );
      isPlay = true;
    }
  }

  //
  Future pauseSong({
    required int currentIndex,
    required int categoryIndex,
  }) async {
    isPlay = !isPlay;
    if (categoryIndex == 0) {
      state = {
        'songName': hindiSongs[currentIndex],
        'songImg': hindiSongsImgUrls[currentIndex],
        'state': isPlay ? 'play' : 'pause',
        'c': 0,
      };
      await ControlMusicService.instance.pause();
    } else if (categoryIndex == 1) {
      state = {
        'songName': englishSongs[currentIndex],
        'songImg': englishSongsImgUrls[currentIndex],
        'state': isPlay ? 'play' : 'pause',
        'c': 1,
      };
      await ControlMusicService.instance.pause();
    }
  }

  //
  Future playerStop() async {
    await ControlMusicService.instance.stop();
  }
}
