import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:time_futebol_app/providers/user_data_provider.dart';
import 'firebase_options.dart';
import 'package:time_futebol_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moreira\'s Sport',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF7A1A00),
            primary: const Color(0xFF7A1A00),
            secondary: const Color(0xFFFFC800),
            brightness: Brightness.dark,
          ),
          scaffoldBackgroundColor: const Color(0xFF4A0404),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF4A0404),
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.amber,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.amber),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}