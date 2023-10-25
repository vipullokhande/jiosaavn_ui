import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/widgets/song_widget.dart';

// ignore: must_be_immutable
class SongOpenScreen extends StatefulWidget {
  String sTitle;
  String sName;
  String sImg;
  SongOpenScreen({
    super.key,
    required this.sTitle,
    required this.sName,
    required this.sImg,
  });

  @override
  State<SongOpenScreen> createState() => _SongOpenScreenState();
}

class _SongOpenScreenState extends State<SongOpenScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
    // Container(
    //     child: SafeArea(
    //   bottom: false,
    //   right: false,
    //   left: false,
    //   child:
    return Scaffold(
      backgroundColor: Colors.teal.shade300,
      body: Column(
        // scrollDirection: Axis.vertical,
        children: [
          Container(
            decoration: BoxDecoration(
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
            height: size.height * 0.5,
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
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
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
                                widget.sImg,
                                fit: BoxFit.cover,
                                height: size.height * 0.17,
                                width: size.width * 0.4,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              widget.sTitle,
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
                      widget.sTitle,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: size.height * 0.5,
            child: ListView(
              children: [
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
                SongWidget(
                  title: widget.sTitle,
                  desc: widget.sName,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
