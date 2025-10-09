import 'package:flutter/material.dart';
import 'package:time_futebol_app/screens/categorias_screen.dart'; // IMPORTAÇÃO ATUALIZADA
import 'package:time_futebol_app/screens/home_screen.dart';
import 'package:time_futebol_app/screens/noticias_screen.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _currentIndex = 0;

  // A lista de telas agora aponta para CategoriasScreen no lugar de ElencoScreen
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriasScreen(), // TELA ATUALIZADA
    const NoticiasScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Elenco',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Notícias',
          ),
        ],
        backgroundColor: const Color(0xFF4A0404), // Cor ajustada para o tema
        selectedItemColor: Colors.amber, // Cor ajustada para o tema
        unselectedItemColor: Colors.white.withOpacity(0.7),
        type: BottomNavigationBarType.fixed, // Garante que o fundo sempre apareça
      ),
    );
  }
}