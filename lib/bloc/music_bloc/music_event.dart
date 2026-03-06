// ignore_for_file: must_be_immutable
import 'package:firebase_storage/firebase_storage.dart';

abstract class MusicEvent {}

class LoadSongsHindi extends MusicEvent {}

class LoadSongsEnglish extends MusicEvent {}

class PlayRequested extends MusicEvent {
  final Reference song;
  PlayRequested(this.song);
}

class TogglePlayPause extends MusicEvent {}
