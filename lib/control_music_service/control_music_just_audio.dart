import 'package:jiosaavn_vip/data/song_data.dart';
import 'package:just_audio/just_audio.dart';

class ControlMusicServiceJustAudio {
  //
  ControlMusicServiceJustAudio._();
  //
  static ControlMusicServiceJustAudio get instance =>
      ControlMusicServiceJustAudio._();
  //
  static AudioPlayer audioPlayer = AudioPlayer();
  //
  Future setPlayer(int currIndex, int idx) async {
    //
    await audioPlayer.stop();
    //
    // audioPlayer.onDurationChanged.listen((event) {
    //   // changeDuration(event);
    // });
    // //
    // audioPlayer.onPositionChanged.listen((event) {
    //   // changePosition(event);
    // });
    // //
    // audioPlayer.onPlayerComplete.listen((event) {
    //   // audioPlayer.seek(Duration.zero);
    // });
    //
    final playlist = ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse(hindiSongs[idx])),
    ]);
    //
    if (idx == 0) {
      await audioPlayer.setAudioSource(playlist,
          initialIndex: 0, initialPosition: Duration.zero);
    } else if (idx == 1) {
      await audioPlayer.setAudioSource(playlist,
          initialIndex: 0, initialPosition: Duration.zero);
    }
    //
    // await audioPlayer.setSource(main!);
    await audioPlayer.play();
    //
  }

  //
  Future pause() async {
    await audioPlayer.pause();
  }
}
