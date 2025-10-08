import 'package:flutter/material.dart';
import 'elenco_screen.dart';
import 'home_screen.dart';
import 'noticias_screen.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _selectedIndex = 0;
  
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    ElencoScreen(),
    NoticiasScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Elenco',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Noticias',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFFC800), // amarelo
        unselectedItemColor: Colors.white54,
        backgroundColor: const Color(0xFF7A1A00), // marrom escuro
        onTap: _onItemTapped,
      ),
    );
  }
}