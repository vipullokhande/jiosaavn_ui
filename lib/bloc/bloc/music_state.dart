// ignore_for_file: must_be_immutable

part of 'music_bloc.dart';

abstract class MusicState extends Equatable {
  int? currIndex;
  int? index;
  MusicState(
    this.currIndex,
    this.index,
  );
  @override
  List<Object?> get props => [currIndex, index];
}

class MusicInitial extends MusicState {
  MusicInitial(super.currIndex, super.index);
}

class MusicPlayerLoading extends MusicState {
  MusicPlayerLoading(super.currIndex, super.index);
}

class MusicPlayerLoaded extends MusicState {
  MusicPlayerLoaded(super.currIndex, super.index);
}

class MusicPlayerPause extends MusicState {
  MusicPlayerPause(super.currIndex, super.index);
}

class MusicPlayerResume extends MusicState {
  MusicPlayerResume(super.currentIndex, super.index);
}
