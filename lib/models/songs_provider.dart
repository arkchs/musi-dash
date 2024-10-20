// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musi/models/songs.dart';

class SongsProvider extends ChangeNotifier {
  final List<Songs> _songs = [
    Songs(
        songName: "Bohemian Rhapsody",
        songAlbum: "A Night at the Opera",
        songArtist: "Queen",
        songImagePath: "assets/song_cover_1.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
    Songs(
        songName: "Stairway to Heaven",
        songAlbum: "Led Zeppelin IV",
        songArtist: "Led Zeppelin",
        songImagePath: "assets/song_cover_2.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
    Songs(
        songName: "Hotel California",
        songAlbum: "Hotel California",
        songArtist: "Eagles",
        songImagePath: "assets/song_cover_3.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
    Songs(
        songName: "Sweet Child o' Mine",
        songAlbum: "Appetite for Destruction",
        songArtist: "Guns N' Roses",
        songImagePath: "assets/song_cover_4.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
    Songs(
        songName: "Imagine",
        songAlbum: "Imagine",
        songArtist: "John Lennon",
        songImagePath: "assets/song_cover_5.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
    Songs(
        songName: "Yesterday",
        songAlbum: "Help!",
        songArtist: "The Beatles",
        songImagePath: "assets/song_cover_6.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
    Songs(
        songName: "Billie Jean",
        songAlbum: "Thriller",
        songArtist: "Michael Jackson",
        songImagePath: "assets/song_cover_7.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
    Songs(
        songName: "Hey Jude",
        songAlbum: "The Beatles",
        songArtist: "The Beatles",
        songImagePath: "assets/song_cover_8.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
    Songs(
        songName: "Wonderwall",
        songAlbum: "(What's the Story) Morning Glory?",
        songArtist: "Oasis",
        songImagePath: "assets/song_cover_9.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
    Songs(
        songName: "Don't Stop Believin'",
        songAlbum: "Journey",
        songArtist: "Journey",
        songImagePath: "assets/song_cover_10.jpeg",
        songPath: 'assets/songs/you_say_run.mp3'),
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
