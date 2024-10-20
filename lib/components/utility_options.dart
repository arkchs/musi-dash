import 'package:flutter/material.dart';

class CustomUtilityOptions extends StatelessWidget {
  final void Function()? onSkipToPrevious;
  final void Function()? onSkipToNext;
  final void Function()? onPlay;
  final void Function()? onPause;

  final Color color;
  final Color iconColor;
  final bool isPlaying;
  final BorderRadius radius;
  const CustomUtilityOptions(
      {super.key,
      required this.onSkipToPrevious,
      required this.onSkipToNext,
      required this.color,
      required this.iconColor,
      this.onPlay,
      this.onPause,
      required this.isPlaying,
      required this.radius});

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
        IconButton(
          key: const Key('repeat'),
          onPressed: () {},
          iconSize: 25.0,
          icon: Icon(Icons.repeat, color: iconColor),
          color: color,
        ),
      ],
    );
  }
}
