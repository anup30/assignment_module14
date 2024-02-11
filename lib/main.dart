// assignment module 14
// http get data
// api at https://jsonplaceholder.typicode.com/photos
import 'package:assignment_module14/photo_gallery_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shadowColor: Colors.grey,
          elevation: 5,
        ),
      ),
      home: const PhotoGalleryScreen(),
    );
  }
}




