import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:musi/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  get splash => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: LottieBuilder.asset("assets/anim/splashAnimation.json"),
      nextScreen: const HomePage(),
      splashIconSize: 400,
      animationDuration: const Duration(milliseconds: 400),
    );
  }
}