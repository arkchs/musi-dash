import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musi/components/utility_options.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/pages/songs_page.dart';
import 'package:musi/services/audio_service.dart';
import 'package:provider/provider.dart';

class PlayerWidget extends StatefulWidget {
  final int? index;
  const PlayerWidget({
    super.key,
    required this.index,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayerWidgetState();
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {
  BorderRadius radius = BorderRadius.circular(20.0);

  bool get _isPlaying =>
      context.watch<AudioService>().playerState == PlayerState.playing;
  bool get _isPaused =>
      context.watch<AudioService>().playerState == PlayerState.paused;
  String get _durationText =>
      context.watch<AudioService>().duration?.toString().split('.').first ?? '';
  String get _positionText =>
      context.watch<AudioService>().position?.toString().split('.').first ?? '';

  @override
  void initState() {
    super.initState();
    final audioService = context.read<AudioService>();
    audioService.audioPlayer.onPlayerComplete.listen((event) {
      print('onPlayerComplete');
      int? cI = context.read<SongsProvider>().currentSongIndex;
      if (cI != null) {
        _skipToNext();
      }
    });
  }

  void _skipToPrevious() {
    int index = widget.index ?? 0;
    int numberOfSongs = context.read<SongsProvider>().songs.length;
    if (index == 0) {
      index = numberOfSongs - 1;
    } else {
      index = index - 1;
    }
    slideRouteBuilderAnimation(index, -1.0, 0.0);
  }

  void slideRouteBuilderAnimation(int index, double x, double y) {}

  void _skipToNext() {
    Navigator.pop(context);
    int index = widget.index ?? 0;
    int numberOfSongs = context.read<SongsProvider>().songs.length;
    if (index == numberOfSongs - 1) {
      index = 0;
    } else {
      index = index + 1;
    }
    slideRouteBuilderAnimation(index, 1.0, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final iconColor = Provider.of<ThemeProvider>(context).isDarkMode
        ? Colors.white70
        : Colors.black;
    final audioService = context.watch<AudioService>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: const RoundSliderOverlayShape(),
          ),
          child: Slider(
            onChanged: (value) {
              final duration = audioService.duration;
              if (duration == null) {
                return;
              }
              final position = value * duration.inMilliseconds;
              audioService.seek(Duration(milliseconds: position.round()));
            },
            value: (audioService.position != null &&
                    audioService.duration != null &&
                    audioService.position!.inMilliseconds > 0 &&
                    audioService.position!.inMilliseconds <
                        audioService.duration!.inMilliseconds)
                ? audioService.position!.inMilliseconds /
                    audioService.duration!.inMilliseconds
                : 0.0,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                audioService.position != null
                    ? '${_positionText.split(':')[1]}:${_positionText.split(':')[2]}'
                    : audioService.duration != null
                        ? _durationText
                        : '',
                style: Theme.of(context)
                    .textTheme
                    .smallHeadings
                    .copyWith(color: iconColor),
              ),
              Text(
                audioService.position != null
                    ? '${_durationText.split(':')[1]}:${_durationText.split(':')[2]}'
                    : audioService.duration != null
                        ? _durationText
                        : '',
                style: Theme.of(context)
                    .textTheme
                    .smallHeadings
                    .copyWith(color: iconColor),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
          child: CustomUtilityOptions(
            player: audioService.audioPlayer,
            radius: radius,
            color: color,
            iconColor: iconColor,
            isPlaying: _isPlaying,
            onPlay: audioService.play,
            onPause: audioService.pause,
            onSkipToNext: _skipToNext,
            onSkipToPrevious: _skipToPrevious,
          ),
        ),
      ],
    );
  }
}
