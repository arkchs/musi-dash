import 'package:flutter/material.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/pages/songs_page.dart';
import 'package:provider/provider.dart';

class SongsList extends StatefulWidget {
  const SongsList({super.key});

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  void _routeSongsPage(int index) {
    //play the song as soon as the song is touched.

    Navigator.push(
      context,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => SongsPage(
          index: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SongsProvider>(
      builder: (conext, value, child) => ListView.builder(
        itemCount: value.songs.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            onTap: () {
              _routeSongsPage(index);
            },
            title: Text(value.songs[index].songName.toString(),
                style: Theme.of(context).textTheme.mediumHeading),
            subtitle: Text(
              value.songs[index].songArtist.toString(),
              style: Theme.of(context).textTheme.smallHeadings,
            ),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Hero(
                    tag: 'cover-image$index',
                    child: Image.asset(
                        value.songs[index].songImagePath.toString()))),
          ),
        ),
      ),
    );
  }
}
