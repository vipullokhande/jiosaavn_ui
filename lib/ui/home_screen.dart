// ignore_for_file: avoid_print
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:jiosaavn_vip/colors.dart';
import 'package:jiosaavn_vip/controllers/current_song_controller.dart';
import 'package:jiosaavn_vip/ui/my_library_screen.dart';
import 'package:jiosaavn_vip/ui/song_open_screen.dart';
import 'package:jiosaavn_vip/ui/song_sliver_screen.dart';
import 'package:jiosaavn_vip/widgets/app_bar_text.dart';
import 'package:jiosaavn_vip/widgets/recently_played_widget.dart';
import 'package:jiosaavn_vip/widgets/search_item.dart';
import 'package:jiosaavn_vip/widgets/single_channel_item_search.dart';

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
    //cIC-y05PQjal_fsgJ-5m72:APA91bFx1k321h955SoXZrM_br4hmm9l8kLmiMqlfVpl2dUg0G3QC1VlHrSIT7MM_FzkFQGhSkde4OcHeooAIpRlarglB8c0cbAxe9vDCkLkoRNj6jQXvaSQTtMupaCbT1Gzt6kBIXlG
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
  late CurrentSongController c;
  int internal = 0;
  int index = 0;

  List<String> hindiSongs = [
    '01  Zara Sa - www.downloadming.com.mp3',
    'Apna-Bana-Le(PagalWorld).mp3',
    'Deva Shree Ganesha_64(PagalWorld.com.pe).mp3',
    'Kiya Kiya - Welcome 128 Kbps.mp3',
    'Labon Ko Bhool Bhulaiyaa 128 Kbps.mp3',
    'Maan Meri Jaan_64(PagalWorld.com.pe).mp3',
  ];
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
    'https://i0.wp.com/99lyricstore.com/wp-content/uploads/2022/10/Maan-Meri-Jaan-Lyrics-King.jpg',
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
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;

  List<IconData> icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  //
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    c = Get.find<CurrentSongController>();
    audioPlayer = AudioPlayer();
    // setPlayer(0);
  }

  setPlayer(int currIndex, int idx) {
    setState(() {
      c.index = currIndex;
      c.isPlay = true;
      globalIndex = currIndex;
      audioPlayer.onDurationChanged.listen((event) {
        setState(() {
          duration = event;
          c.changeDuration(event);
        });
      });
      audioPlayer.onPositionChanged.listen((event) {
        setState(() {
          position = event;
          c.changePosition(event);
        });
      });
      audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          // duration = const Duration(seconds: 0);
          audioPlayer.seek(Duration.zero);
          if (isRepeat) {
            isPlaying = true;
          } else {
            isPlaying = false;
            isRepeat = false;
          }
        });
      });
      AssetSource main = AssetSource(hindiSongs[currIndex]);
      AssetSource source1 = AssetSource(hindiSongs[currIndex]);
      AssetSource source2 = AssetSource(englishSongs[currIndex]);
      switch (idx) {
        case 0:
          songPath = hindiSongs[currIndex];
          songImgPath = hindiSongsImgUrls[currIndex];
          audioPlayer.setSource(source1);
          main = source1;
          break;
        case 1:
          songPath = englishSongs[currIndex];
          songImgPath = englishSongsImgUrls[currIndex];
          audioPlayer.setSource(source2);
          main = source2;
          break;
        default:
          songPath = hindiSongs[currIndex];
          songImgPath = hindiSongsImgUrls[currIndex];
          audioPlayer.setSource(source1);
          main = source1;
          break;
      }
      audioPlayer.play(main);
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop();
  }

  bool isBS = true;
  int globalIndex = 0;
  String songPath = '01  Zara Sa - www.downloadming.com.mp3';
  String songImgPath =
      'https://i1.sndcdn.com/artworks-000497442375-r9olt2-t500x500.jpg';
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
    // bool isPlayed = c.isPlay;
    var editController = TextEditingController();
    var size = MediaQuery.of(context).size;
    var searchController = ScrollController();
    final sController = ScrollController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: 1,
              channelKey: 'vip',
              title: 'First Title',
              body: 'First Notification',
            ),
          );
        },
      ),

      //
      appBar: index != 1
          ? AppBar(
              title: index == 2
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10)
                          .copyWith(top: size.height * 0.015),
                      child: const Text(
                        'My Library',
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : Row(
                      children: [
                        AppBarText(
                          text: 'Music',
                          fontcolor:
                              internal == 0 ? Colors.black : Colors.black54,
                          dividercolor:
                              internal == 0 ? Colors.black : Colors.transparent,
                          onTap: () {
                            setState(() {
                              internal = 0;
                            });
                          },
                        ),
                        AppBarText(
                          text: 'Podcasts',
                          fontcolor:
                              internal == 1 ? Colors.black : Colors.black54,
                          dividercolor:
                              internal == 1 ? Colors.black : Colors.transparent,
                          onTap: () {
                            setState(() {
                              internal = 1;
                            });
                          },
                        ),
                        AppBarText(
                          text: 'JioTunes',
                          fontcolor:
                              internal == 2 ? Colors.black : Colors.black54,
                          dividercolor:
                              internal == 2 ? Colors.black : Colors.transparent,
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
                  visible: index != 1,
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
                  height: size.height * 0.8,
                  child: ListView(
                    controller: sController,
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                String url = await FirebaseStorage.instance
                                    .ref()
                                    .child('hindi_songs')
                                    .child('Apna-Bana-Le(PagalWorld).mp3')
                                    .getDownloadURL();
                                audioPlayer.play(UrlSource(url));
                              },
                              child: const Text('Click'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                String url = await FirebaseStorage.instance
                                    .ref()
                                    .child('hindi_songs')
                                    .child('Apna-Bana-Le(PagalWorld).mp3')
                                    .getDownloadURL();
                                audioPlayer.play(UrlSource(url));
                              },
                              child: const Text('Click'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12)
                            .copyWith(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              child: Text(
                                'Hindi Songs',
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: hindiSongs.length,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    RecentlyPlayedWidget(
                                  recentAlbumText: hindiSongs[index],
                                  onPressed: () {
                                    // setState(() {
                                    //   if (con.isPlay) {
                                    //     audioPlayer.pause();
                                    //     con.isPlay = false;
                                    //   } else {
                                    //     audioPlayer.play(
                                    //       AssetSource(
                                    //         hindiSongs[index],
                                    //       ),
                                    //     );
                                    //     con.isPlay = true;
                                    //   }
                                    // });
                                  },
                                  onTap: () {
                                    // if (!isPlayed) {
                                    //   c.isPlay = true;
                                    // }
                                    // con.index = index;
                                    // con.categories[0] = true;
                                    // con.categories[1] = false;
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => SongScreen(
                                    //       audioPlayer: audioPlayer,
                                    //       path: hindiSongs[index],
                                    //       index: index,
                                    //       img: hindiSongsImgUrls[index],
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  onLongPressed: () {},
                                  recentSongImg: hindiSongsImgUrls[index],
                                  recHeadColor: blackColor,
                                  recDescColor: recdescColor,
                                  recentAlbumDescText: hindiSongs[index],
                                  widgett: GetBuilder<CurrentSongController>(
                                    builder: (con) => IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () async {
                                        // String url = await FirebaseStorage
                                        //     .instance
                                        //     .ref()
                                        //     .child('hindi_songs')
                                        //     .child(
                                        //         hindiSongs[index])
                                        //     .getDownloadURL();
                                        // audioPlayer.play(UrlSource(url));
                                        setState(() {
                                          con.categories[0] = true;
                                          con.categories[1] = false;
                                          if (isPaused) {
                                            setPlayer(index, 0);
                                            return;
                                          } else {
                                            isPlaying = true;
                                            setPlayer(index, 0);
                                          }
                                          // con.index = index;
                                          globalIndex = index;
                                          // audioPlayer.play(
                                          //     AssetSource(hindiSongs[index]));
                                        });
                                        //
                                        // if (con.categories[0]) {
                                        //   setState(() {

                                        //     // setPlayer(index);
                                        //     // con.changePathAndTitle(
                                        //     //   pa: hindiSongs[index],
                                        //     //   tit: hindiSongs[index],
                                        //     // );
                                        //     if (con.isPlay) {
                                        //       if (con.index != index) {
                                        //         con.index = index;
                                        //         audioPlayer.play(AssetSource(
                                        //             hindiSongs[index]));
                                        //         return;
                                        //       }
                                        //       con.index = index;
                                        //       audioPlayer.pause();
                                        //       con.isPlay = false;
                                        //     } else {
                                        //       con.isPlay = true;
                                        //       con.index = index;
                                        //       audioPlayer.play(
                                        //         AssetSource(
                                        //           hindiSongs[index],
                                        //         ),
                                        //       );
                                        //     }
                                        //   });
                                        // }
                                        // setState(() {
                                        //   con.index = index;
                                        //   con.categories[0] = true;
                                        //   con.categories[1] = false;
                                        // });
                                      },
                                      icon: const Icon(
                                        Icons.play_circle_fill,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12)
                            .copyWith(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              child: Text(
                                'English Songs',
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: englishSongs.length,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    RecentlyPlayedWidget(
                                  recentAlbumText: englishSongs[index],
                                  onPressed: () {
                                    // setState(() {
                                    //   if (con.isPlay) {
                                    //     audioPlayer.pause();
                                    //     con.isPlay = false;
                                    //   } else {
                                    //     audioPlayer.play(
                                    //       AssetSource(
                                    //         hindiSongs[index],
                                    //       ),
                                    //     );
                                    //     con.isPlay = true;
                                    //   }
                                    // });
                                  },
                                  onTap: () {
                                    // if (!isPlayed) {
                                    //   c.isPlay = true;
                                    // }
                                    // con.index = index;
                                    // con.categories[0] = false;
                                    // con.categories[1] = true;
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => SongScreen(
                                    //       audioPlayer: audioPlayer,
                                    //       path: englishSongs[index],
                                    //       index: index,
                                    //       img: englishSongsImgUrls[index],
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  onLongPressed: () {},
                                  recentSongImg: englishSongsImgUrls[index],
                                  recHeadColor: blackColor,
                                  recDescColor: recdescColor,
                                  recentAlbumDescText: englishSongs[index],
                                  widgett: GetBuilder<CurrentSongController>(
                                    builder: (con) => IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        con.categories[0] = false;
                                        con.categories[1] = true;
                                        if (con.categories[1]) {
                                          setState(() {
                                            isBS = true;
                                            // con.title = englishSongs[index];
                                            songPath = englishSongs[index];
                                            // setPlayer(index);
                                            if (con.isPlay) {
                                              if (con.index != index) {
                                                con.index = index;
                                                audioPlayer.play(AssetSource(
                                                    englishSongs[index]));
                                                return;
                                              }
                                              con.index = index;
                                              audioPlayer.pause();
                                              con.isPlay = false;
                                            } else {
                                              con.isPlay = true;
                                              con.index = index;
                                              audioPlayer.play(
                                                AssetSource(
                                                  englishSongs[index],
                                                ),
                                              );
                                            }
                                          });
                                        }
                                        // setState(() {
                                        //   con.index = index;
                                        //   con.categories[0] = false;
                                        //   con.categories[1] = true;
                                        // });
                                      },
                                      icon: Icon(
                                        con.index == index &&
                                                con.isPlay &&
                                                con.categories[1]
                                            ? Icons.pause_circle_filled
                                            : Icons.play_circle_fill,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12)
                            .copyWith(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              child: Text(
                                'Recently Played',
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                itemCount: recentSongText.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  final sText = recentSongText[idx];
                                  final sdText = recentDescText[idx];
                                  final sImg = recentSongImg[idx];
                                  return RecentlyPlayedWidget(
                                    recentAlbumText: sText,
                                    recentAlbumDescText: sdText,
                                    recentSongImg: sImg,
                                    recHeadColor: blackColor,
                                    recDescColor: recdescColor,
                                    // icon: Icons.play_circle_filled_outlined,
                                    widgett: const SizedBox(),
                                    onPressed: () {},
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              // SongOpenScreen(
                                              //   sTitle: sText,
                                              //   sName: sdText,
                                              //   sImg: sImg,
                                              // ),
                                              SongSliverScreen(
                                            sTitle: sText,
                                            sName: sdText,
                                            sImg: sImg,
                                          ),
                                        ),
                                      );
                                    },
                                    onLongPressed: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .play_arrow_outlined,
                                                        ),
                                                        title: const Text(
                                                            'Play now'),
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(Icons
                                                            .favorite_border),
                                                        title: const Text(
                                                            'Save to Library'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .queue_music_outlined,
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
                                                        title: const Text(
                                                            'Add to Queue'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .download_outlined,
                                                        ),
                                                        title: const Text(
                                                            'Download'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons.share,
                                                        ),
                                                        title:
                                                            const Text('Share'),
                                                        onTap: () {},
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  child: Card(
                                                    elevation: 10,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10,
                                                      ),
                                                    ),
                                                    child: Image.network(
                                                      sImg,
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: size.height * 0.2,
                                                  child: Text(
                                                    sText,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        child: ExpansionTile(
                          collapsedBackgroundColor:
                              const Color.fromARGB(255, 233, 237, 241),
                          collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          backgroundColor:
                              const Color.fromARGB(255, 219, 225, 230),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  recSongImgUrl[0],
                                  fit: BoxFit.cover,
                                  height: 60,
                                  width: 55,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: size.width * 0.2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recSongNames[0],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: blackColor,
                                      ),
                                    ),
                                    Text(
                                      recSongDesc[0],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 82, 82, 82),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.network(
                                      recSongImgUrl[0],
                                      fit: BoxFit.cover,
                                      height: size.height * 0.14,
                                      width: size.width * 0.26,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: size.width * 0.007),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          recSongNames[0],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: blackColor,
                                          ),
                                        ),
                                        Text(
                                          recSongDesc[0],
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color:
                                                Color.fromARGB(255, 82, 82, 82),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: size.width * 0.4,
                                          child: Slider(
                                            value: 0,
                                            min: 0.00,
                                            max: 4.00,
                                            secondaryTrackValue: 2.00,
                                            secondaryActiveColor:
                                                Colors.pink.shade200,
                                            thumbColor: Colors.pink,
                                            inactiveColor: Colors.grey,
                                            activeColor: Colors.pink.shade500,
                                            divisions: 25,
                                            onChanged: (val) {},
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.arrow_left,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.play_circle_fill_outlined,
                                                size: 35,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.arrow_right,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12)
                            .copyWith(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              child: Text(
                                'Now playing Pop',
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                itemCount: recentSongText.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  final sText = popSongText[idx];
                                  final sdText = popDescText[idx];
                                  final sImg = popSongImg[idx];
                                  return RecentlyPlayedWidget(
                                    recentAlbumText: sText,
                                    recentAlbumDescText: sdText,
                                    recentSongImg: sImg,
                                    recHeadColor: blackColor,
                                    recDescColor: recdescColor,
                                    widgett: const SizedBox(),
                                    // icon: Icons.play_circle_fill_outlined,
                                    onPressed: () {},
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => SongOpenScreen(
                                            sTitle: sText,
                                            sName: sdText,
                                            sImg: sImg,
                                          ),
                                        ),
                                      );
                                    },
                                    onLongPressed: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .play_arrow_outlined,
                                                        ),
                                                        title: const Text(
                                                            'Play now'),
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(Icons
                                                            .favorite_border),
                                                        title: const Text(
                                                            'Save to Library'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .queue_music_outlined,
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
                                                        title: const Text(
                                                            'Add to Queue'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .download_outlined,
                                                        ),
                                                        title: const Text(
                                                            'Download'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons.share,
                                                        ),
                                                        title:
                                                            const Text('Share'),
                                                        onTap: () {},
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  child: Card(
                                                    elevation: 10,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10,
                                                      ),
                                                    ),
                                                    child: Image.network(
                                                      sImg,
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: size.height * 0.2,
                                                  child: Text(
                                                    sText,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12)
                            .copyWith(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              child: Text(
                                'Recently Played',
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                itemCount: recentSongText.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  final sText = recentSongText[idx];
                                  final sdText = recentDescText[idx];
                                  final sImg = recentSongImg[idx];
                                  return RecentlyPlayedWidget(
                                    recentAlbumText: sText,
                                    recentAlbumDescText: sdText,
                                    recentSongImg: sImg,
                                    recHeadColor: blackColor,
                                    recDescColor: recdescColor,
                                    // icon: Icons.play_circle_fill_outlined,
                                    widgett: const SizedBox(),
                                    onPressed: () {},
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => SongOpenScreen(
                                            sTitle: sText,
                                            sName: sdText,
                                            sImg: sImg,
                                          ),
                                        ),
                                      );
                                    },
                                    onLongPressed: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .play_arrow_outlined,
                                                        ),
                                                        title: const Text(
                                                            'Play now'),
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(Icons
                                                            .favorite_border),
                                                        title: const Text(
                                                            'Save to Library'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .queue_music_outlined,
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
                                                        title: const Text(
                                                            'Add to Queue'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .download_outlined,
                                                        ),
                                                        title: const Text(
                                                            'Download'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons.share,
                                                        ),
                                                        title:
                                                            const Text('Share'),
                                                        onTap: () {},
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  child: Card(
                                                    elevation: 10,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10,
                                                      ),
                                                    ),
                                                    child: Image.network(
                                                      sImg,
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: size.height * 0.2,
                                                  child: Text(
                                                    sText,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12)
                            .copyWith(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              child: Text(
                                'Now playing Pop',
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                itemCount: recentSongText.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  final sText = popSongText[idx];
                                  final sdText = popDescText[idx];
                                  final sImg = popSongImg[idx];
                                  return RecentlyPlayedWidget(
                                    recentAlbumText: sText,
                                    recentAlbumDescText: sdText,
                                    recentSongImg: sImg,
                                    recHeadColor: blackColor,
                                    recDescColor: recdescColor,
                                    // icon: Icons.play_circle_fill_outlined,
                                    widgett: const SizedBox(),
                                    onPressed: () {},
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => SongOpenScreen(
                                            sTitle: sText,
                                            sName: sdText,
                                            sImg: sImg,
                                          ),
                                        ),
                                      );
                                    },
                                    onLongPressed: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .play_arrow_outlined,
                                                        ),
                                                        title: const Text(
                                                            'Play now'),
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(Icons
                                                            .favorite_border),
                                                        title: const Text(
                                                            'Save to Library'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .queue_music_outlined,
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
                                                        title: const Text(
                                                            'Add to Queue'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .download_outlined,
                                                        ),
                                                        title: const Text(
                                                            'Download'),
                                                        onTap: () {},
                                                      ),
                                                      ListTile(
                                                        leading: const Icon(
                                                          Icons.share,
                                                        ),
                                                        title:
                                                            const Text('Share'),
                                                        onTap: () {},
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  child: Card(
                                                    elevation: 10,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10,
                                                      ),
                                                    ),
                                                    child: Image.network(
                                                      sImg,
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: size.height * 0.2,
                                                  child: Text(
                                                    sText,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                    ],
                  ),
                ),
              if (internal == 1)
                Container(
                  height: size.height,
                  width: double.maxFinite,
                  color: Colors.red,
                ),
              if (internal == 2)
                Container(
                  height: size.height,
                  color: Colors.blue,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Recent Search',
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
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
                          height: size.height * 0.26,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Trending',
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
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
                          height: size.height * 0.26,
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
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Channel',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.45,
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
          // const SizedBox(),
          // const MyLibraryScreen(),
        ],
      ),
      //
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whiteColor,
        currentIndex: index,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: blackColor,
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
      //
      bottomSheet: isBS
          ? GetBuilder<CurrentSongController>(
              builder: (controller) => BottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                onClosing: () {},
                builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isBS = false;
                      });
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => SongPlayerScreen(
                      //       audioPlayer: audioPlayer,
                      //       imgUrl: songImgPath,
                      //       count: controller.categories[0]
                      //           ? hindiSongs.length
                      //           : englishSongs.length,
                      //       curr: globalIndex,
                      //       songNames: controller.categories[0]
                      //           ? hindiSongs
                      //           : englishSongs,
                      //       songsImgUrls: controller.categories[0]
                      //           ? hindiSongsImgUrls
                      //           : englishSongsImgUrls,
                      //     ),
                      //   ),
                      // );
                    },
                    child: SizedBox(
                      height: size.height * 0.065,
                      width: size.width,
                      child: Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                songImgPath,
                                height: double.maxFinite,
                                fit: BoxFit.cover,
                                width: size.width * 0.15,
                              ),
                              const Spacer(),
                              SizedBox(
                                width: size.width * 0.65,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      songPath,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 18, color: blackColor,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      songPath,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        // fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  // con.categories[0] = true;
                                  // con.categories[1] = false;
                                  // if (con.categories[0]) {
                                  //   setState(() {
                                  //     if (con.isPlay) {
                                  //       if (con.index != index) {
                                  //         con.index = index;
                                  //         audioPlayer
                                  //             .play(AssetSource(hindiSongs[index]));
                                  //         return;
                                  //       }
                                  //       con.index = index;
                                  //       audioPlayer.pause();
                                  //       con.isPlay = false;
                                  //     } else {
                                  //       con.isPlay = true;
                                  //       con.index = index;
                                  //       audioPlayer.play(
                                  //         AssetSource(
                                  //           hindiSongs[index],
                                  //         ),
                                  //       );
                                  //     }
                                  //   });
                                  // }
                                  setState(() {
                                    if (isPlaying) {
                                      // if (controller.categories[0]) {
                                      //   controller.categories[0] = false;
                                      // }
                                      // if (controller.categories[1]) {
                                      //   controller.categories[1] = false;
                                      // }
                                      audioPlayer.pause();
                                      isPlaying = false;
                                      controller.isPlay = false;
                                    } else {
                                      // if (controller.categories[0]) {
                                      //   audioPlayer.play(AssetSource(songPath));
                                      //   isPlaying = true;
                                      //   controller.isPlay = true;
                                      //   return;
                                      // }
                                      // if (controller.categories[1]) {
                                      //   audioPlayer.play(AssetSource(songPath));
                                      //   isPlaying = true;
                                      //   controller.isPlay = true;
                                      //   return;
                                      // }
                                      isPaused = false;
                                      audioPlayer.resume();
                                      isPlaying = true;
                                      controller.isPlay = true;
                                    }
                                  });
                                },
                                icon: Icon(
                                  isPlaying
                                      ? Icons.pause_circle_filled
                                      : isPaused
                                          ? Icons.pause_circle_filled
                                          : Icons.play_circle_fill,
                                  size: 40,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            child: SliderTheme(
                              data: SliderThemeData(
                                thumbShape: SliderComponentShape.noThumb,
                              ),
                              child: SizedBox(
                                width: size.width,
                                height: 1,
                                child: Slider(
                                  activeColor: Colors.red,
                                  inactiveColor: Colors.white,
                                  min: 0,
                                  max: duration.inSeconds.toDouble(),
                                  value: position.inSeconds.toDouble(),
                                  onChanged: (newValue) {
                                    audioPlayer.seek(
                                      Duration(
                                        seconds: newValue.toInt(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : BottomSheet(
              onClosing: () {},
              builder: (context) {
                return PopScope(
                  canPop: true,
                  onPopInvoked: (didPop) {
                    // isPlayingg();
                  },
                  child: Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        onPressed: () {
                          // isPlayingg();
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                        ),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                          ),
                        ),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          SizedBox(
                            height: size.height * 0.4,
                            width: size.width,
                            child: PageView.builder(
                              // controller: pageController2,
                              itemCount: 2,
                              onPageChanged: (v) {
                                // setState(() {
                                //   index = v;
                                //   pageController2.jumpToPage(v);
                                //   pageController.jumpToPage(v);
                                //   isPlaying = true;
                                //   widget.audioPlayer.stop().then((value) {
                                //     setState(() {
                                //       widget.audioPlayer.play(
                                //         AssetSource(
                                //           widget.songNames[v],
                                //         ),
                                //       );
                                //     });
                                //   });
                                // });
                              },
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, idex) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    hindiSongsImgUrls[index],
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                            //     CarouselSlider.builder(
                            //   itemCount: widget.songsImgUrls.length,
                            //   carouselController: carouselController,
                            //   itemBuilder: (_, idx, realIndex) {
                            //     return Image.network(
                            //       widget.songsImgUrls[idx],
                            //       fit: BoxFit.cover,
                            //     );
                            //   },
                            //   options: CarouselOptions(
                            //     viewportFraction: 0.65,
                            //     aspectRatio: 0.9,
                            //     scrollDirection: Axis.horizontal,
                            //     onPageChanged: (idx, reason) {
                            //       setState(() {
                            //         index = idx;
                            //         pageController.jumpToPage(index);
                            //       });
                            //     },
                            //   ),
                            // ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          SizedBox(
                            height: 100,
                            child: PageView.builder(
                              // controller: pageController,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) => SizedBox(
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.75,
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              ' widget.songNames[index]',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 18, color: blackColor,
                                                // fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              ' widget.songNames[index]',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                                // fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.more_vert_rounded,
                                          size: 35,
                                          color: blackColor,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Slider(
                            min: 0,
                            max: duration.inSeconds.toDouble(),
                            value: position.inSeconds.toDouble(),
                            label:
                                '${position.toString().split('.')[0].split(':')[1]} : ${position.toString().split('.')[0].split(':')[2]}',
                            activeColor: Colors.pink.shade600,
                            thumbColor: Colors.pink.shade500,
                            inactiveColor: Colors.pink.shade200,
                            onChanged: (v) {
                              setState(() {
                                audioPlayer.seek(Duration(seconds: v.toInt()));
                              });
                            },
                          ),
                          GetBuilder<CurrentSongController>(
                            builder: (currSongController) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    currSongController.position
                                        .toString()
                                        .split('.')[0],
                                  ),
                                  Text(
                                    currSongController.duration
                                        .toString()
                                        .split('.')[0],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  size: 35,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // index -= 1;
                                  // if (index >= 0) {
                                  //   setState(() {
                                  //     // _currentSongController.index = index;
                                  //     // _currentSongController.songTitle =
                                  //     //     widget.songNames[index];
                                  //     // _currentSongController.songImgPath =
                                  //     //     widget.songNames[index];
                                  //     pageController2.jumpToPage(index);
                                  //     pageController.jumpToPage(index);
                                  //     setPlayer(index);
                                  //   });
                                  // }
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 35,
                                ),
                              ),
                              GetBuilder<CurrentSongController>(
                                builder: (cSC) => IconButton(
                                  onPressed: () {
                                    // if (cSC.isPlay) {
                                    //   cSC.isPlay = false;
                                    //   cSC.index = index;
                                    //   widget.audioPlayer.pause();
                                    // }
                                    setState(() {
                                      if (isPlaying) {
                                        isPlaying = false;
                                        audioPlayer.pause();
                                      } else {
                                        isPlaying = true;
                                        // setPlayer(index);
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    isPlaying
                                        ? Icons.pause_circle_filled
                                        : Icons.play_circle_fill,
                                    size: 65,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  index += 1;
                                  // if (index < widget.songNames.length) {
                                  //   setState(() {
                                  //     // _currentSongController.index = index;
                                  //     // _currentSongController.songTitle =
                                  //     //     widget.songNames[index];
                                  //     // _currentSongController.songImgPath =
                                  //     //     widget.songNames[index];
                                  //     pageController2.jumpToPage(index);
                                  //     pageController.jumpToPage(index);
                                  //     setPlayer(index);
                                  //   });
                                  // }
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 35,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.music_note_outlined,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
