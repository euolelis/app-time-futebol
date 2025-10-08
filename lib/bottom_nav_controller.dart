import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'elenco_screen.dart';
import 'noticias_screen.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
     HomeScreen(),
     ElencoScreen(),
     NoticiasScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
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
        backgroundColor: Color(0xFF5B1A18),
        selectedItemColor: Color(0xFFFFD700),
        unselectedItemColor: Colors.white,
      ),
    );
  }
}