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
  late bool isBorder;
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
    required this.isBorder,
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
      child: Stack(
        children: [
          Container(
            width: 150,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: widget.isBorder
                  ? Border.all(
                      width: 2,
                      color: Colors.pink,
                    )
                  : Border.all(
                      width: 0,
                      color: Colors.transparent,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 140,
              child: Column(
                children: [
                  Container(
                    width: 140,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            widget.recentSongImg,
                            width: 140,
                            height: 120,
                            fit: BoxFit.cover,
                            // loadingBuilder: (context, child, loadingProgress) {
                            //   if (loadingProgress == null) {
                            //     return child;
                            //   }
                            //   return Image.asset(
                            //     'assets/jio_saavn.png',
                            //     width: 140,
                            //     height: 120,
                            //     fit: BoxFit.cover,
                            //   );
                            // },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 10),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  child: Text(
                                    widget.recentAlbumText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: whiteColor, fontSize: 10),
                                  ),
                                ),
                              ),
                              widget.widgett,
                            ],
                          ),
                        ),
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
        ],
      ),
    );
  }
}
