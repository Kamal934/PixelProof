import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultDialog extends StatelessWidget {
  final String? prediction;
  final double? confidence;
  final bool isLoading;
  final VoidCallback onClose;
  final VoidCallback onRefresh; // Add onRefresh callback

  const ResultDialog({
    super.key,
    required this.prediction,
    required this.confidence,
    required this.isLoading,
    required this.onClose,
    required this.onRefresh, // Accept onRefresh callback
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading)
              Lottie.asset(
                'assets/lottie/lottie.json',
                height: 150,
                width: 150,
                repeat: true,
              ),
            const SizedBox(height: 20),
            if (isLoading)
              const Text('Scanning...', style: TextStyle(fontSize: 18))
            else
              Column(
                children: [
                  Text(
                    'Prediction: ${prediction ?? "Unknown"}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Confidence: ${confidence != null ? (confidence! * 100).toStringAsFixed(2) : '--'}%',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      onRefresh(); // Call onRefresh to reset the state
                      onClose(); // Close the dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 221, 179, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Adjust this value for less round corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 50),
                    ),
                    child: const Text('Close' ,style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
