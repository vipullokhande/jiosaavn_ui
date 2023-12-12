import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/colors.dart';

// ignore: must_be_immutable
class SongSliverScreen extends StatefulWidget {
  String sTitle;
  String sName;
  String sImg;
  SongSliverScreen({
    super.key,
    required this.sTitle,
    required this.sName,
    required this.sImg,
  });

  @override
  State<SongSliverScreen> createState() => _SongSliverScreenState();
}

class _SongSliverScreenState extends State<SongSliverScreen> {
  // ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // controller: scrollController,
        scrollDirection: Axis.vertical,
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppbarDelegate(
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              sTitle: widget.sTitle,
              sName: widget.sName,
              sImg: widget.sImg,
            ),
            pinned: true,
            // floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 7,
                // crossAxisSpacing: 7,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              widget.sImg,
                              fit: BoxFit.cover,
                              width: double.maxFinite,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            widget.sTitle,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliverAppbarDelegate extends SliverPersistentHeaderDelegate {
  List<Color> one = [
    Colors.teal.shade300,
    Colors.teal.shade100,
    Colors.white,
  ];
  List<Color> two = [
    Colors.red.shade300,
    Colors.red.shade100,
    Colors.white,
  ];
  List<Color> three = [
    Colors.green.shade300,
    Colors.green.shade100,
    Colors.white,
  ];
  List<Color> four = [
    Colors.purple.shade300,
    Colors.purple.shade100,
    Colors.white,
  ];
  List<Color> five = [
    Colors.orange.shade300,
    Colors.orange.shade100,
    Colors.white,
  ];
  List<Color> onee = [
    Colors.pink,
    Colors.orange.shade200,
  ];
  List<Color> twoo = [
    Colors.blue,
    Colors.yellow.shade200,
  ];
  List<Color> threee = [
    Colors.cyan,
    Colors.orange.shade200,
  ];
  List<Color> fourr = [
    Colors.indigo,
    Colors.grey.shade200,
  ];
  List<Color> fivee = [
    Colors.red.shade400,
    Colors.pink.shade200,
  ];
  var random = Random().nextInt(6);
  double expandedHeight;
  String sName;
  String sTitle;
  String sImg;
  CustomSliverAppbarDelegate({
    required this.expandedHeight,
    required this.sName,
    required this.sTitle,
    required this.sImg,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // final top = expandedHeight - shrinkOffset - 60 / 2;
    final size = MediaQuery.of(context).size;
    return Stack(
      // alignment: Alignment.bottomCenter,
      // clipBehavior: Clip.antiAlias,

      children: [
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ),
              ),
            ],
          ),
        ),
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight,
          child: Container(
            // clipBehavior: Clip.antiAlias,
            // padding: EdgeInsets.only(top: size.height * 0.1),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.vertical(
              //   bottom: Radius.circular(20),
              // ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: random == 0
                    ? one
                    : random == 1
                        ? two
                        : random == 2
                            ? three
                            : random == 4
                                ? four
                                : random == 5
                                    ? five
                                    : [
                                        Colors.pink.shade300,
                                        Colors.pink.shade100,
                                        Colors.white,
                                      ],
              ),
            ),
            height: size.height * 0.6,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: whiteColor,
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.topRight,
                        height: size.height * 0.25,
                        width: size.width * 0.55,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: random == 0
                              ? onee
                              : random == 1
                                  ? twoo
                                  : random == 2
                                      ? threee
                                      : random == 4
                                          ? fourr
                                          : random == 5
                                              ? fivee
                                              : [
                                                  Colors.black,
                                                  Colors.red.shade300,
                                                ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.network(
                                  sImg,
                                  fit: BoxFit.cover,
                                  height: size.height * 0.17,
                                  width: size.width * 0.4,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                sTitle,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle,
                      color: Colors.teal,
                      size: 60,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        sTitle,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  //
                ],
              ),
            ),
          ),
        ),

        // Opacity(
        //   opacity: shrinkOffset / expandedHeight,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Image.network(
        //         sImg,
        //         height: 60,
        //         width: 60,
        //         fit: BoxFit.cover,
        //       ),
        //       IconButton(
        //         onPressed: () {},
        //         icon: const Icon(
        //           Icons.play_circle_fill_outlined,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(14),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: random == 0
                    ? one
                    : random == 1
                        ? two
                        : random == 2
                            ? three
                            : random == 4
                                ? four
                                : random == 5
                                    ? five
                                    : [
                                        Colors.pink.shade300,
                                        Colors.pink.shade100,
                                        Colors.white,
                                      ],
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: blackColor,
                ),
              ),
              centerTitle: true,
              title: SizedBox(
                width: size.width * 0.275,
                child: Stack(
                  children: [
                    ClipRRect(
                      // clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        sImg,
                        height: size.height * 0.065,
                        width: size.width * 0.145,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_circle_fill_outlined,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        //
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw UnimplementedError();
  }
}
