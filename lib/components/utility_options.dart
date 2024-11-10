import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CustomUtilityOptions extends StatelessWidget {
  final void Function()? onSkipToPrevious;
  final void Function()? onSkipToNext;
  final void Function()? onPlay;
  final void Function()? onPause;
  final AudioPlayer player;
  final Color color;
  final Color iconColor;
  final bool isPlaying;
  final BorderRadius radius;
  const CustomUtilityOptions({
    super.key,
    required this.onSkipToPrevious,
    required this.onSkipToNext,
    required this.color,
    required this.iconColor,
    this.onPlay,
    this.onPause,
    required this.isPlaying,
    required this.radius,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          key: const Key('favorite'),
          onPressed: () {},
          iconSize: 25.0,
          icon: Icon(Icons.favorite, color: iconColor),
          color: color,
        ),
        IconButton(
          key: const Key('play_previous'),
          onPressed: onSkipToPrevious,
          iconSize: 35.0,
          icon: Icon(Icons.skip_previous, color: iconColor),
          color: color,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
              borderRadius: radius,
              color: Theme.of(context).colorScheme.secondary),
          child: IconButton(
            key: const Key('play_button'),
            onPressed: isPlaying ? onPause : onPlay,
            iconSize: 45.0,
            icon: isPlaying
                ? Icon(Icons.pause, color: iconColor)
                : Icon(Icons.play_arrow, color: iconColor),
            color: color,
          ),
        ),
        IconButton(
          key: const Key('play_next'),
          onPressed: onSkipToNext,
          iconSize: 35.0,
          icon: Icon(Icons.skip_next, color: iconColor),
          color: color,
        ),
        RepeatButton(
          player: player,
          color: color,
        ),
      ],
    );
  }
}

class RepeatButton extends StatefulWidget {
  final AudioPlayer player;
  final Color color;
  const RepeatButton({super.key, required this.player, required this.color});

  @override
  State<RepeatButton> createState() => _RepeatButtonState();
}

class _RepeatButtonState extends State<RepeatButton> {
  bool _isLooping = false;

  void _toggleRepeat() {
    if (!_isLooping) {
      widget.player.setReleaseMode(ReleaseMode.loop).then((isLooping) {
        setState(() {
          _isLooping = !_isLooping;
        });
      });
    } else {
      widget.player.setReleaseMode(ReleaseMode.stop).then((isLooping) {
        setState(() {
          _isLooping = !_isLooping;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('repeat'),
      onPressed: _toggleRepeat,
      iconSize: 25.0,
      icon: _isLooping
          ? const Icon(Icons.repeat_one)
          : Icon(Icons.repeat, color: widget.color),
    );
  }
}
