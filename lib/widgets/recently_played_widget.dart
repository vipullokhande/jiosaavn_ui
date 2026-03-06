import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            width: 150.w,
            margin: EdgeInsets.only(right: 5.w),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
              border: widget.isBorder
                  ? Border.all(
                      width: 2.w,
                      color: Colors.pink,
                    )
                  : Border.all(
                      width: 0.w,
                      color: Colors.transparent,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0.w),
            child: SizedBox(
              width: 140.w,
              child: Column(
                children: [
                  Container(
                    width: 140.w,
                    height: 120.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Stack(
                      children: [
                        // ClipRRect(
                        //   clipBehavior: Clip.antiAlias,
                        //   borderRadius: BorderRadius.circular(12),
                        //   child: Image.network(
                        //     widget.recentSongImg,
                        //     width: 140,
                        //     height: 120,
                        //     fit: BoxFit.cover,
                        //     loadingBuilder: (context, child, loadingProgress) {
                        //       if (loadingProgress == null) {
                        //         return child;
                        //       }
                        //       return Image.asset(
                        //         'assets/jio_saavn.png',
                        //         width: 140,
                        //         height: 120,
                        //         fit: BoxFit.cover,
                        //       );
                        //     },
                        //   ),
                        // ),
                        ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(12.r),
                          child: CachedNetworkImage(
                            imageUrl: widget.recentSongImg,
                            fit: BoxFit.cover,
                            width: 140.w,
                            height: 120.h,
                            placeholder: (context, url) {
                              return Image.asset(
                                'assets/jio_saavn.png',
                                width: 140.w,
                                height: 120.h,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 10.h,
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.22.w,
                                  child: Text(
                                    widget.recentAlbumText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 10.sp,
                                    ),
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
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    widget.recentAlbumText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: widget.recHeadColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Text(
                  //   widget.recentAlbumDescText,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //     color: widget.recDescColor,
                  //     fontSize: 12.sp,
                  //     fontWeight: FontWeight.w300,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
