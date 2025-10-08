import 'package:flutter/material.dart';
import 'elenco_screen.dart';
import 'estatisticas_screen.dart';
import 'galeria_screen.dart';
import 'noticias_screen.dart';
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
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildFeatureButton(
                    context,
                    'Elenco',
                    Icons.people,
                    ElencoScreen(),
                  ),
                  _buildFeatureButton(
                    context,
                    'Estatísticas',
                    Icons.bar_chart,
                     EstatisticasScreen(),
                  ),
                  _buildFeatureButton(
                    context,
                    'Galeria',
                    Icons.photo_library,
                     GaleriaScreen(),
                  ),
                  _buildFeatureButton(
                    context,
                    'Patrocinadores',
                    Icons.business,
                    const PatrocinadoresScreen(),
                  ),
                  _buildFeatureButton(
                    context,
                    'Notícias',
                    Icons.article,
                    const NoticiasScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    String label,
    IconData icon,
    Widget targetScreen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF5A1300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFFFFC800), size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFFFC800),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}