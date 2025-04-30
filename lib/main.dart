import 'package:flutter/material.dart';
import 'package:musi/components/mini_player.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:musi/models/songs_provider.dart';
import 'package:musi/pages/downloads_page.dart';
import 'package:musi/pages/explore_page.dart';
import 'package:musi/pages/settings_page.dart';
import 'package:musi/pages/splash_screen.dart';
import 'package:musi/services/audio_service.dart';
import 'package:provider/provider.dart';

/// TODO 1: Add the dynamic theme and color picker package now
/// implement the logic
void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => SongsProvider()),
      ChangeNotifierProvider(create: (context) => AudioService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const ExplorePage(),
    const DownloadsPage(),
    const SettingsPage(),
    const SettingsPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.inversePrimary;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: AnimatedCrossFade(
        firstChild: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                icon: Icon(
                  Icons.home,
                  color: color,
                ),
                label: 'home'),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.download,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.download,
                color: color,
              ),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.music_note,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.music_note,
                color: color,
              ),
              label: 'Playlists',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.radio,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.radio,
                color: color,
              ),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.radio,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.radio,
                color: color,
              ),
              label: 'random',
            ),
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
