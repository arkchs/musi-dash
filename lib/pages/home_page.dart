import 'package:flutter/material.dart';
import 'package:musi/components/library_list.dart';
import 'package:musi/components/my_search_bar.dart';
import 'package:musi/components/songs_lists.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/pages/mini_music_player.dart';
import 'package:musi/pages/settings_page.dart';
import 'package:musi/pages/temp.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SettingsPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => _widgetOptions.elementAt(index)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //     suggestionsBuilder: (context, controller) => temp(),
                //     builder: (context, controller) => Text("Hellow")),
                const MySearchBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                  child: Text(
                    'Quick Picks',
                    style: Theme.of(context).textTheme.mainHeading,
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    child: const SongsList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                  child: Text(
                    'Covers and Remixes',
                    style: Theme.of(context).textTheme.mainHeading,
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    child: const SongsList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Text(
                    'Albums',
                    style: Theme.of(context).textTheme.mainHeading,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: const LibraryList(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Provider.of<SongsProvider>(context, listen: false)
                  .currentSongIndex ==
              null
          ? BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download), label: 'Downloads'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.music_note), label: 'Playlists'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.radio), label: 'Account'),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
              onTap: _onItemTapped,
            )
          : MiniPlayer(
              index: Provider.of<SongsProvider>(context, listen: false)
                  .currentSongIndex!),
    );
  }
}
