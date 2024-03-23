// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

abstract class MusicEvent extends Equatable {
  int? currIndex;
  int? index;
  MusicEvent(
    this.currIndex,
    this.index,
  );
  @override
  List<Object?> get props => [
        currIndex,
        index,
      ];
}

class MusicInitialEvent extends MusicEvent {
  MusicInitialEvent(
    super.currIndex,
    super.index,
  );
}

class MusicPlayButtonClickedEvent extends MusicEvent {
  MusicPlayButtonClickedEvent(
    super.currIndex,
    super.idx,
  );
}

class MusicPauseButtonClickedEvent extends MusicEvent {
  MusicPauseButtonClickedEvent(
    super.currIndex,
    super.idx,
  );
}

class MusicResumeButtonClickedEvent extends MusicEvent {
  MusicResumeButtonClickedEvent(
    super.currIndex,
    super.idx,
  );
}
