import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String text;
  final Color fontcolor;
  final Color dividercolor;
  final VoidCallback onTap;
  const AppBarText({
    super.key,
    required this.text,
    required this.fontcolor,
    required this.dividercolor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: fontcolor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            alignment: Alignment.center,
            // padding: const EdgeInsets.symmetric(
            //   vertical: 5,
            //   horizontal: 8,
            // ),
            height: 6,
            width: 75,
            color: dividercolor,
            child: const SizedBox(),
          )
        ],
      ),
    );
  }
}
