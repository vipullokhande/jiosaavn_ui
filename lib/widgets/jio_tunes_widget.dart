import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      margin:  EdgeInsets.symmetric(
        vertical: 7.h,
      ).copyWith(right: 5.w),
      height: 190.h,
      width: 125.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: RadialGradient(
          colors: gradient,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22.sp,
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
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                imgUrl,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
