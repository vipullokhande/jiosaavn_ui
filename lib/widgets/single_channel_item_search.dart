import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleChannelSearchItem extends StatelessWidget {
  final String channelText;
  final String channelImgBack;
  const SingleChannelSearchItem({
    super.key,
    required this.channelText,
    required this.channelImgBack,
  });

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: NetworkImage(channelImgBack),
          opacity: 0.6,
          fit: BoxFit.fill,
        ),
      ),
      child: Text(
        channelText,
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
