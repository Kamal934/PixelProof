import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pixelproof/screens/image_upload_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset(
          'assets/lottie/applogo.json',
          width: 250, // Adjust width as needed
          fit: BoxFit.cover, // Ensures the animation fits well
        ),
      ),
      nextScreen: const ImageUploadScreen(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 4000, // 4 seconds
      backgroundColor: Colors.white,
    );
  }
}
