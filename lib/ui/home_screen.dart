// ignore_for_file: avoid_print
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiosaavn_vip/bloc/music_bloc/music_bloc.dart';
import 'package:jiosaavn_vip/bloc/music_bloc/music_event.dart';
import 'package:jiosaavn_vip/colors.dart';
import 'package:jiosaavn_vip/ui/jiosaavn_pro_screen.dart';
import 'package:jiosaavn_vip/ui/my_library_screen.dart';
import 'package:jiosaavn_vip/ui/song_open_screen.dart';
import 'package:jiosaavn_vip/widgets/app_bar_text.dart';
import 'package:jiosaavn_vip/widgets/jio_tunes_widget.dart';
import 'package:jiosaavn_vip/widgets/search_item.dart';
import 'package:jiosaavn_vip/widgets/single_channel_item_search.dart';
import 'package:jiosaavn_vip/widgets/trending_jiotunes_widget.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title ${message.notification?.title}');
  print('Title ${message.notification?.body}');
  print('Title ${message.data}');
}

handleMesage(RemoteMessage? message, BuildContext context) {
  if (message == null) return;
  // navKey.currentState!.pushNamed(
  //   NotificationScreen.route,
  //   arguments: message,
  // );
}

Future initPushNotifications() async {
  //For IOS
  // await FirebaseMessaging.instance
  //     .setForegroundNotificationPresentationOptions(
  //       alert: true,
  //       badge: true,
  //       sound: true,
  //     );
  FirebaseMessaging.instance.getInitialMessage().then((mes) => handleMesage);
  FirebaseMessaging.onMessageOpenedApp.listen((event) => handleMesage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();
    print('FCM Token $fcmToken');
    initPushNotifications();
    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}

// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('  GOGL'),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late CurrentSongController c;
  int internal = 0;
  int index = 0;
  List<Color> c0 = [
    Colors.white,
    Colors.pink.shade100,
    Colors.pink.shade300,
  ];

  List<Color> c1 = [
    Colors.white,
    Colors.teal.shade100,
    Colors.teal.shade300,
  ];
  List<Color> c2 = [
    Colors.white,
    Colors.red.shade100,
    Colors.red.shade300,
  ];
  List<Color> c3 = [
    Colors.white,
    Colors.green.shade100,
    Colors.green.shade300,
  ];
  List<Color> c4 = [
    Colors.white,
    Colors.purple.shade100,
    Colors.purple.shade300,
  ];
  List<Color> c5 = [
    Colors.white,
    Colors.orange.shade100,
    Colors.orange.shade300,
  ];
  List<String> hindiSongs = [
    '01  Zara Sa - www.downloadming.com.mp3',
    'Apna-Bana-Le(PagalWorld).mp3',
    'Deva Shree Ganesha_64(PagalWorld.com.pe).mp3',
    'Kiya Kiya - Welcome 128 Kbps.mp3',
    'Labon Ko Bhool Bhulaiyaa 128 Kbps.mp3',
    'Maan Meri Jaan_64(PagalWorld.com.pe).mp3',
  ];
  // List<String> hindiSongs = [
  //   'assets/01  Zara Sa - www.downloadming.com.mp3',
  //   'assets/Apna-Bana-Le(PagalWorld).mp3',
  //   'assets/Deva Shree Ganesha_64(PagalWorld.com.pe).mp3',
  //   'assets/Kiya Kiya - Welcome 128 Kbps.mp3',
  //   'assets/Labon Ko Bhool Bhulaiyaa 128 Kbps.mp3',
  //   'assets/Maan Meri Jaan_64(PagalWorld.com.pe).mp3',
  // ];
  List<String> englishSongs = [
    'Baby-Calm-Down(PaglaSongs).mp3',
    'Ignite---Alan-Walker(PagalWorlld.Com).mp3',
    'On My Way_64-(WapKing).mp3',
    'Flower [128 Kbps]-(Pagalworld.gay).mp3',
    'Cupid-(Twin-Version)(PagalWorlld.Com).mp3',
  ];
  List<String> englishSongsImgUrls = [
    'https://upload.wikimedia.org/wikipedia/en/b/b1/Rema_-_Calm_Down.png',
    'https://i1.sndcdn.com/artworks-000379252608-a9ujwu-t500x500.jpg',
    'https://i1.sndcdn.com/artworks-000523641915-lo2qzf-t500x500.jpg',
    'https://c.saavncdn.com/073/ME-Korean-2023-20230331092858-500x500.jpg',
    'https://i.scdn.co/image/ab67616d0000b27337c0b3670236c067c8e8bbcb',
  ];

  List<String> hindiSongsImgUrls = [
    'https://i1.sndcdn.com/artworks-000497442375-r9olt2-t500x500.jpg',
    'https://i.ytimg.com/vi/FqchmlJbINs/maxresdefault.jpg',
    'https://c.saavncdn.com/506/Deva-Shree-Ganesha-Sanskrit-2012-20200518122611-500x500.jpg',
    'https://c.saavncdn.com/199/Welcome-Hindi-2007-500x500.jpg',
    'https://c.saavncdn.com/056/Bhool-Bhulaiyaa-Hindi-2007-20221122005742-500x500.jpg',
    'https://video.newsserve.net/v/20230209/1675956337-Maan-Meri-Jaan-The-Official-Music-Video_hires.jpg',
  ];
  List<String> recentSongText = [
    'Pop divas',
    'Full on energy',
    'Bollywood songs',
    'Pop divas',
    'Full on energy',
    'Bollywood songs',
    'Pop divas',
    'Full on energy',
    'Bollywood songs'
  ];
  List<String> recentHeadText = [
    'Pop divas',
    'Full on energy',
    'Bollywood songs',
    'Pop divas',
    'Full on energy',
    'Bollywood songs',
    'Pop divas',
    'Full on energy',
    'Bollywood songs'
  ];
  List<String> recentDescText = [
    '260 fans',
    '460 fans',
    '700 fans',
    '260 fans',
    '460 fans',
    '700 fans',
    '260 fans',
    '460 fans',
    '700 fans',
  ];
  List<String> recentSongImg = [
    'https://wallpapersmug.com/download/1440x2560/6302b4/ariana-grande-actress-brunette.jpg',
    'https://a10.gaanacdn.com/images/albums/57/64957/crop_480x480_64957.jpg',
    'https://www.lyricsmotion.com/Content/images/de-dana-dan-2009-200x275.jpg',
    'https://wallpapersmug.com/download/1440x2560/6302b4/ariana-grande-actress-brunette.jpg',
    'https://a10.gaanacdn.com/images/albums/57/64957/crop_480x480_64957.jpg',
    'https://www.lyricsmotion.com/Content/images/de-dana-dan-2009-200x275.jpg',
    'https://wallpapersmug.com/download/1440x2560/6302b4/ariana-grande-actress-brunette.jpg',
    'https://a10.gaanacdn.com/images/albums/57/64957/crop_480x480_64957.jpg',
    'https://www.lyricsmotion.com/Content/images/de-dana-dan-2009-200x275.jpg'
  ];
  //
  List<String> popSongText = [
    'Weekly Jukebox',
    'Pop Hits-2016',
    'Best of 2019 - Pop',
    'Weekly Jukebox',
    'Pop Hits-2016',
    'Best of 2019 - Pop',
    'Weekly Jukebox',
    'Pop Hits-2016',
    'Best of 2019 - Pop'
  ];
  List<String> popHeadText = [
    'Weekly Jukebox',
    'Pop Hits-2016',
    'Best of 2019 - Pop',
    'Weekly Jukebox',
    'Pop Hits-2016',
    'Best of 2019 - Pop',
    'Weekly Jukebox',
    'Pop Hits-2016',
    'Best of 2019 - Pop'
  ];
  List<String> popDescText = [
    'JioSaavn',
    'Ajay-Atul',
    'Old ',
    'JioSaavn',
    'Ajay-Atul',
    'Old ',
    'JioSaavn',
    'Ajay-Atul',
    'Old '
  ];
  List<String> popSongImg = [
    'https://i.iheart.com/v3/re/assets.playlists/628555c52df8ed21d0dcd5cb?ops=fit(480%2C480)%2Cfit(480%2C480)',
    'https://i.ytimg.com/vi/TPZhGjRl4Rs/maxresdefault.jpg',
    'https://c.saavncdn.com/editorial/english-cluster_35_20210608083603.jpg',
    'https://i.iheart.com/v3/re/assets.playlists/628555c52df8ed21d0dcd5cb?ops=fit(480%2C480)%2Cfit(480%2C480)',
    'https://i.ytimg.com/vi/TPZhGjRl4Rs/maxresdefault.jpg',
    'https://c.saavncdn.com/editorial/english-cluster_35_20210608083603.jpg',
    'https://i.iheart.com/v3/re/assets.playlists/628555c52df8ed21d0dcd5cb?ops=fit(480%2C480)%2Cfit(480%2C480)',
    'https://i.ytimg.com/vi/TPZhGjRl4Rs/maxresdefault.jpg',
    'https://c.saavncdn.com/editorial/english-cluster_35_20210608083603.jpg',
  ];

  List<String> recSongNames = [
    'Labon Ko',
    'Paisa paisa',
    'Tu zaroori',
  ];
  List<String> recSongDesc = [
    'Bhool Bhulaiyya',
    'de dana dan',
    'Zid',
  ];
  List<String> recSongImgUrl = [
    'https://i.ytimg.com/vi/-FP2Cmc7zj4/maxresdefault.jpg',
    'https://i.ytimg.com/vi/r03GO2AlNUo/maxresdefault.jpg',
    'https://c.saavncdn.com/722/Zid-Original-Motion-Picture-Soundtrack-Hindi-2014-20230331114652-500x500.jpg',
  ];

  List<String> treSNames = [
    'Jhoome jo pathaan',
    'Manike',
    'Zara sa',
  ];
  List<String> treSNDesc = [
    'Pathaan',
    'Thank God',
    'Jannat',
  ];
  List<String> treSImg = [
    'https://images.hindustantimes.com/img/2022/12/22/1600x900/jhoome_jo_pathaan_1671686848816_1671686848951_1671686848951.png',
    'https://c.saavncdn.com/933/Manike-From-Thank-God-Hindi-2022-20220920201002-500x500.jpg',
    'https://c.saavncdn.com/801/Jannat-Hindi-2008-20190629135803-500x500.jpg',
  ];

  List<String> chaText = ['Best of 2022', 'Romance', 'Woomaniya', 'Dance Hits'];
  List<String> chaImg = [
    'https://c.saavncdn.com/editorial/DanceHits2022Hindi_20221207062023.jpg',
    'https://c.saavncdn.com/544/Meaning-of-Love-Romantic-Piano-Music-Love-Songs-Candle-Light-Dinner-Relaxation-with-Smooth-Jazz-Piano-Bar-Music-Date-Night-Proposal-Anniversary-English-2015-500x500.jpg',
    'https://c.saavncdn.com/139/O-Womaniya-Women-s-Day-Special-Hindi-2023-20230306204959-500x500.jpg',
    'https://img.freepik.com/premium-vector/abstract-music-dance-poster-music-event-design-vector-illustration_460848-11647.jpg'
  ];
  bool isSearch = false;
  bool isClose = false;
  List<String> find = [];
  List<int> findI = [];
  //
  // Duration duration = const Duration();
  // Duration position = const Duration();
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;

  List<IconData> icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  //
  // late AudioPlayer audioPlayer;
  late Future _fetchHindi;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MusicBloc>(context).add(LoadSongsHindi());
  }

  bool isBS = true;

  // String songPath = '01  Zara Sa - www.downloadming.com.mp3';
  // String songImgPath =
  //     'https://i1.sndcdn.com/artworks-000497442375-r9olt2-t500x500.jpg';
  // scheduleNotification() async {
  //     var scheduleNotificationDateAndTime =
  //         DateTime.now().add(const Duration(seconds: 10));
  //     AndroidNotificationDetails androidPlatformChannelSpecification =
  //         const AndroidNotificationDetails(
  //       'Vipul',
  //       'MR_VIPUL_21',
  //       // icon: 'jio_saavn',
  //       // sound: RawResourceAndroidNotificationSound('omnitrix.mp3'),
  //     );
  //     NotificationDetails notificationDetails = NotificationDetails(
  //       android: androidPlatformChannelSpecification,
  //     );
  //     await flutterLocalNotificationsPlugin.show(
  //       0,
  //       'VIPUL',
  //       'FIRST LOCAL NOTIFICATION',
  //       notificationDetails,
  //     );
  //   }

  @override
  Widget build(BuildContext context) {
    var editController = TextEditingController();
    var size = MediaQuery.of(context).size;
    var searchController = ScrollController();
    final sController = ScrollController();
    showBS({
      required int category,
      required int idx,
      required String img,
      required String text,
    }) =>
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: size.height * 0.65,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.55,
                    padding: EdgeInsets.only(
                      top: size.height * 0.1,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.play_arrow_outlined,
                          ),
                          title: const Text('Play now'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.favorite_border),
                          title: const Text('Save to Library'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.queue_music_outlined,
                          ),
                          title: const Text(
                            'Add to Playlist',
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.playlist_add,
                          ),
                          title: const Text('Add to Queue'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.download_outlined,
                          ),
                          title: const Text('Download'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.share,
                          ),
                          title: const Text('Share'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                      child: Image.network(
                        img,
                        height: 150.h,
                        width: 150.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.2.h,
                    child: Text(
                      text,
                    ),
                  ),
                ],
              ),
            );
          },
        );
    // bool isPlayed = c.isPlay;

    return Scaffold(
      //
      appBar: index != 1
          ? AppBar(
              backgroundColor: index != 3
                  ? Colors.white
                  : const Color.fromARGB(255, 42, 45, 54),
              title: index == 2
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w)
                          .copyWith(top: size.height * 0.015.h),
                      child: Text(
                        'My Library',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Row(
                      children: index == 3
                          ? [
                              Text(
                                'JioSaavn Pro',
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                          : [
                              AppBarText(
                                text: 'Music',
                                fontcolor: internal == 0
                                    ? Colors.black
                                    : Colors.black54,
                                dividercolor: internal == 0
                                    ? Colors.black
                                    : Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    internal = 0;
                                  });
                                },
                              ),
                              AppBarText(
                                text: 'Podcasts',
                                fontcolor: internal == 1
                                    ? Colors.black
                                    : Colors.black54,
                                dividercolor: internal == 1
                                    ? Colors.black
                                    : Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    internal = 1;
                                  });
                                },
                              ),
                              AppBarText(
                                text: 'JioTunes',
                                fontcolor: internal == 2
                                    ? Colors.black
                                    : Colors.black54,
                                dividercolor: internal == 2
                                    ? Colors.black
                                    : Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    internal = 2;
                                  });
                                },
                              ),
                            ],
                    ),
              actions: [
                Visibility(
                  visible: index != 1 && index != 3,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 42,
                    ),
                  ),
                ),
              ],
            )
          : AppBar(
              centerTitle: true,
              title: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  clipBehavior: Clip.antiAlias,
                  controller: editController,
                  onTap: () {
                    isClose = true;
                  },
                  onChanged: (value) {
                    for (var i = 0; i < recSongNames.length; i++) {
                      if (editController.text
                          .toLowerCase()
                          .contains(recSongNames[i].toLowerCase())) {
                        if (find.contains(recSongNames[i])) {
                          //
                        } else {
                          find.add(recSongNames[i]);
                          findI.add(i);
                        }

                        setState(() {
                          isSearch = true;
                        });
                      }
                    }
                  },
                  // onSaved: (value) {
                  //   for (var i = 0; i < recSongNames.length; i++) {
                  //     if (editController.text.contains(recSongNames[i])) {
                  //       setState(() {
                  //         find.add(recSongNames[i]);
                  //         isSearch = true;
                  //       });
                  //     } else {
                  //       find.clear();
                  //     }
                  //   }
                  // },
                  onFieldSubmitted: (value) {
                    isClose = false;
                  },
                  // onEditingComplete: () {
                  //   for (var i = 0; i < recSongNames.length; i++) {
                  //     if (editController.text.toLowerCase().contains(
                  //           recSongNames[i].toLowerCase(),
                  //         )) {
                  //       find.add(recSongNames[i]);
                  //       setState(() {
                  //         isSearch = true;
                  //       });
                  //     }
                  //   }
                  // },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: whiteColor,
                    filled: true,
                    hintText: 'Music Artists Podcasts',
                    prefixIcon: IconButton(
                      icon: Icon(isClose ? Icons.arrow_back_ios : Icons.search),
                      onPressed: () {
                        if (editController.text.isEmpty) {
                          if (FocusScope.of(context).hasFocus) {
                            FocusScope.of(context).unfocus();
                          }
                          if (find.isEmpty) {
                            isSearch = false;
                          }
                          isClose = false;
                        }
                      },
                    ),
                    suffixIcon: IconButton(
                      icon:
                          Icon(isClose ? Icons.close : Icons.mic_none_outlined),
                      onPressed: () {
                        if (editController.text.isEmpty) {
                          if (FocusScope.of(context).hasFocus) {
                            FocusScope.of(context).unfocus();
                          }
                          if (find.isEmpty) {
                            isSearch = false;
                          }
                          isClose = false;
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
      //
      body: IndexedStack(
        index: index,
        children: [
          ListView(
            shrinkWrap: true,
            controller: sController,
            scrollDirection: Axis.vertical,
            children: [
              if (internal == 0)
                SizedBox(
                  height: size.height * 0.8.h,
                  child: ListView(
                    controller: sController,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w)
                            .copyWith(top: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SongsHeader(title: "Hindi Songs"),
                            BlocConsumer<MusicBloc, MusicState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return SizedBox(
                                  // height: 180.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.songs.length,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          context.read<MusicBloc>().add(
                                                PlayRequested(
                                                  state.songs[index],
                                                ),
                                              );
                                        },
                                        title: Text(state.songs[index].name),
                                      );
                                    },
                                    // itemBuilder: (context, index) {
                                    //   return RecentlyPlayedWidget(
                                    //     isBorder: false,
                                    //     recentAlbumText: hindiSongs[index],
                                    //     onPressed: () {},
                                    //     onTap: () {},
                                    //     onLongPressed: () {
                                    //       showBS(
                                    //         category: 0,
                                    //         idx: index,
                                    //         img: hindiSongsImgUrls[index],
                                    //         text: hindiSongs[index],
                                    //       );
                                    //     },
                                    //     recentSongImg: hindiSongsImgUrls[index],
                                    //     recHeadColor: blackColor,
                                    //     recDescColor: recdescColor,
                                    //     recentAlbumDescText: hindiSongs[index],
                                    //     widgett: IconButton(
                                    //       onPressed: () {},
                                    //       icon: Icon(
                                    //         Icons.play_arrow,
                                    //       ),
                                    //     ),
                                    //   );
                                    // },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 12.w)
                      //       .copyWith(top: 16.h),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       SongsHeader(title: "English Songs"),
                      //       SizedBox(
                      //         height: 180.h,
                      //         child: ListView.builder(
                      //           scrollDirection: Axis.horizontal,
                      //           itemCount: englishSongs.length,
                      //           shrinkWrap: true,
                      //           physics: const ClampingScrollPhysics(),
                      //           itemBuilder: (context, index) =>
                      //               RecentlyPlayedWidget(
                      //             isBorder: Get.find<CurrentSongController>()
                      //                         .categoryy ==
                      //                     1 &&
                      //                 Get.find<CurrentSongController>().index ==
                      //                     index,
                      //             recentAlbumText: englishSongs[index],
                      //             onPressed: () {
                      //               // setState(() {
                      //               //   if (con.isPlay) {
                      //               //     audioPlayer.pause();
                      //               //     con.isPlay = false;
                      //               //   } else {
                      //               //     audioPlayer.play(
                      //               //       AssetSource(
                      //               //         hindiSongs[index],
                      //               //       ),
                      //               //     );
                      //               //     con.isPlay = true;
                      //               //   }
                      //               // });
                      //             },
                      //             onTap: () {
                      //               // if (!isPlayed) {
                      //               //   c.isPlay = true;
                      //               // }
                      //               // con.index = index;
                      //               // con.categories[0] = false;
                      //               // con.categories[1] = true;
                      //               // Navigator.of(context).push(
                      //               //   MaterialPageRoute(
                      //               //     builder: (context) => SongScreen(
                      //               //       audioPlayer: audioPlayer,
                      //               //       path: englishSongs[index],
                      //               //       index: index,
                      //               //       img: englishSongsImgUrls[index],
                      //               //     ),
                      //               //   ),
                      //               // );
                      //             },
                      //             onLongPressed: () {
                      //               showBS(
                      //                 category: 1,
                      //                 idx: index,
                      //                 img: englishSongsImgUrls[index],
                      //                 text: englishSongs[index],
                      //               );
                      //             },
                      //             recentSongImg: englishSongsImgUrls[index],
                      //             recHeadColor: blackColor,
                      //             recDescColor: recdescColor,
                      //             recentAlbumDescText: englishSongs[index],
                      //             widgett: GetBuilder<CurrentSongController>(
                      //               builder: (con) => IconButton(
                      //                 padding: EdgeInsets.zero,
                      //                 onPressed: () async {
                      //                   // setState(() async {
                      //                   final sf = await SharedPreferences
                      //                       .getInstance();
                      //                   await sf.setString(
                      //                       'song', englishSongs[index]);
                      //                   await sf.setString(
                      //                       'img', englishSongsImgUrls[index]);
                      //                   await sf.setInt('category', 1);
                      //                   await sf.setInt('index', index);
                      //                   c.changePathAndTitleAndCategory(
                      //                     sIP: englishSongsImgUrls[index],
                      //                     sT: englishSongs[index],
                      //                     category: 1,
                      //                   );
                      //                   // con.categories[0] = false;
                      //                   // con.categories[1] = true;
                      //                   // if (isPaused) {
                      //                   //   await setPlayer(index, 1);
                      //                   //   return;
                      //                   // } else {
                      //                   //   isPlaying = true;
                      //                   //   await setPlayer(index, 1);
                      //                   // }
                      //                   // });
                      //                 },
                      //                 // icon: Icon(
                      //                 //   con.index == index &&
                      //                 //           con.isPlay &&
                      //                 //           con.categories[1]
                      //                 //       ? Icons.pause_circle_filled
                      //                 //       : Icons.play_circle_fill,
                      //                 //   color: whiteColor,
                      //                 // ),
                      //                 icon: const Icon(
                      //                   Icons.play_circle_fill,
                      //                   color: whiteColor,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                ),
              if (internal == 1) SizedBox(),
              if (internal == 2)
                SizedBox(
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w)
                            .copyWith(top: 16.h),
                        child: SizedBox(
                          height: 210.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              JioTunesWidget(
                                title: 'Top JioTunes',
                                imgUrl: hindiSongsImgUrls[0],
                                gradient: c0,
                              ),
                              JioTunesWidget(
                                title: 'Top JioTunes',
                                imgUrl: hindiSongsImgUrls[1],
                                gradient: c1,
                              ),
                              JioTunesWidget(
                                title: 'Top JioTunes',
                                imgUrl: hindiSongsImgUrls[2],
                                gradient: c2,
                              ),
                              JioTunesWidget(
                                title: 'Top JioTunes',
                                imgUrl: hindiSongsImgUrls[3],
                                gradient: c3,
                              ),
                              JioTunesWidget(
                                title: 'Top JioTunes',
                                imgUrl: hindiSongsImgUrls[4],
                                gradient: c4,
                              ),
                              JioTunesWidget(
                                title: 'Top JioTunes',
                                imgUrl: hindiSongsImgUrls[5],
                                gradient: c5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w)
                            .copyWith(top: 16.h),
                        child: Text(
                          'Recommended JioTunes',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: blackColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w)
                            .copyWith(top: 16.h),
                        child: SizedBox(
                          height: 195.h,
                          child: ListView.builder(
                            itemCount: englishSongsImgUrls.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: SizedBox(
                                width: 100.w,
                                child: Column(
                                  children: [
                                    Image.network(
                                      englishSongsImgUrls[index],
                                      width: 100.w,
                                      height: 120.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      englishSongs[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: blackColor,
                                      ),
                                    ),
                                    Text(
                                      englishSongs[index],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w)
                            .copyWith(top: 16.h),
                        child: Text(
                          'Trending JioTunes',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: blackColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w)
                            .copyWith(top: 16.h),
                        child: SizedBox(
                          height: 200.h,
                          child: ListView.builder(
                            itemCount: englishSongsImgUrls.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) =>
                                TrendingJioTunesWidget(
                              imgUrl: englishSongsImgUrls[index],
                              title: englishSongs[index],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          isSearch == true
              ? SizedBox(
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: findI.length,
                    itemBuilder: (_, index) {
                      return SearchSingle(
                        url: recSongImgUrl[findI[index]],
                        songName: recSongNames[findI[index]],
                        icon: Icons.close,
                        onPressed: () {
                          find.remove(find[index]);
                          findI.remove(findI[index]);
                          setState(() {});
                        },
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => SongOpenScreen(
                                sTitle: recSongNames[findI[index]],
                                sName: recSongNames[findI[index]],
                                sImg: recSongImgUrl[findI[index]],
                              ),
                            ),
                          );
                          Future.delayed(const Duration(seconds: 1));
                          isClose = false;
                        },
                        songInfo: '',
                      );
                    },
                  ),
                )
              : ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  controller: searchController,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent Search',
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                    color: suffFixTextColor,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.26.h,
                          child: ListView.builder(
                              // controller: searchController,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: recSongNames.length,
                              itemBuilder: (_, idx) {
                                final rSUrl = recSongImgUrl[idx];
                                final rSName = recSongNames[idx];
                                final rSDesc = recSongDesc[idx];
                                return SearchSingle(
                                  url: rSUrl,
                                  songName: rSName,
                                  songInfo: rSDesc,
                                  icon: Icons.close,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => SongOpenScreen(
                                          sTitle: rSDesc,
                                          sName: rSName,
                                          sImg: rSUrl,
                                        ),
                                      ),
                                    );
                                  },
                                  onPressed: () {},
                                );
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Trending',
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                    color: suffFixTextColor,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.26.h,
                          child: ListView.builder(
                              // controller: searchController,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: recSongNames.length,
                              itemBuilder: (_, idx) {
                                final tSUrl = treSImg[idx];
                                final tSName = treSNames[idx];
                                final tSDesc = treSNDesc[idx];
                                return SearchSingle(
                                  url: tSUrl,
                                  songName: tSName,
                                  songInfo: tSDesc,
                                  icon: Icons.more_vert,
                                  onTap: () {},
                                  onPressed: () {},
                                );
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 14.h,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Channel',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.45.h,
                          child: GridView.builder(
                              controller: searchController,
                              itemCount: chaText.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              // physics: const ClampingScrollPhysics(),
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (_, idx) {
                                final cText = chaText[idx];
                                final cImg = chaImg[idx];
                                return SingleChannelSearchItem(
                                  channelText: cText,
                                  channelImgBack: cImg,
                                );
                              }),
                        ),
                        //
                      ],
                    ),
                  ],
                ),
          const MyLibraryScreen(),
          //
          const JioSaavnProScreen(),
          // const MyLibraryScreen(),
        ],
      ),
      //
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            backgroundColor: whiteColor,
            currentIndex: index,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: blackColor,
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
            ),
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
            ),
            onTap: (value) {
              setState(() {
                index = value;
                isSearch = false;
                isClose = false;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: 'My library',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: 'Pro',
                icon: Icon(Icons.music_note),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Center(
                  child: Container(
                    height: 3,
                    width: MediaQuery.of(context).size.width * 0.1,
                    color: index == 0 ? blackColor : whiteColor,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Center(
                  child: Container(
                    height: 3,
                    width: MediaQuery.of(context).size.width * 0.1,
                    color: index == 1 ? blackColor : whiteColor,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Center(
                  child: Container(
                    height: 3,
                    width: MediaQuery.of(context).size.width * 0.1,
                    color: index == 2 ? blackColor : whiteColor,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Center(
                  child: Container(
                    height: 3,
                    width: MediaQuery.of(context).size.width * 0.1,
                    color: index == 3 ? blackColor : whiteColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        try {
          final root = FirebaseStorage.instance.ref();
          final result = await root.listAll();

          for (var folder in result.prefixes) {
            print('ROOT FOLDER: ${folder.fullPath}');
          }

          for (var file in result.items) {
            print('ROOT FILE: ${file.fullPath}');
          }
        } on FirebaseException catch (e) {
          print(e.toString());
        }
      }),
      //
      // bottomSheet: isBS
      //     ? GetBuilder<CurrentSongController>(
      //         builder: (controller) => BottomSheet(
      //           shape: const RoundedRectangleBorder(
      //             borderRadius: BorderRadius.zero,
      //           ),
      //           onClosing: () {},
      //           enableDrag: false,
      //           builder: (_) {
      //             return GestureDetector(
      //               onTap: () {
      //                 Navigator.of(context).push(
      //                   MaterialPageRoute(
      //                     builder: (context) => SongPlayer(
      //                       audioPlayer: audioPlayer,
      //                       img: controller.categories.first == true
      //                           ? hindiSongsImgUrls
      //                           : englishSongsImgUrls,
      //                       song: controller.categories.first == true
      //                           ? hindiSongs
      //                           : englishSongs,
      //                     ),
      //                   ),
      //                 );
      //                 // setState(() {
      //                 //   isBS = false;
      //                 // });
      //                 // Navigator.of(context).push(
      //                 //   MaterialPageRoute(
      //                 //     builder: (_) => SongPlayerScreen(
      //                 //       audioPlayer: audioPlayer,
      //                 //       imgUrl: songImgPath,
      //                 //       count: controller.categories[0]
      //                 //           ? hindiSongs.length
      //                 //           : englishSongs.length,
      //                 //       curr: globalIndex,
      //                 //       songNames: controller.categories[0]
      //                 //           ? hindiSongs
      //                 //           : englishSongs,
      //                 //       songsImgUrls: controller.categories[0]
      //                 //           ? hindiSongsImgUrls
      //                 //           : englishSongsImgUrls,
      //                 //     ),
      //                 //   ),
      //                 // );
      //               },
      //               child: SizedBox(
      //                 height: size.height * 0.065,
      //                 width: size.width,
      //                 child: Stack(
      //                   children: [
      //                     Row(
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //                       children: [
      //                         Image.network(
      //                           controller.songImgPath,
      //                           height: double.maxFinite,
      //                           fit: BoxFit.cover,
      //                           width: size.width * 0.15,
      //                         ),
      //                         const Spacer(),
      //                         SizedBox(
      //                           width: size.width * 0.65,
      //                           child: Column(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             mainAxisSize: MainAxisSize.min,
      //                             children: [
      //                               Text(
      //                                 controller.songTitle,
      //                                 maxLines: 1,
      //                                 overflow: TextOverflow.ellipsis,
      //                                 style: const TextStyle(
      //                                   fontSize: 18, color: blackColor,
      //                                   // fontWeight: FontWeight.w600,
      //                                 ),
      //                               ),
      //                               Text(
      //                                 controller.songTitle,
      //                                 maxLines: 1,
      //                                 overflow: TextOverflow.ellipsis,
      //                                 style: const TextStyle(
      //                                   fontSize: 12,
      //                                   color: Colors.black54,
      //                                   // fontWeight: FontWeight.w200,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         const Spacer(),
      //                         IconButton(
      //                           onPressed: () {
      //                             // con.categories[0] = true;
      //                             // con.categories[1] = false;
      //                             // if (con.categories[0]) {
      //                             //   setState(() {
      //                             //     if (con.isPlay) {
      //                             //       if (con.index != index) {
      //                             //         con.index = index;
      //                             //         audioPlayer
      //                             //             .play(AssetSource(hindiSongs[index]));
      //                             //         return;
      //                             //       }
      //                             //       con.index = index;
      //                             //       audioPlayer.pause();
      //                             //       con.isPlay = false;
      //                             //     } else {
      //                             //       con.isPlay = true;
      //                             //       con.index = index;
      //                             //       audioPlayer.play(
      //                             //         AssetSource(
      //                             //           hindiSongs[index],
      //                             //         ),
      //                             //       );
      //                             //     }
      //                             //   });
      //                             // }
      //                             setState(() {
      //                               if (isPlaying) {
      //                                 // if (controller.categories[0]) {
      //                                 //   controller.categories[0] = false;
      //                                 // }
      //                                 // if (controller.categories[1]) {
      //                                 //   controller.categories[1] = false;
      //                                 // }
      //                                 audioPlayer.pause();
      //                                 isPlaying = false;
      //                                 controller.isPlay = false;
      //                               } else {
      //                                 // if (controller.categories[0]) {
      //                                 //   audioPlayer.play(AssetSource(songPath));
      //                                 //   isPlaying = true;
      //                                 //   controller.isPlay = true;
      //                                 //   return;
      //                                 // }
      //                                 // if (controller.categories[1]) {
      //                                 //   audioPlayer.play(AssetSource(songPath));
      //                                 //   isPlaying = true;
      //                                 //   controller.isPlay = true;
      //                                 //   return;
      //                                 // }
      //                                 isPaused = false;
      //                                 audioPlayer
      //                                     .play(AssetSource(c.songTitle));
      //                                 isPlaying = true;
      //                                 controller.isPlay = true;
      //                               }
      //                             });
      //                           },
      //                           icon: Icon(
      //                             isPlaying
      //                                 ? Icons.pause_circle_filled
      //                                 : isPaused
      //                                     ? Icons.pause_circle_filled
      //                                     : Icons.play_circle_fill,
      //                             size: 40,
      //                             color: blackColor,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     Positioned(
      //                       bottom: 0,
      //                       child: SliderTheme(
      //                         data: SliderThemeData(
      //                           thumbShape: SliderComponentShape.noThumb,
      //                         ),
      //                         child: SizedBox(
      //                           width: size.width,
      //                           height: 1,
      //                           child: Slider(
      //                             activeColor: Colors.red,
      //                             inactiveColor: Colors.white,
      //                             min: 0,
      //                             max: controller.duration.inSeconds.toDouble(),
      //                             value:
      //                                 controller.position.inSeconds.toDouble(),
      //                             onChanged: (newValue) {
      //                               audioPlayer.seek(
      //                                 Duration(
      //                                   seconds: newValue.toInt(),
      //                                 ),
      //                               );
      //                             },
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       )
      //     : BottomSheet(
      //         onClosing: () {},
      //         builder: (context) {
      //           return PopScope(
      //             canPop: true,
      //             onPopInvoked: (didPop) {
      //               // isPlayingg();
      //               setState(() {
      //                 isBS = true;
      //               });
      //             },
      //             child: Scaffold(
      //               appBar: AppBar(
      //                 leading: IconButton(
      //                   onPressed: () {
      //                     // isPlayingg();
      //                     // Navigator.of(context).pop();
      //                     setState(() {
      //                       isBS = true;
      //                     });
      //                   },
      //                   icon: const Icon(
      //                     Icons.close,
      //                   ),
      //                 ),
      //                 actions: [
      //                   IconButton(
      //                     onPressed: () {},
      //                     icon: const Icon(
      //                       Icons.menu,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               body: SingleChildScrollView(
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     SizedBox(
      //                       height: size.height * 0.1,
      //                     ),
      //                     SizedBox(
      //                       height: size.height * 0.4,
      //                       width: size.width,
      //                       child: PageView.builder(
      //                         // controller: pageController,
      //                         itemCount: 2,
      //                         onPageChanged: (v) {
      //                           // setState(() {
      //                           //   index = v;
      //                           //   pageController2.jumpToPage(v);
      //                           //   pageController.jumpToPage(v);
      //                           //   isPlaying = true;
      //                           //   widget.audioPlayer.stop().then((value) {
      //                           //     setState(() {
      //                           //       widget.audioPlayer.play(
      //                           //         AssetSource(
      //                           //           widget.songNames[v],
      //                           //         ),
      //                           //       );
      //                           //     });
      //                           //   });
      //                           // });
      //                         },
      //                         scrollDirection: Axis.horizontal,
      //                         itemBuilder: (_, idex) {
      //                           return Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Image.network(
      //                               hindiSongsImgUrls[index],
      //                               fit: BoxFit.cover,
      //                             ),
      //                           );
      //                         },
      //                       ),
      //                       //     CarouselSlider.builder(
      //                       //   itemCount: widget.songsImgUrls.length,
      //                       //   carouselController: carouselController,
      //                       //   itemBuilder: (_, idx, realIndex) {
      //                       //     return Image.network(
      //                       //       widget.songsImgUrls[idx],
      //                       //       fit: BoxFit.cover,
      //                       //     );
      //                       //   },
      //                       //   options: CarouselOptions(
      //                       //     viewportFraction: 0.65,
      //                       //     aspectRatio: 0.9,
      //                       //     scrollDirection: Axis.horizontal,
      //                       //     onPageChanged: (idx, reason) {
      //                       //       setState(() {
      //                       //         index = idx;
      //                       //         pageController.jumpToPage(index);
      //                       //       });
      //                       //     },
      //                       //   ),
      //                       // ),
      //                     ),
      //                     SizedBox(
      //                       height: size.height * 0.04,
      //                     ),
      //                     SizedBox(
      //                       height: 100,
      //                       child: PageView.builder(
      //                         // controller: pageController,
      //                         scrollDirection: Axis.horizontal,
      //                         physics: const NeverScrollableScrollPhysics(),
      //                         itemCount: 2,
      //                         itemBuilder: (context, index) => SizedBox(
      //                           width: size.width,
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(12.0),
      //                             child: Row(
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 SizedBox(
      //                                   width: size.width * 0.75,
      //                                   child: const Column(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.center,
      //                                     crossAxisAlignment:
      //                                         CrossAxisAlignment.start,
      //                                     mainAxisSize: MainAxisSize.min,
      //                                     children: [
      //                                       Text(
      //                                         ' widget.songNames[index]',
      //                                         maxLines: 1,
      //                                         overflow: TextOverflow.ellipsis,
      //                                         style: TextStyle(
      //                                           fontSize: 18, color: blackColor,
      //                                           // fontWeight: FontWeight.w600,
      //                                         ),
      //                                       ),
      //                                       Text(
      //                                         ' widget.songNames[index]',
      //                                         maxLines: 1,
      //                                         overflow: TextOverflow.ellipsis,
      //                                         style: TextStyle(
      //                                           fontSize: 12,
      //                                           color: Colors.black54,
      //                                           // fontWeight: FontWeight.w200,
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                                 IconButton(
      //                                   icon: const Icon(
      //                                     Icons.more_vert_rounded,
      //                                     size: 35,
      //                                     color: blackColor,
      //                                   ),
      //                                   onPressed: () {},
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     Slider(
      //                       min: 0,
      //                       max: c.duration.inSeconds.toDouble(),
      //                       value: c.position.inSeconds.toDouble(),
      //                       label:
      //                           '${c.position.toString().split('.')[0].split(':')[1]} : ${c.position.toString().split('.')[0].split(':')[2]}',
      //                       activeColor: Colors.pink.shade600,
      //                       thumbColor: Colors.pink.shade500,
      //                       inactiveColor: Colors.pink.shade200,
      //                       onChanged: (v) {
      //                         setState(() {
      //                           audioPlayer.seek(Duration(seconds: v.toInt()));
      //                         });
      //                       },
      //                     ),
      //                     GetBuilder<CurrentSongController>(
      //                       builder: (currSongController) => Padding(
      //                         padding:
      //                             const EdgeInsets.symmetric(horizontal: 20.0),
      //                         child: Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Text(
      //                               currSongController.position
      //                                   .toString()
      //                                   .split('.')[0],
      //                             ),
      //                             Text(
      //                               currSongController.duration
      //                                   .toString()
      //                                   .split('.')[0],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: size.height * 0.02,
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: [
      //                         IconButton(
      //                           onPressed: () {},
      //                           icon: const Icon(
      //                             Icons.favorite_border,
      //                             size: 35,
      //                           ),
      //                         ),
      //                         IconButton(
      //                           onPressed: () {
      //                             // index -= 1;
      //                             // if (index >= 0) {
      //                             //   setState(() {
      //                             //     // _currentSongController.index = index;
      //                             //     // _currentSongController.songTitle =
      //                             //     //     widget.songNames[index];
      //                             //     // _currentSongController.songImgPath =
      //                             //     //     widget.songNames[index];
      //                             //     pageController2.jumpToPage(index);
      //                             //     pageController.jumpToPage(index);
      //                             //     setPlayer(index);
      //                             //   });
      //                             // }
      //                           },
      //                           icon: const Icon(
      //                             Icons.arrow_back_ios,
      //                             size: 35,
      //                           ),
      //                         ),
      //                         GetBuilder<CurrentSongController>(
      //                           builder: (cSC) => IconButton(
      //                             onPressed: () {
      //                               // if (cSC.isPlay) {
      //                               //   cSC.isPlay = false;
      //                               //   cSC.index = index;
      //                               //   widget.audioPlayer.pause();
      //                               // }
      //                               setState(() {
      //                                 if (isPlaying) {
      //                                   isPlaying = false;
      //                                   audioPlayer.pause();
      //                                 } else {
      //                                   isPlaying = true;
      //                                   // setPlayer(index);
      //                                 }
      //                               });
      //                             },
      //                             icon: Icon(
      //                               isPlaying
      //                                   ? Icons.pause_circle_filled
      //                                   : Icons.play_circle_fill,
      //                               size: 65,
      //                             ),
      //                           ),
      //                         ),
      //                         IconButton(
      //                           onPressed: () {
      //                             index += 1;
      //                             // if (index < widget.songNames.length) {
      //                             //   setState(() {
      //                             //     // _currentSongController.index = index;
      //                             //     // _currentSongController.songTitle =
      //                             //     //     widget.songNames[index];
      //                             //     // _currentSongController.songImgPath =
      //                             //     //     widget.songNames[index];
      //                             //     pageController2.jumpToPage(index);
      //                             //     pageController.jumpToPage(index);
      //                             //     setPlayer(index);
      //                             //   });
      //                             // }
      //                           },
      //                           icon: const Icon(
      //                             Icons.arrow_forward_ios,
      //                             size: 35,
      //                           ),
      //                         ),
      //                         IconButton(
      //                           onPressed: () {},
      //                           icon: const Icon(
      //                             Icons.music_note_outlined,
      //                             size: 35,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
    );
  }
}
