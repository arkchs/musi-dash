import 'dart:async';

import 'package:flutter/material.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/pages/songs_page.dart';
import 'package:provider/provider.dart';

class MiniPlayer extends StatefulWidget {
  final int index;
  const MiniPlayer({super.key, required this.index});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  get index => null;

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
    return Consumer<SongsProvider>(builder: (context, value, child) {
      final String title = value.songs[widget.index].songName.toString();
      final String imagePath =
          value.songs[widget.index].songImagePath.toString();
      return ListTile(
        onTap: () {
          _routeSongsPage(widget.index);
        },
        title: Text(title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.mediumHeading.copyWith(
                color: Provider.of<ThemeProvider>(context).isDarkMode
                    ? Colors.white
                    : Colors.black)),
        subtitle: Text(
          title,
          style: Theme.of(context).textTheme.smallHeadings.copyWith(
              color: Provider.of<ThemeProvider>(context).isDarkMode
                  ? Colors.white70
                  : Colors.black),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              onPressed: () {},
            ),
          ],
        ),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imagePath,
              height: 50.0,
            )),
      );
    });
  }
}
