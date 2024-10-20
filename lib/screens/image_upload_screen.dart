import 'package:flutter/material.dart';
import 'package:pixelproof/widgets/image_upload_widget.dart'; // Adjust the import path as needed

class ImageUploadScreen extends StatelessWidget {
  const ImageUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ImageUploadWidget(),
      ),
    );
  }
}
