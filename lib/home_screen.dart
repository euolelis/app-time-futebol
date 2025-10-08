import 'package:flutter/material.dart';
import 'estatisticas_screen.dart';
import 'galeria_screen.dart';
import 'patrocinadores_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A1A00),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "MOREIRA'S SPORT",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFC800),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Próximo Jogo',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFFFC800),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF5A1300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Text(
                    '10 MAIO 14:00',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFFC800),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "MOREIRA'S SPORT X CIDADE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFC800),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFeatureButton(
                    context,
                    'Estatísticas',
                    Icons.bar_chart,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EstatisticasScreen(),
                      ),
                    ),
                  ),
                  _buildFeatureButton(
                    context,
                    'Galeria',
                    Icons.photo_library,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GaleriaScreen(),
                      ),
                    ),
                  ),
                  _buildFeatureButton(
                    context,
                    'Patrocinadores',
                    Icons.business,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatrocinadoresScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onTap,
          color: const Color(0xFFFFC800),
          iconSize: 32,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFFFC800),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}