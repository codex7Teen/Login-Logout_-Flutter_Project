import 'package:flutter/material.dart';
import 'package:main_project/screens/splash.dart';

const SAVE_KEY_NAME = 'userLoggedIn';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(),
    );
  }
}