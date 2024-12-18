// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musi/models/songs.dart';

class SongsProvider extends ChangeNotifier {
  final List<Songs> _songs = [
    Songs(
        songName: "You Say Run",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/you_say_run.jpg",
        songPath: 'songs/you_say_run.mp3'),
    Songs(
        songName: "Aashayein",
        songAlbum: "Iqbal",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/aashayein.jpg",
        songPath: 'songs/aashayein.mp3'),
    Songs(
        songName: "Curtain Call",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/curtain_call.jpg",
        songPath: 'songs/curtain_call.mp3'),
    Songs(
        songName: "Funked Up (Slowed)",
        songAlbum: "Single",
        songArtist: "XXANETERIA",
        songImagePath: "assets/images/funked_up.jpg",
        songPath: 'songs/funked_up.mp3'),
    Songs(
        songName: "Lakshya",
        songAlbum: "Lakshya",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/lakshya.jpg",
        songPath: 'songs/lakshya.mp3'),
    Songs(
        songName: "Snowfall (Slowed)",
        songAlbum: "",
        songArtist: "Oneheart and Reindishi",
        songImagePath: "assets/images/snowfall.jpg",
        songPath: 'songs/snowfall(slowed).mp3'),
    Songs(
        songName: "You Say Run",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/you_say_run.jpg",
        songPath: 'songs/you_say_run.mp3'),
    Songs(
        songName: "Aashayein",
        songAlbum: "Iqbal",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/aashayein.jpg",
        songPath: 'songs/aashayein.mp3'),
    Songs(
        songName: "Curtain Call",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/curtain_call.jpg",
        songPath: 'songs/curtain_call.mp3'),
    Songs(
        songName: "Funked Up (Slowed)",
        songAlbum: "Single",
        songArtist: "XXANETERIA",
        songImagePath: "assets/images/funked_up.jpg",
        songPath: 'songs/funked_up.mp3'),
    Songs(
        songName: "Lakshya",
        songAlbum: "Lakshya",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/lakshya.jpg",
        songPath: 'songs/lakshya.mp3'),
    Songs(
        songName: "Snowfall (Slowed)",
        songAlbum: "",
        songArtist: "Oneheart and Reindishi",
        songImagePath: "assets/images/snowfall.jpg",
        songPath: 'songs/snowfall(slowed).mp3'),
    Songs(
        songName: "You Say Run",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/you_say_run.jpg",
        songPath: 'songs/you_say_run.mp3'),
    Songs(
        songName: "Aashayein",
        songAlbum: "Iqbal",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/aashayein.jpg",
        songPath: 'songs/aashayein.mp3'),
    Songs(
        songName: "Curtain Call",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/curtain_call.jpg",
        songPath: 'songs/curtain_call.mp3'),
    Songs(
        songName: "Funked Up (Slowed)",
        songAlbum: "Single",
        songArtist: "XXANETERIA",
        songImagePath: "assets/images/funked_up.jpg",
        songPath: 'songs/funked_up.mp3'),
    Songs(
        songName: "Lakshya",
        songAlbum: "Lakshya",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/lakshya.jpg",
        songPath: 'songs/lakshya.mp3'),
    Songs(
        songName: "Snowfall (Slowed)",
        songAlbum: "",
        songArtist: "Oneheart and Reindishi",
        songImagePath: "assets/images/snowfall.jpg",
        songPath: 'songs/snowfall(slowed).mp3'),
    Songs(
        songName: "You Say Run",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/you_say_run.jpg",
        songPath: 'songs/you_say_run.mp3'),
    Songs(
        songName: "Aashayein",
        songAlbum: "Iqbal",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/aashayein.jpg",
        songPath: 'songs/aashayein.mp3'),
    Songs(
        songName: "Curtain Call",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/curtain_call.jpg",
        songPath: 'songs/curtain_call.mp3'),
    Songs(
        songName: "Funked Up (Slowed)",
        songAlbum: "Single",
        songArtist: "XXANETERIA",
        songImagePath: "assets/images/funked_up.jpg",
        songPath: 'songs/funked_up.mp3'),
    Songs(
        songName: "Lakshya",
        songAlbum: "Lakshya",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/lakshya.jpg",
        songPath: 'songs/lakshya.mp3'),
    Songs(
        songName: "Snowfall (Slowed)",
        songAlbum: "",
        songArtist: "Oneheart and Reindishi",
        songImagePath: "assets/images/snowfall.jpg",
        songPath: 'songs/snowfall(slowed).mp3'),
    Songs(
        songName: "You Say Run",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/you_say_run.jpg",
        songPath: 'songs/you_say_run.mp3'),
    Songs(
        songName: "Aashayein",
        songAlbum: "Iqbal",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/aashayein.jpg",
        songPath: 'songs/aashayein.mp3'),
    Songs(
        songName: "Curtain Call",
        songAlbum: "Original Soundtrack",
        songArtist: "Yuki Hayashi",
        songImagePath: "assets/images/curtain_call.jpg",
        songPath: 'songs/curtain_call.mp3'),
    Songs(
        songName: "Funked Up (Slowed)",
        songAlbum: "Single",
        songArtist: "XXANETERIA",
        songImagePath: "assets/images/funked_up.jpg",
        songPath: 'songs/funked_up.mp3'),
    Songs(
        songName: "Lakshya",
        songAlbum: "Lakshya",
        songArtist: "Shankar Ehsaan Loy",
        songImagePath: "assets/images/lakshya.jpg",
        songPath: 'songs/lakshya.mp3'),
    Songs(
        songName: "Snowfall (Slowed)",
        songAlbum: "",
        songArtist: "Oneheart and Reindishi",
        songImagePath: "assets/images/snowfall.jpg",
        songPath: 'songs/snowfall(slowed).mp3'),
  ];

