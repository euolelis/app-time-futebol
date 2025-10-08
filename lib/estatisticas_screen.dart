import 'package:flutter/material.dart';

class EstatisticasScreen extends StatelessWidget {
  const EstatisticasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A1A0D),
      body: Center(
        child: Text(
          'Estatísticas',
          style: TextStyle(
            color: const Color(0xFFF6B800),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}