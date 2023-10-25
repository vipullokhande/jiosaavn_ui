import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/colors.dart';

// ignore: must_be_immutable
class SongPlayerScreen extends StatefulWidget {
  final String imgUrl;
  const SongPlayerScreen({
    super.key,
    required this.imgUrl,
  });

  @override
  State<SongPlayerScreen> createState() => _SongPlayerScreenState();
}

class _SongPlayerScreenState extends State<SongPlayerScreen> {
  final carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var val = 0.5;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
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
              child:
                  // PageView.builder(
                  //   controller: PageController(
                  //     viewportFraction: 0.75,
                  //   ),
                  //   itemCount: 5,
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (_, index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Image.network(
                  //         widget.imgUrl,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     );
                  //   },
                  // ),
                  CarouselSlider.builder(
                itemCount: 5,
                carouselController: carouselController,
                itemBuilder: (_, idx, inde) {
                  return Image.network(
                    'https://upload.wikimedia.org/wikipedia/en/2/26/Wanted7.jpg',
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 0.65,
                  aspectRatio: 0.9,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {},
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
            Slider(
              min: 0,
              max: 4,
              divisions: 4,
              value: val,
              label: val.toString(),
              activeColor: Colors.pink.shade600,
              thumbColor: Colors.pink.shade500,
              inactiveColor: Colors.pink.shade200,
              onChangeStart: (value) {
                setState(() {
                  val = value;
                });
              },
              onChangeEnd: (value) {
                setState(() {
                  val = value;
                });
              },
              onChanged: (v) {
                setState(() {
                  val = v;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'data',
                  ),
                  Text(
                    'data',
                  ),
                ],
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle_fill_outlined,
                    size: 65,
                  ),
                ),
                IconButton(
                  onPressed: () {},
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
    );
  }
}
