import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jiosaavn_vip/controllers/song_controller.dart';
import 'music_event.dart';

part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc() : super(MusicInitial()) {
    on<LoadSongsHindi>(_loadSongsHindi);

    // on<LoadSongsEnglish>(_loadSongsEnglish());

    on<PlayRequested>(_playRequested);

    on<TogglePlayPause>(_togglePlayPause);
  }

  _loadSongsHindi(LoadSongsHindi event, Emitter<MusicState> emit) async {
    emit(state.copyWith(isLoading: true));
    final data = await SongController().fetchSongs("hindi_songs/");
    print(state.songs.length);
    emit(state.copyWith(songs: data, isLoading: false));
  }

  _playRequested(PlayRequested event, Emitter<MusicState> emit) async {
    String url = '';
    try {
      url = await event.song.getDownloadURL();
    } on Exception catch (e) {
      print(e.toString());
    }
    await SongController().playSong(url);
    emit(state.copyWith(currentSong: event.song, isPlaying: true));
  }

  _togglePlayPause(TogglePlayPause event, Emitter<MusicState> emit) async {
    if (state.isPlaying) {
      await SongController().pauseSong();
      emit(state.copyWith(isPlaying: false));
    } else {
      await SongController().pauseSong();
      emit(state.copyWith(isPlaying: true));
    }
  }
}
