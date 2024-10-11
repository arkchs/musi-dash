import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Slider(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              _position != null
                  ? '${_positionText.split(':')[1]}:${_positionText.split(':')[2]}'
                  : _duration != null
                      ? _durationText
                      : '',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              _position != null
                  ? '${_durationText.split(':')[1]}:${_durationText.split(':')[2]}'
                  : _duration != null
                      ? _durationText
                      : '',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              key: const Key('play_previous'),
              onPressed: () {
                Navigator.pop(context);
                int index = widget.index ?? 0;
                int numberOfSongs =
                    Provider.of<SongsProvider>(context, listen: false)
                        .songs
                        .length;
                if (index == 0) {
                  index = numberOfSongs - 1;
                } else {
                  index = index - 1;
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SongsPage(index: index)));
              },
              iconSize: 48.0,
              icon: const Icon(Icons.skip_previous),
              color: color,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).colorScheme.inversePrimary),
              child: IconButton(
                key: const Key('play_button'),
                onPressed: _isPlaying ? _pause : _play,
                iconSize: 48.0,
                icon: _isPlaying
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
                color: color,
              ),
            ),
            IconButton(
              key: const Key('play_next'),
              onPressed: () {
                Navigator.pop(context);
                int index = widget.index ?? 0;
                int numberOfSongs =
                    Provider.of<SongsProvider>(context, listen: false)
                        .songs
                        .length;
                if (index == numberOfSongs - 1) {
                  index = 0;
                } else {
                  index = index + 1;
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SongsPage(index: index)));
              },
              iconSize: 48.0,
              icon: const Icon(Icons.skip_next),
              color: color,
            ),
          ],
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
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
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
