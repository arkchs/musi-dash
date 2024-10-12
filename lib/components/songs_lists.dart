import 'package:flutter/material.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/constants/theme/theme_provider.dart';
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
        // scrollDirection: Axis.horizontal,
        itemCount: value.songs.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: ListTile(
            onTap: () {
              _routeSongsPage(index);
            },
            title: Text(value.songs[index].songName.toString(),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.mediumHeading.copyWith(
                    color: Provider.of<ThemeProvider>(context).isDarkMode
                        ? Colors.white
                        : Colors.black)),
            subtitle: Text(
              value.songs[index].songArtist.toString(),
              style: Theme.of(context).textTheme.smallHeadings.copyWith(
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? Colors.white70
                      : Colors.black),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Hero(
                  tag: 'cover-image$index',
                  child: Image.asset(
                    value.songs[index].songImagePath.toString(),
                    height: 50.0,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
