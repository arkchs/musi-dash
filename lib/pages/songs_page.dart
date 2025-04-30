import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:musi/components/audio_player_widget.dart';
import 'package:musi/components/mini_player.dart';
import 'package:musi/components/neu_box.dart';
import 'package:musi/constants/temp.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/services/audio_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SongsPage extends StatefulWidget {
  final int index;
  const SongsPage({super.key, required this.index});

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    // _animation = CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // );

    // Set the current song index in AudioService
    Provider.of<AudioService>(context, listen: false)
        .setCurrentSongIndex(widget.index);
    Provider.of<AudioService>(context, listen: false).setHideMini(false);

    // Set the audio source
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await http.post(Uri.parse("http://localhost:8000/api/songs/download"),
      //     body: jsonEncode({"filename": "youSayRun.mp3"}));

      await Provider.of<AudioService>(context, listen: false).setSource(
          Provider.of<SongsProvider>(context, listen: false)
                  .songs[widget.index]
                  .songPath ??
              "songs/blue.mp3");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<AudioService>(context, listen: false).play();
      });
    });
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    Navigator.of(context).pop();
    Provider.of<AudioService>(context).setHideMini(false);
    // _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Color iconColor = Provider.of<ThemeProvider>(context).isDarkMode
        ? Colors.white70
        : Colors.black;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Consumer<SongsProvider>(
                  builder: (context, value, child) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: size.height * .1,
                        ),
                        GestureDetector(
                          onVerticalDragUpdate: (details) {
                            if (details.delta.dy > 10) {
                              _handleDragUpdate(details);
                            }
                          },
                          child: NeuBox(
                            color: Theme.of(context).colorScheme.surface,
                            height: size.aspectRatio * size.height * .8,
                            width: (1 / size.aspectRatio) * size.width * .38,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                rdnImgLnk,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        Text(
                          value.songs[widget.index].songName.toString(),
                          style: Theme.of(context).textTheme.mainHeading,
                        ),
                        Text(
                          value.songs[widget.index].songArtist.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .mediumHeading
                              .copyWith(color: iconColor),
                        ),
                        PlayerWidget(
                          index: widget.index,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.playlist_add_outlined),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.dark_mode_outlined),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.lyrics_outlined),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.man_outlined),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_horiz),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: AnimatedBuilder(
          //     animation: _animation,
          //     builder: (context, child) {
          //       return Transform.translate(
          //         offset: Offset(0, 70 * _animation.value),
          //         child: const MiniPlayer(),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
