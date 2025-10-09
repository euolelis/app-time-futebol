import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_futebol_app/providers/user_data_provider.dart';
import 'package:time_futebol_app/screens/bottom_nav_controller.dart';
import 'package:time_futebol_app/screens/login_screen.dart';
import 'package:time_futebol_app/services/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        // Usamos addPostFrameCallback para executar o código APÓS o build terminar.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (snapshot.hasData && snapshot.data != null) {
            // Se o usuário está logado, carregamos seus dados.
            userDataProvider.loadUserData(snapshot.data!);
          } else {
            // Se o usuário está deslogado, limpamos os dados.
            userDataProvider.clearUserData();
          }
        });

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(color: Colors.amber)),
          );
        }

        // A decisão de qual tela mostrar continua a mesma.
        if (snapshot.hasData) {
          return const BottomNavController();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}