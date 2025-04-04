import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/pages/songs_page.dart';
import 'package:musi/services/audio_service.dart';
import 'package:provider/provider.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 10000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

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

  void _handleDragUpdate() {
    Provider.of<AudioService>(context, listen: false).setHideMini(true);
    debugPrint("===========so far works?=================");
    Provider.of<AudioService>(context, listen: false).stop();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final iconColor = Provider.of<ThemeProvider>(context).isDarkMode
        ? Colors.white70
        : Colors.black;
    final audioService = context.watch<AudioService>();
    final songsProvider = context.watch<SongsProvider>();
    final currentIndex = audioService.currentSongIndex ?? 0;
    final currentSong = songsProvider.songs[currentIndex];

    return GestureDetector(
      onTap: () => _routeSongsPage(currentIndex),
      onVerticalDragUpdate: (details) => _handleDragUpdate(),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Song Image
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/300/300"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Song Info
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentSong.songName ?? 'Unknown Song',
                    style: Theme.of(context).textTheme.mediumHeading,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    currentSong.songArtist ?? 'Unknown Artist',
                    style: Theme.of(context).textTheme.smallHeadings.copyWith(
                          color: iconColor,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Playback Controls
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    audioService.playerState == PlayerState.playing
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: color,
                  ),
                  onPressed: () {
                    if (audioService.playerState == PlayerState.playing) {
                      audioService.pause();
                    } else {
                      audioService.play();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next, color: Colors.grey),
                  onPressed: () {
                    // Implement next song logic
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    audioService.stop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
