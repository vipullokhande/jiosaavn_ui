import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/colors.dart';

class RecentlyPlayedWidget extends StatelessWidget {
  final String recentAlbumText;
  final String recentAlbumDescText;
  final VoidCallback onPressed;
  final VoidCallback onTap;
  final VoidCallback onLongPressed;
  final String recentSongImg;
  final Color recHeadColor;
  final Color recDescColor;
  const RecentlyPlayedWidget({
    super.key,
    required this.recentAlbumText,
    required this.onPressed,
    required this.onTap,
    required this.onLongPressed,
    required this.recentSongImg,
    required this.recHeadColor,
    required this.recDescColor,
    required this.recentAlbumDescText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPressed,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              width: 140,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(recentSongImg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    child: Text(
                      recentAlbumText,
                      maxLines: 2,
                      style: const TextStyle(color: whiteColor, fontSize: 10),
                    ),
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.play_circle,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              recentAlbumText,
              maxLines: 2,
              style: TextStyle(
                color: recHeadColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            // const SizedBox(
            //   height: 2,
            // ),
            Text(
              recentAlbumDescText,
              style: TextStyle(
                color: recDescColor,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
