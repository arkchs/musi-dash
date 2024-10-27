import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:musi/models/songs.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/pages/songs_page.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

class SongsList extends StatefulWidget {
  const SongsList({super.key});

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
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

  Future<PaletteColor?> _updatePaletteGenerator(image) async {
    PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
      image,
      maximumColorCount: 20,
    );
    return palette.dominantColor;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SongsProvider>(
      builder: (context, value, child) {
        return PageView.builder(
            itemCount: 5,
            controller: PageController(viewportFraction: 0.9),
            itemBuilder: (BuildContext context, int itemIndex) {
              int listLen = 6;
              List<Songs> song = [];
              List<String> title = [];
              List<String> subtitle = [];
              List<String> imagePath = [];
              for (int i = 0; i < listLen; i++) {
                song.add(value.songs[i + itemIndex * listLen]);
                title.add(song[i].songName.toString());
                subtitle.add(song[i].songArtist.toString());
                imagePath.add(song[i].songImagePath.toString());
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: song.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: ListTile(
                          onTap: () {
                            _updatePaletteGenerator(
                                    AssetImage(imagePath[index]))
                                .then((PaletteColor? color) {
                              if (color != null) {}
                            });
                            _routeSongsPage(index);
                            value.currentSongIndex = index;
                          },
                          title: Text(
                              "${title[index]} ${index + itemIndex * listLen + 1}",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .mediumHeading
                                  .copyWith(
                                      color: Provider.of<ThemeProvider>(context)
                                              .isDarkMode
                                          ? Colors.white
                                          : Colors.black)),
                          subtitle: Text(
                            subtitle[index],
                            style: Theme.of(context)
                                .textTheme
                                .smallHeadings
                                .copyWith(
                                    color: Provider.of<ThemeProvider>(context)
                                            .isDarkMode
                                        ? Colors.white70
                                        : Colors.black),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Hero(
                              tag: 'cover-image$index',
                              child: Image.asset(
                                imagePath[index],
                                height: 50.0,
                              ),
                            ),
                          ),
                        ),
                      ));
            });
      },
    );
  }
}
