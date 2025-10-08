import 'package:flutter/material.dart';
import 'bottom_nav_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:  Color(0xFF7A1A00),
          primary:  Color(0xFF7A1A00),
          secondary:  Color(0xFFFFFC800),
        ),
      ),
      home:  BottomNavController(),
    );
  }
}