import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pixelproof/api/api_source.dart';
import 'package:pixelproof/widgets/result_dailog.dart';

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({super.key});

  @override
  State<ImageUploadWidget> createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  File? _image;
  String? _prediction;
  double? _confidence;
  bool _isLoading = false;

  final ImagePicker _picker = ImagePicker();

  // Method to pick image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Method to scan the image by sending it to the server
  Future<void> _scanImage() async {
    if (_image == null) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ResultDialog(
        prediction: null,
        confidence: null,
        isLoading: true,
        onClose: () => Navigator.pop(
            context), // Close the dialog when the button is pressed
        onRefresh: () {
          setState(() {
            _image = null; // Reset image
            _prediction = null; // Reset prediction
            _confidence = null; // Reset confidence
          });
        },
      ),
    );

    try {
      // Call the predictImage function from your api source
      final result = await predictImage(_image!);

      // Update the prediction and confidence after the scan is complete
      setState(() {
        _prediction = result['prediction'] ?? 'Unknown';

        // Parse the confidence string to a double
        if (result['confidence'] != null) {
          _confidence =
              double.tryParse(result['confidence'].replaceAll('%', ''))! /
                  100; // Convert to decimal
        } else {
          _confidence = null; // Handle null case if needed
        }

        _isLoading = false;
      });

      Navigator.pop(context); // Close the loading dialog
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => ResultDialog(
          prediction: _prediction,
          confidence: _confidence,
          isLoading: false,
          onClose: () => Navigator.pop(
              context), // Close the dialog when the button is pressed
          onRefresh: () {
            setState(() {
              _image = null;
              _prediction = null;
              _confidence = null;
            });
          },
        ),
      );
    } catch (e) {
      setState(() {
        _prediction = 'Error: $e';
        _confidence = null;
        _isLoading = false;
      });

      Navigator.pop(context); // Close the loading dialog
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => ResultDialog(
          prediction: _prediction,
          confidence: _confidence,
          isLoading: false,
          onClose: () => Navigator.pop(
              context), // Close the dialog when the button is pressed
          onRefresh: () {
            setState(() {
              _image = null; // Reset image
              _prediction = null; // Reset prediction
              _confidence = null; // Reset confidence
            });
          },
        ),
      );
    }
  }
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_image != null)
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Rounded corners
                image: DecorationImage(
                  image: FileImage(_image!),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Placeholder color
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              child: const Center(
                child: Text(
                  'No image selected.',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ), // Custom image card when no image is selected
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickImage,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(0, 221, 179, 1),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Less round corners
              ),
            ),
            child: const Text('Pick from Gallery', style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isLoading ? null : _scanImage,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(0, 221, 179, 1),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Less round corners
              ),
            ),
            child: const Text('Scan Image', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    ),
  );
}
}