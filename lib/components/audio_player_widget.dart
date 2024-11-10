import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musi/components/utility_options.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/pages/songs_page.dart';
import 'package:provider/provider.dart';

class PlayerWidget extends StatefulWidget {
  final AudioPlayer player;
  final int? index;
  const PlayerWidget({
    required this.player,
    super.key,
    required this.index,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayerWidgetState();
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {
  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;
  // BoxShape shape = BoxShape.rectangle;
  BorderRadius radius = BorderRadius.circular(20.0);

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState == PlayerState.playing;
  bool get _isPaused => _playerState == PlayerState.paused;
  String get _durationText => _duration?.toString().split('.').first ?? '';
  String get _positionText => _position?.toString().split('.').first ?? '';
  AudioPlayer get player => widget.player;

  @override
  void initState() {
    super.initState();

    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {
            _duration = value;
          }),
        );
    player.getCurrentPosition().then(
          (value) => setState(() {
            _position = value;
          }),
        );
    _initStreams();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  void _skipToPrevious() {
    Navigator.pop(context);
    int index = widget.index ?? 0;
    int numberOfSongs =
        Provider.of<SongsProvider>(context, listen: false).songs.length;
    if (index == 0) {
      index = numberOfSongs - 1;
    } else {
      index = index - 1;
    }
    slideRouteBuilderAnimation(index, -1.0, 0.0);
  }

  void slideRouteBuilderAnimation(int index, double x, double y) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              Offset begin = Offset(x, y);
              Offset end = Offset.zero;
              final Tween<Offset> tween = Tween(begin: begin, end: end);
              final Animation<Offset> offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            pageBuilder: ((context, animation, secondaryAnimation) =>
                SongsPage(index: index))));
  }

  void _skipToNext() {
    Navigator.pop(context);
    int index = widget.index ?? 0;
    int numberOfSongs =
        Provider.of<SongsProvider>(context, listen: false).songs.length;
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: const RoundSliderOverlayShape(),
          ),
          child: Slider(
            onChanged: (value) {
              final duration = _duration;
              if (duration == null) {
                return;
              }
              final position = value * duration.inMilliseconds;
              player.seek(Duration(milliseconds: position.round()));
            },
            value: (_position != null &&
                    _duration != null &&
                    _position!.inMilliseconds > 0 &&
                    _position!.inMilliseconds < _duration!.inMilliseconds)
                ? _position!.inMilliseconds / _duration!.inMilliseconds
                : 0.0,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _position != null
                    ? '${_positionText.split(':')[1]}:${_positionText.split(':')[2]}'
                    : _duration != null
                        ? _durationText
                        : '',
                style: Theme.of(context)
                    .textTheme
                    .smallHeadings
                    .copyWith(color: iconColor),
              ),
              Text(
                _position != null
                    ? '${_durationText.split(':')[1]}:${_durationText.split(':')[2]}'
                    : _duration != null
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
            player: player,
            radius: radius,
            color: color,
            iconColor: iconColor,
            isPlaying: _isPlaying,
            onPlay: _play,
            onPause: _pause,
            onSkipToNext: _skipToNext,
            onSkipToPrevious: _skipToPrevious,
          ),
        ),
      ],
    );
  }

  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  Future<void> _play() async {
    setState(() {
      radius = BorderRadius.circular(15.0);
    });

    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    setState(() {
      radius = BorderRadius.circular(100.0);
    });
    await player.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }
}
