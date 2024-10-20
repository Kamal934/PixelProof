import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http_parser/http_parser.dart';


Future<Map<String, dynamic>> predictImage(File? imageFile) async {
  var request = http.MultipartRequest(
  'POST', Uri.parse('https://kml1-pixelproof.hf.space/predict'));
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        imageFile!.readAsBytesSync(),
        filename: imageFile.path,
        contentType: MediaType('image', 'jpeg'), // or 'image', 'png' if it's a PNG file
      )
    );


  var response = await request.send();
  var responseData = await response.stream.bytesToString();
  if (kDebugMode) {
    print(responseData);
  }
  return jsonDecode(responseData);
}

