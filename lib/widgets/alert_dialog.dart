import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Lottie package for animations

class ShowAlert extends StatelessWidget {
  const ShowAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/lottie/lottie.json', // Add the correct Lottie animation file
              height: 150,
              width: 150,
              repeat: true,
            ),
            const SizedBox(height: 20),
            const Text('Scanning...', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
