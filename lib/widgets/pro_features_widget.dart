import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class ProFeaturesWidget extends StatelessWidget {
  final String feature;
  const ProFeaturesWidget({
    super.key,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 4.r,
          ),
          SizedBox(
            width: 15.w,
          ),
          SizedBox(
            width: 100,
            child: Text(
              feature,
              maxLines: 2,
              style: TextStyle(
                fontSize: 16.sp,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
