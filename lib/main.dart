import 'package:flutter/material.dart';
import 'package:qring/views/health_screen.dart';
import 'package:qring/views/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
     
      home: const HomeController(),
    );
  }
}

