import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/upload_screen.dart';
import 'screens/generator_screen.dart';
import 'screens/preview_screen.dart';
import 'models/screenshot_model.dart';

void main() {
  runApp(const AppScreenshotsApp());
}

class AppScreenshotsApp extends StatelessWidget {
  const AppScreenshotsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Screenshots Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/upload': (context) => const UploadScreen(),
        '/generator': (context) => const GeneratorScreen(),
        '/preview': (context) => const PreviewScreen(),
      },
    );
  }
}