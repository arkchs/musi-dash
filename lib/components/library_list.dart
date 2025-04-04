import 'package:flutter/material.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:provider/provider.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SongsProvider>(
      builder: (context, value, child) => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: value.songs.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                // value.songs[index].songImagePath.toString(),
                "https://picsum.photos/300/300"),
          ),
        ),
      ),
    );
  }
}
