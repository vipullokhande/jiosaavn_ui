// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:jiosaavn_vip/data/song_data.dart';
// import 'package:jiosaavn_vip/ui/riverpod_open_song_screen.dart';
// import 'colors.dart';
// import 'riverpod/riverpod_logic/music_riverpod.dart';
// import 'widgets/recently_played_widget.dart';

// class RiverPodPlayerScreen extends ConsumerStatefulWidget {
//   const RiverPodPlayerScreen({super.key});

//   @override
//   ConsumerState<RiverPodPlayerScreen> createState() =>
//       _RiverPodPlayerScreenState();
// }

// class _RiverPodPlayerScreenState extends ConsumerState<RiverPodPlayerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     final musicProviderWatch = ref.watch(musicRiverPodProvider);
//     final musicRiverpodProvider = ref.watch(musicRiverPodProvider.notifier);
//     return Scaffold(
//       body: Stack(
//         children: [
//           ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12)
//                     .copyWith(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 15.w,
//                         vertical: 7.h,
//                       ),
//                       child: Text(
//                         'Hindi Songs',
//                         style: TextStyle(
//                           color: blackColor,
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 180.h,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: hindiSongs.length,
//                         shrinkWrap: true,
//                         physics: const ClampingScrollPhysics(),
//                         itemBuilder: (context, index) => RecentlyPlayedWidget(
//                           isBorder: musicProviderWatch['c'] == 0 &&
//                               hindiSongs.indexOf(
//                                       musicProviderWatch['songName']) ==
//                                   index,
//                           recentAlbumText: hindiSongs[index],
//                           onPressed: () {},
//                           onTap: () {},
//                           onLongPressed: () {},
//                           recentSongImg: hindiSongsImgUrls[index],
//                           recHeadColor: blackColor,
//                           recDescColor: recdescColor,
//                           recentAlbumDescText: hindiSongs[index],
//                           widgett: IconButton(
//                             padding: EdgeInsets.zero,
//                             onPressed: () async {
//                               await musicRiverpodProvider.playSong(
//                                 currentIndex: index,
//                                 categoryIndex: 0,
//                               );
//                             },
//                             icon: const Icon(
//                               Icons.play_circle_fill,
//                               color: whiteColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12)
//                     .copyWith(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 15.w,
//                         vertical: 7.h,
//                       ),
//                       child: Text(
//                         'English Songs',
//                         style: TextStyle(
//                           color: blackColor,
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 180.h,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: englishSongs.length,
//                         shrinkWrap: true,
//                         physics: const ClampingScrollPhysics(),
//                         itemBuilder: (context, index) => RecentlyPlayedWidget(
//                           isBorder: musicProviderWatch['c'] == 1 &&
//                               englishSongs.indexOf(
//                                       musicProviderWatch['songName']) ==
//                                   index,
//                           recentAlbumText: englishSongs[index],
//                           onPressed: () {},
//                           onTap: () {},
//                           onLongPressed: () {},
//                           recentSongImg: englishSongsImgUrls[index],
//                           recHeadColor: blackColor,
//                           recDescColor: recdescColor,
//                           recentAlbumDescText: englishSongs[index],
//                           widgett: IconButton(
//                             padding: EdgeInsets.zero,
//                             onPressed: () async {
//                               await musicRiverpodProvider.playSong(
//                                 currentIndex: index,
//                                 categoryIndex: 1,
//                               );
//                             },
//                             icon: const Icon(
//                               Icons.play_circle_fill,
//                               color: whiteColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const RiverPodOpenSongScreen(
//                         // imgUrl: musicProviderWatch['songImg'],
//                         // count: musicProviderWatch['c'] == 0
//                         //     ? hindiSongs.length
//                         //     : englishSongs.length,
//                         // curr: musicProviderWatch['c'] == 0
//                         //     ? hindiSongsImgUrls
//                         //         .indexOf(musicProviderWatch['songImg'])
//                         //     : englishSongsImgUrls
//                         //         .indexOf(musicProviderWatch['songImg']),
//                         // songNames: musicProviderWatch['c'] == 0
//                         //     ? hindiSongs
//                         //     : englishSongs,
//                         // songsImgUrls: musicProviderWatch['c'] == 0
//                         //     ? hindiSongsImgUrls
//                         //     : englishSongsImgUrls,
//                         ),
//                   ),
//                 );
//               },
//               child: SizedBox(
//                 height: size.height * 0.065.h,
//                 width: size.width.w,
//                 child: Stack(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.network(
//                           musicProviderWatch['songImg'],
//                           height: double.maxFinite,
//                           fit: BoxFit.cover,
//                           width: size.width * 0.15.w,
//                         ),
//                         const Spacer(),
//                         SizedBox(
//                           width: size.width * 0.65.w,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 musicProviderWatch['songName'],
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 18.sp,
//                                   color: blackColor,
//                                 ),
//                               ),
//                               Text(
//                                 musicProviderWatch['songName'],
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 12.sp,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () async {
//                             // await musicRiverpodProvider.playerStop();
//                             await musicRiverpodProvider.pauseSong(
//                               categoryIndex: musicProviderWatch['c'] as int,
//                               currentIndex: musicProviderWatch['c'] as int == 0
//                                   ? hindiSongs.indexOf(
//                                       musicProviderWatch['songName'],
//                                     )
//                                   : englishSongs.indexOf(
//                                       musicProviderWatch['songName'],
//                                     ),
//                             );
//                           },
//                           icon: Icon(
//                             musicProviderWatch['state'] == 'resume'
//                                 ? Icons.pause_circle_filled_rounded
//                                 : Icons.play_circle_fill,
//                             size: 40,
//                             color: blackColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
