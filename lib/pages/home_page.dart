import 'package:flutter/material.dart';
import 'package:musi/components/library_list.dart';
import 'package:musi/components/my_search_bar.dart';
import 'package:musi/components/songs_lists.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/components/mini_player.dart';
import 'package:musi/pages/settings_page.dart';
import 'package:musi/services/audio_service.dart';
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
    const SettingsPage(),
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
    Color color = Theme.of(context).colorScheme.inversePrimary;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                    height: MediaQuery.of(context).size.height * .35,
                    child: const SongsList(
                      verticalListLen: 4,
                      carouselPages: 5,
                    ),
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
                    height: MediaQuery.of(context).size.height * .35,
                    child: const SongsList(
                      verticalListLen: 4,
                      carouselPages: 5,
                    ),
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
                  height: MediaQuery.of(context).size.height * .3,
                  child: const LibraryList(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedCrossFade(
        firstChild: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: color,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.download,
                  color: color,
                ),
                label: 'Downloads'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.music_note,
                  color: color,
                ),
                label: 'Playlists'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.radio,
                  color: color,
                ),
                label: 'Account'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.radio,
                  color: color,
                ),
                label: 'random'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          onTap: _onItemTapped,
        ),
        secondChild: const MiniPlayer(),
        crossFadeState: Provider.of<AudioService>(context).hideMini == true
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 400),
      ),
    );
  }
}
