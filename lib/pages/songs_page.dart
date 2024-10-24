import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musi/components/audio_player_widget.dart';
import 'package:musi/components/neu_box.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:provider/provider.dart';

class SongsPage extends StatefulWidget {
  final int index;
  const SongsPage({super.key, required this.index});

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  late final AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    // Set the release mode to keep the source after playback has completed.
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    // Start the player as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await audioPlayer.setSource(AssetSource('songs/you_say_run.mp3'));
      await audioPlayer.resume();
    });
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Provider.of<ThemeProvider>(context).isDarkMode
        ? Colors.white70
        : Colors.black;
    return Scaffold(
      body: CustomScrollView(
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
                    GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (details.delta.dy > 0) {
                          Navigator.pop(context);
                        }
                      },
                      child: NeuBox(
                        color: Theme.of(context).colorScheme.background,
                        height: 300.0,
                        width: 300.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Hero(
                            tag: 'cover-image${widget.index}',
                            child: Image.asset(
                              value.songs[widget.index].songImagePath
                                  .toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
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
                      player: audioPlayer,
                      index: widget.index,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
