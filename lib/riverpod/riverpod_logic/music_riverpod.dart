import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiosaavn_vip/data/song_data.dart';
import 'package:jiosaavn_vip/riverpod/riverpod_logic/models/riverpod_song_model.dart';
import '../../control_music_service/control_music_service.dart';

//
final musicRiverPodProvider =
    StateNotifierProvider<MusicNotifier, Map<String, dynamic>>(
  (ref) => MusicNotifier(
    {
      'songName': hindiSongs[0],
      'songImg': hindiSongsImgUrls[0],
      'state': 'null',
      'c': 0,
    },
  ),
);

//
final favouriteSongsRiverPodProvider =
    StateNotifierProvider<FavouriteSongsNotifier, List>(
  (ref) => FavouriteSongsNotifier(),
);

//
class MusicNotifier extends StateNotifier<Map<String, dynamic>> {
  MusicNotifier(super.state);
  //
  Future playSong({
    required int currentIndex,
    required int categoryIndex,
  }) async {
    if (categoryIndex == 0) {
      state = {
        'songName': hindiSongs[currentIndex],
        'songImg': hindiSongsImgUrls[currentIndex],
        'state': 'resume',
        'c': 0,
      };
      await ControlMusicService.instance.setPlayer(
        currentIndex,
        categoryIndex,
        false,
      );
    } else if (categoryIndex == 1) {
      state = {
        'songName': englishSongs[currentIndex],
        'songImg': englishSongsImgUrls[currentIndex],
        'state': 'resume',
        'c': 1,
      };
      await ControlMusicService.instance.setPlayer(
        currentIndex,
        categoryIndex,
        false,
      );
    }
  }

  //
  Future pauseSong({
    required int currentIndex,
    required int categoryIndex,
  }) async {
    if (state['state'] == 'null') {
      await playSong(currentIndex: currentIndex, categoryIndex: categoryIndex);
      return;
    } else {
      if (state['state'] == 'resume') {
        if (categoryIndex == 0) {
          state = {
            'songName': hindiSongs[currentIndex],
            'songImg': hindiSongsImgUrls[currentIndex],
            'state': 'pause',
            'c': 0,
          };
          await ControlMusicService.instance.pauseR();
        } else if (categoryIndex == 1) {
          state = {
            'songName': englishSongs[currentIndex],
            'songImg': englishSongsImgUrls[currentIndex],
            'state': 'pause',
            'c': 1,
          };
          await ControlMusicService.instance.pauseR();
        }
      } else {
        if (categoryIndex == 0) {
          state = {
            'songName': hindiSongs[currentIndex],
            'songImg': hindiSongsImgUrls[currentIndex],
            'state': 'resume',
            'c': 0,
          };
          await ControlMusicService.instance.resume();
        } else if (categoryIndex == 1) {
          state = {
            'songName': englishSongs[currentIndex],
            'songImg': englishSongsImgUrls[currentIndex],
            'state': 'resume',
            'c': 1,
          };
          await ControlMusicService.instance.resume();
        }
      }
    }
  }

  //
  Future playerStop() async {
    await ControlMusicService.instance.stop();
  }
}

//
class FavouriteSongsNotifier extends StateNotifier<List<RiverpodSongModel>> {
  FavouriteSongsNotifier() : super(<RiverpodSongModel>[]);

  addToFavouriteSongs(RiverpodSongModel riverpodSongModel) {
    if (state.contains(riverpodSongModel) == false) {
      state = [riverpodSongModel, ...state];
    } else {
      state.removeWhere((element) => element.title == riverpodSongModel.title);
      state = state;
    }
  }
}
