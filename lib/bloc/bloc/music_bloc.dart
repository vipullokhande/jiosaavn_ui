// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jiosaavn_vip/control_music_service/control_music_service.dart';
import 'music_event.dart';

part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc() : super(MusicInitial(0, 0)) {
    on<MusicEvent>((event, emit) {});
    on<MusicPlayButtonClickedEvent>(_musicPlayButtonClickedEvent);
    on<MusicPauseButtonClickedEvent>(_musicPauseButtonClickedEvent);
    on<MusicResumeButtonClickedEvent>(_musicResumeButtonClickedEvent);
  }

  _musicPlayButtonClickedEvent(
    MusicPlayButtonClickedEvent event,
    Emitter<MusicState> state,
  ) async {
    emit(MusicPlayerLoading(
      event.currIndex,
      event.index,
    ));
    try {
      await ControlMusicService.instance.setPlayer(
        event.currIndex!,
        event.index!,
      );
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
    }
    emit(MusicPlayerLoaded(
      event.currIndex,
      event.index,
    ));
  }

  _musicPauseButtonClickedEvent(
    MusicPauseButtonClickedEvent event,
    Emitter<MusicState> state,
  ) async {
    await ControlMusicService.instance.pause();
  }

  _musicResumeButtonClickedEvent(
    MusicResumeButtonClickedEvent event,
    Emitter<MusicState> state,
  ) async {
    await ControlMusicService.instance.resume();
    emit(MusicPlayerLoaded(
      event.currIndex,
      event.index,
    ));
  }
}
