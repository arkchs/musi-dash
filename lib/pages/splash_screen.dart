import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:musi/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  get splash => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: LottieBuilder.asset("assets/startupAnim.json"),
      nextScreen: const HomePage(),
      splashIconSize: 400,
      animationDuration: const Duration(milliseconds: 400),
    );
  }
}
