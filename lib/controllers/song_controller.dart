import 'package:firebase_storage/firebase_storage.dart';
import 'package:just_audio/just_audio.dart';

class SongController {
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<List<Reference>> fetchSongs(String type) async {
    try {
      // 1. Get a clean reference to the folder
      // Ensure 'type' is exactly 'hindi' or 'songs' (no slashes)
      final folderRef = FirebaseStorage.instance.ref(type.trim());

      // 2. Perform the list
      final ListResult result = await folderRef.listAll();

      print("Found ${result.items.length} items in $type");
      return result.items;
    } on FirebaseException catch (e) {
      // If you see 'unauthorized', it's the Rules.
      // If you see 'object-not-found', the folder name is wrong.
      print("Firebase Error: ${e.code} - ${e.message}");
      return [];
    }
  }

  playSong(String url) async {
    await audioPlayer.setUrl(url);
    await audioPlayer.play();
  }

  pauseSong() async {
    await audioPlayer.pause();
  }
}
