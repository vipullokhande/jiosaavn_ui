// ignore_for_file: must_be_immutable

part of 'music_bloc.dart';

class MusicState {
  final List<Reference> songs;
  final Reference? currentSong;
  final bool isPlaying;
  final bool isLoading;

  MusicState({
    this.songs = const [],
    this.currentSong,
    this.isPlaying = false,
    this.isLoading = false,
  });

  // Helper to update specific fields without losing others
  MusicState copyWith({
    List<Reference>? songs,
    Reference? currentSong,
    bool? isPlaying,
    bool? isLoading,
  }) {
    return MusicState(
      songs: songs ?? this.songs,
      currentSong: currentSong ?? this.currentSong,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class MusicInitial extends MusicState {}
