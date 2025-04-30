import "package:flutter/material.dart";
import "package:musi/components/app_bar.dart";
import "package:musi/constants/temp.dart";
import "package:musi/constants/theme/text_theme.dart";
import "package:musi/constants/theme/theme_provider.dart";
import "package:musi/models/songs.dart";
import "package:musi/models/songs_provider.dart";
import "package:musi/pages/songs_page.dart";
import "package:provider/provider.dart";

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});
  @override
  Widget build(BuildContext context) {
    void routeSongsPage(int index) {
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

    return SafeArea(
      child: Column(
        children: [
          const MyAppBar(title: "Downloads"),
          Consumer<SongsProvider>(
            builder: (context, value, child) {
              List<Songs> song = [];
              List<String> title = [];
              List<String> subtitle = [];
              List<String> imagePath = [];
              for (int i = 0; i < value.songs.length; i++) {
                song.add(value.songs[i]);
                title.add(song[i].songName.toString());
                subtitle.add(song[i].songArtist.toString());
                imagePath.add(song[i].songImagePath.toString());
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 0,
                ),
                itemBuilder: (context, index) => ListTile(
                  dense: true,
                  onTap: () {
                    // _updatePaletteGenerator(AssetImage(imagePath[index]))
                    //     .then((PaletteColor? color) {
                    //   if (color != null) {}
                    // });
                    routeSongsPage(index);
                    value.currentSongIndex = index;
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      // imagePath[index],
                      rdnImgLnk,
                    ),
                  ),
                  title: Text("${title[index]} $index",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.mediumHeading.copyWith(
                          color: Provider.of<ThemeProvider>(context).isDarkMode
                              ? Colors.white
                              : Colors.black)),
                  subtitle: Text(
                    subtitle[index],
                    style: Theme.of(context).textTheme.smallHeadings.copyWith(
                        color: Provider.of<ThemeProvider>(context).isDarkMode
                            ? Colors.white70
                            : Colors.black87),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
