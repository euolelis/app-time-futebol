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
      title: "Moreira's Sport",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF7A1A00),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7A1A00),
          primary: const Color(0xFF7A1A00),
          secondary: const Color(0xFFFFC800),
        ),
      ),
      home: const BottomNavController(),
    );
  }
}