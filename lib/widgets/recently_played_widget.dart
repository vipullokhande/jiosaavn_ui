import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/colors.dart';

// ignore: must_be_immutable
class RecentlyPlayedWidget extends StatefulWidget {
  late String recentAlbumText;
  late String recentAlbumDescText;
  late VoidCallback onPressed;
  late VoidCallback onTap;
  late VoidCallback onLongPressed;
  late String recentSongImg;
  late Color recHeadColor;
  late Color recDescColor;
  late Widget widgett;
  // bool? isPlayed;
  RecentlyPlayedWidget({
    super.key,
    required this.recentAlbumText,
    required this.onPressed,
    required this.onTap,
    required this.onLongPressed,
    required this.recentSongImg,
    required this.recHeadColor,
    required this.recDescColor,
    required this.recentAlbumDescText,
    required this.widgett,
    
  });
  // RecentlyPlayedWidget.fromEmpty({
  //   super.key,
  //   required this.isPlayed,
  // });

  @override
  State<RecentlyPlayedWidget> createState() => _RecentlyPlayedWidgetState();
}

class _RecentlyPlayedWidgetState extends State<RecentlyPlayedWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPressed,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Container(
                width: 140,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(widget.recentSongImg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.22,
                        child: Text(
                          widget.recentAlbumText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(color: whiteColor, fontSize: 10),
                        ),
                      ),
                    ),
                    widget.widgett,
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                widget.recentAlbumText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: widget.recHeadColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // const SizedBox(
              //   height: 2,
              // ),
              Text(
                widget.recentAlbumDescText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: widget.recDescColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
