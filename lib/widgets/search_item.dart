import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/colors.dart';

class SearchSingle extends StatelessWidget {
  final String url;
  final String? songName;
  final String? songInfo;
  final IconData? icon;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  const SearchSingle({
    super.key,
    required this.url,
    required this.songName,
    required this.songInfo,
    required this.icon,
    required this.onTap,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          url,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        songName!,
        style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        songInfo!,
        style: const TextStyle(
          color: Color.fromARGB(255, 72, 72, 72),
        ),
      ),
      trailing: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
      onTap: onTap,
    );
  }
}