  int? _currentSongIndex;
  // final AudioPlayer _audioPlayer = AudioPlayer();

  // SongsProvider() {
  //   listenToDuration();
  // }

  // Duration _currentDuration = Duration.zero;
  // Duration _totalDuration = Duration.zero;

  // bool _isPlaying = false;
  //Getters
  List<Songs> get songs => _songs;
  int? get currentSongIndex => _currentSongIndex;
  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    notifyListeners();
  }
  // bool get isPlaying => _isPlaying;
  // Duration get currentDuration => _currentDuration;
  // Duration get totalDuration => _totalDuration;

  //set current song Index;
  // set currentSongIndex(int? newIndex) {
  //   _currentSongIndex = newIndex;

  //   if (newIndex != null) {
  //     play();
  //   }
  //   notifyListeners();
  // }

  //Functions that control the song
  // void play() async {
  //   final String path = _songs[_currentSongIndex!].songPath.toString();
  //   await _audioPlayer.stop();
  //   await _audioPlayer.play(AssetSource(path));
  //   _isPlaying = true;
  //   notifyListeners();
  // }

  // void pause() async {
  //   await _audioPlayer.pause();
  //   _isPlaying = false;
  //   notifyListeners();
  // }

  // void resume() async {
  //   await _audioPlayer.resume();
  //   _isPlaying = true;
  //   notifyListeners();
  // }

  // void pauseOrResume() {
  //   if (_isPlaying) {
  //     pause();
  //   } else {
  //     resume();
  //   }
  //   notifyListeners();
  // }

  // void seek(Duration position) async {
  //   await _audioPlayer.seek(position);
  //   notifyListeners();
  // }

  // void playNextSong() {
  //   if (_currentSongIndex != null) {
  //     if (_currentSongIndex != songs.length - 1) {
  //       _currentSongIndex = _currentSongIndex! + 1;
  //     } else {
  //       _currentSongIndex = 0;
  //     }
  //   }
  // }

  // void playPreviousSong() {
  //   if (_currentSongIndex != null) {
  //     if (_currentSongIndex != 0) {
  //       _currentSongIndex = _currentSongIndex! - 1;
  //     } else {
  //       _currentSongIndex = songs.length - 1;
  //     }
  //   }
  // }

  // void updateCurrentDuration(double newPosition) {
  //   _audioPlayer.onPositionChanged.listen((newPosition) {
  //     _currentDuration = newPosition;
  //     notifyListeners();
  //   });
  // }

  // void listenToDuration() {
  //   _audioPlayer.onDurationChanged.listen((newDuration) {
  //     _totalDuration = newDuration;
  //     notifyListeners();
  //   });

  //   _audioPlayer.onPlayerComplete.listen((event) {});
  // }

  //setter for Provider
}
