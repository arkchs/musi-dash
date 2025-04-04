import 'package:flutter/material.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:musi/models/songs_provider.dart';
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
