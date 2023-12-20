// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jiosaavn_vip/controllers/current_song_controller.dart';

// // ignore: must_be_immutable
// class SongScreen extends StatefulWidget {
//   final AudioPlayer audioPlayer;
//   final String path;
//   final String img;
//   int index;
//   SongScreen({
//     super.key,
//     required this.audioPlayer,
//     required this.path,
//     required this.index,
//     required this.img,
//   });

//   @override
//   State<SongScreen> createState() => _SongScreenState();
// }

// class _SongScreenState extends State<SongScreen> {
//   Duration duration = const Duration();
//   Duration position = const Duration();
//   bool isPlaying = false;
//   bool isPaused = false;
//   bool isRepeat = false;
//   List<IconData> icons = [
//     Icons.play_circle_fill,
//     Icons.pause_circle_filled,
//   ];
//   @override
//   void initState() {
//     super.initState();
//     initialize();
//   }

//   initialize() {
//     if (Get.find<CurrentSongController>().categories[0]) {
//       //
//     } else if (Get.find<CurrentSongController>().categories[1]) {
//       //
//     } else {
//       setPlayer();
//     }
//   }

//   setPlayer() {
//     setState(() {
//       Get.find<CurrentSongController>().index = widget.index;
//       Get.find<CurrentSongController>().isPlay = false;
//       widget.audioPlayer.onDurationChanged.listen((event) {
//         setState(() {
//           duration = event;
//         });
//       });
//       widget.audioPlayer.onPositionChanged.listen((event) {
//         setState(() {
//           position = event;
//         });
//       });
//       widget.audioPlayer.setSource(AssetSource(widget.path));
//       widget.audioPlayer.onPlayerComplete.listen((event) {
//         setState(() {
//           // duration = const Duration(seconds: 0);
//           widget.audioPlayer.seek(Duration.zero);
//           if (isRepeat) {
//             isPlaying = true;
//           } else {
//             isPlaying = false;
//             isRepeat = false;
//           }
//         });
//       });
//       widget.audioPlayer.play(AssetSource(widget.path));
//       Get.find<CurrentSongController>().isPlay = false;
//     });
//   }

//   @override
//   void dispose() {
//     // widget.audioPlayer.stop();
//     // setState(() {
//     //   isPlaying = false;
//     //   isPaused = false;
//     //   isRepeat = false;
//     // });
//     super.dispose();
//     if (Get.find<CurrentSongController>().categories[0]) {
//       //
//       Get.find<CurrentSongController>().categories[1] = false;
//     } else if (Get.find<CurrentSongController>().categories[1]) {
//       //
//       Get.find<CurrentSongController>().categories[0] = false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CurrentSongController>(
//       builder: (con) => PopScope(
//         canPop: true,
//         onPopInvoked: (didPop) {
//           setState(() {
//             if (isPlaying) {
//               if (Get.find<CurrentSongController>().categories[0]) {
//                 Get.find<CurrentSongController>().categories[0] = true;
//                 Get.find<CurrentSongController>().categories[1] = false;
//               }
//               if (Get.find<CurrentSongController>().categories[1]) {
//                 Get.find<CurrentSongController>().categories[1] = true;
//                 Get.find<CurrentSongController>().categories[0] = false;
//               }
//             } else {
//               if (Get.find<CurrentSongController>().categories[0]) {
//                 Get.find<CurrentSongController>().categories[0] = true;
//                 Get.find<CurrentSongController>().categories[1] = false;
//               }
//               if (Get.find<CurrentSongController>().categories[1]) {
//                 Get.find<CurrentSongController>().categories[1] = true;
//                 Get.find<CurrentSongController>().categories[0] = false;
//               }
//             }
//           });
//         },
//         child: Scaffold(
//           body: Container(
//             margin:
//                 const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 100),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   clipBehavior: Clip.antiAlias,
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     widget.img,
//                     height: 200,
//                     width: double.maxFinite,
//                     fit: BoxFit.cover,
//                     // loadingBuilder: (context, child, loadingProgress) {
//                     //   if (loadingProgress == null) {
//                     //     child;
//                     //   }
//                     //   return Image.asset(
//                     //     'assets/jio_saavn.png',
//                     //     height: 200,
//                     //     width: double.maxFinite,
//                     //     fit: BoxFit.cover,
//                     //   );
//                     // },
//                   ),
//                 ),
//                 Slider(
//                   activeColor: Colors.red,
//                   inactiveColor: Colors.grey,
//                   min: 0.0,
//                   max: duration.inSeconds.toDouble(),
//                   value: position.inSeconds.toDouble(),
//                   onChanged: (valuee) {
//                     setState(() {
//                       widget.audioPlayer
//                           .seek(Duration(seconds: valuee.toInt()));
//                     });
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         // setPlayer();
//                         if (!isRepeat) {
//                           widget.audioPlayer.setReleaseMode(ReleaseMode.loop);
//                           setState(() {
//                             isRepeat = true;
//                           });
//                         } else {
//                           widget.audioPlayer
//                               .setReleaseMode(ReleaseMode.release);
//                           setState(() {
//                             isRepeat = false;
//                           });
//                         }
//                       },
//                       icon: Icon(
//                         Icons.repeat_rounded,
//                         color: isRepeat ? Colors.red : Colors.black,
//                       ),
//                     ),
//                     Text(position.toString().split('.')[0]),
//                     IconButton(
//                       onPressed: () {
//                         widget.audioPlayer.stop();
//                         if (!con.isPlay) {
//                           setPlayer();
//                         } else if (con.categories[0] &&
//                             con.index == widget.index &&
//                             con.isPlay) {
//                           setState(() {
//                             widget.audioPlayer.stop();
//                             con.isPlay = false;
//                           });
//                           //
//                         } else if (con.categories[1] &&
//                             con.index == widget.index &&
//                             con.isPlay) {
//                           setState(() {
//                             widget.audioPlayer.stop();
//                             con.isPlay = false;
//                           });
//                           //
//                         }
//                         // setState(() {
//                         //   if (con.isPlay) {
//                         //     if (con.index != widget.index) {
//                         //       con.index = widget.index;
//                         //       widget.audioPlayer.play(AssetSource(
//                         //         widget.path,
//                         //       ));
//                         //       return;
//                         //     }
//                         //     con.index = widget.index;
//                         //     widget.audioPlayer.pause();
//                         //     con.isPlay = false;
//                         //   } else {
//                         //     con.isPlay = true;
//                         //     con.index = widget.index;
//                         //     widget.audioPlayer.play(
//                         //       AssetSource(
//                         //         widget.path,
//                         //       ),
//                         //     );
//                         //   }
//                         // });
//                       },
//                       icon: Icon(
//                         con.index == widget.index &&
//                                 con.isPlay &&
//                                 con.categories[0]
//                             ? con.index == widget.index &&
//                                     con.isPlay &&
//                                     con.categories[1]
//                                 ? Icons.pause_circle_filled
//                                 : Icons.pause_circle_filled
//                             : Icons.play_circle_fill,
//                         size: 50,
//                       ),
//                     ),
//                     Text(duration.toString().split('.')[0]),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.1,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
