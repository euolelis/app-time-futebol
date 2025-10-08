import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'bottom_nav_controller.dart'; // se quiser menu inferior

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  SplashScreen(),
        '/home': (context) =>  BottomNavController(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7A1A00),
          primary: const Color(0xFF7A1A00),
          secondary: const Color(0xFFFFC800),
        ),
      ),
    );
  }
}