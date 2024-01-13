import 'package:flutter/material.dart';

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
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.red,
            radius: 4,
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 100,
            child: Text(
              feature,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
