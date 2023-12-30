import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiosaavn_vip/controllers/current_song_controller.dart';

class FavouriteScreen extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const FavouriteScreen({
    super.key,
    required this.audioPlayer,
  });

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        //widget.audioPlayer.pause();
      },
      child: Scaffold(
        appBar: AppBar(
          title: GetBuilder<CurrentSongController>(
            builder: (c) =>
                Text('Total favourite songs ${c.favList.length.toString()}'),
          ),
        ),
        body: GetBuilder<CurrentSongController>(
          builder: (c) => SizedBox(
            height: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: c.favList.length,
              itemBuilder: (context, index) => ListTile(
                // onTap: () => Get.to(SongPlayer(
                //   audioPlayer: widget.audioPlayer,
                //   img: [],
                //   song: c.favList,
                // )),
                title: Text(c.favList[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
