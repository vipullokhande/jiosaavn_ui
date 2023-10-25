import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/colors.dart';
import 'package:jiosaavn_vip/ui/my_library_screen.dart';
import 'package:jiosaavn_vip/ui/song_open_screen.dart';
import 'package:jiosaavn_vip/ui/song_player_screen.dart';
import 'package:jiosaavn_vip/ui/song_sliver_screen.dart';
import 'package:jiosaavn_vip/widgets/app_bar_text.dart';
import 'package:jiosaavn_vip/widgets/recently_played_widget.dart';
import 'package:jiosaavn_vip/widgets/search_item.dart';
import 'package:jiosaavn_vip/widgets/single_channel_item_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int internal = 0;
  int index = 0;

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
  @override
  Widget build(BuildContext context) {
    var editController = TextEditingController();
    var size = MediaQuery.of(context).size;
    var searchController = ScrollController();
    final sController = ScrollController();

    return Scaffold(
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
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            height: double.maxFinite,
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  width: size.width * 0.9,
                                                  height: size.height * 0.45,
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
                                                  child: ListView(
                                                    scrollDirection:
                                                        Axis.vertical,
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
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            height: double.maxFinite,
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  width: size.width * 0.9,
                                                  height: size.height * 0.45,
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
                                                  child: ListView(
                                                    scrollDirection:
                                                        Axis.vertical,
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
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            height: double.maxFinite,
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  width: size.width * 0.9,
                                                  height: size.height * 0.45,
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
                                                  child: ListView(
                                                    scrollDirection:
                                                        Axis.vertical,
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
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            height: double.maxFinite,
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  width: size.width * 0.9,
                                                  height: size.height * 0.45,
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
                                                  child: ListView(
                                                    scrollDirection:
                                                        Axis.vertical,
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
      bottomSheet: BottomSheet(
        backgroundColor: const Color.fromARGB(255, 234, 229, 229),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        onClosing: () {},
        builder: (_) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SongPlayerScreen(
                    imgUrl:
                        'https://upload.wikimedia.org/wikipedia/en/2/26/Wanted7.jpg',
                  ),
                ),
              );
            },
            child: SizedBox(
              height: size.height * 0.065,
              // color: Colors.red,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/en/2/26/Wanted7.jpg',
                    fit: BoxFit.cover,
                    width: size.width * 0.14,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Wanted',
                        style: TextStyle(
                          fontSize: 18, color: blackColor,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'wanted',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          // fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.play_arrow,
                      size: 35,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
