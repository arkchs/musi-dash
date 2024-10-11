import 'package:flutter/material.dart';

class Songs extends ChangeNotifier {
  String? songName;
  String? songImagePath;
  String? songPath;
  String? songAlbum;
  String? songArtist;

  Songs(
      {required this.songName,
      required this.songAlbum,
      required this.songArtist,
      required this.songImagePath,
      required this.songPath});
}
