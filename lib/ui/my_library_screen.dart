import 'package:flutter/material.dart';

class MyLibraryScreen extends StatelessWidget {
  const MyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> libTitles = [
      'Songs',
      'Albums',
      'Artists',
      'Shows',
      'Downloads',
      'Playlists',
      'Videos'
    ];
    List<IconData> libIcons = [
      Icons.music_note,
      Icons.album,
      Icons.headset_mic_outlined,
      Icons.broadcast_on_home,
      Icons.download_for_offline_outlined,
      Icons.playlist_play_rounded,
      Icons.videocam_outlined,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(71, 0, 0, 0),
                  offset: Offset(3, 6),
                ),
                BoxShadow(
                  color: Color.fromARGB(128, 82, 238, 217),
                  offset: Offset(6, 12),
                ),
              ],
              color: const Color.fromARGB(255, 237, 237, 237),
              borderRadius: BorderRadius.circular(14),
            ),
            height: size.height * 0.5,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: libTitles.length,
                itemBuilder: (_, index) {
                  var lTitle = libTitles[index];
                  var lIcon = libIcons[index];
                  return ListTile(
                    contentPadding:
                        EdgeInsets.only(left: size.width * 0.05, top: 3),
                    leading: Icon(lIcon),
                    title: Text(lTitle),
                    trailing: TextButton.icon(
                      onPressed: () {},
                      icon: const Text('0'),
                      label: const Icon(Icons.arrow_forward_ios),
                    ),
                    onTap: () {},
                  );
                }),
          ),
          // Expanded(child: ListView.builder(itemBuilder: (_,idx){}))
        ],
      ),
    );
  }
}
