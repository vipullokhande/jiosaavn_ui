import 'package:flutter/material.dart';

import '../colors.dart';

class JioTunesWidget extends StatelessWidget {
  final String title;
  final String imgUrl;
  final List<Color> gradient;
  const JioTunesWidget({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(
        vertical: 7,
      ).copyWith(right: 5),
      height: 190,
      width: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: RadialGradient(
          colors: gradient,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: whiteColor,
              ),
            ),
          ),
          Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..rotateZ(
                15 * 3.1415927 / -140,
              ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imgUrl,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
