import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: Padding(
        padding: EdgeInsets.only(top: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: fontcolor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin:  EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
              alignment: Alignment.center,
              height: 4.h,
              width: 75.w,
              color: dividercolor,
              child: const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
