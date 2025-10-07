import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// IMPORTANTE: Importando a nossa nova tela
import 'package:time_futebol_app/screens/public/home_screen.dart';

// --- NOSSA PALETA DE CORES ---
const Color corPrincipal = Color(0xFF9E2A2B); // Vermelho/Vinho
const Color corDestaque = Color(0xFFF7B538); // Amarelo/Dourado
const Color corFundo = Color(0xFF121212);    // Preto/Cinza escuro
const Color corTextoPrincipal = Colors.white;

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
    // ID do time (Placeholder)
    const String currentTeamId = "COLOQUE_O_ID_DO_SEU_TIME_AQUI";

    return MaterialApp(
      title: 'Moreira\'s Sport',
      debugShowCheckedModeBanner: false,
      
      // --- TEMA (Igual ao anterior) ---
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: corFundo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: corPrincipal,
          primary: corPrincipal,
          secondary: corDestaque,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: corPrincipal,
          foregroundColor: corTextoPrincipal,
          elevation: 4,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: corTextoPrincipal),
          headlineSmall: TextStyle(color: corDestaque),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: corDestaque,
            foregroundColor: corFundo,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        useMaterial3: true,
      ),

      // --- AQUI ESTAVA O ERRO ---
      // Agora apontamos corretamente para a HomeScreen e nada mais.
      home: const HomeScreen(teamId: currentTeamId),
    );
  }
}