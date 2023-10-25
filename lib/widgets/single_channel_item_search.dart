import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(channelImgBack),
          opacity: 0.6,
          fit: BoxFit.fill,
        ),
      ),
      child: Text(
        channelText,
        style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
