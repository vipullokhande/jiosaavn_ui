import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod_logic/music_riverpod.dart';

class RiverpodFavouriteSongScreen extends ConsumerStatefulWidget {
  const RiverpodFavouriteSongScreen({super.key});

  @override
  ConsumerState<RiverpodFavouriteSongScreen> createState() =>
      _RiverpodFavouriteSongScreenState();
}

class _RiverpodFavouriteSongScreenState
    extends ConsumerState<RiverpodFavouriteSongScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteSongsProvider = ref.read(favouriteSongsRiverPodProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Total favourite songs ${favouriteSongsProvider.length}'),
      ),
      body: SizedBox(
        height: double.maxFinite,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: favouriteSongsProvider.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(favouriteSongsProvider[index].title),
          ),
        ),
      ),
    );
  }
}
