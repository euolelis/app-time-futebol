import 'package:flutter/material.dart';

class ElencoScreen extends StatelessWidget {
  const ElencoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A1A00),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "ELENCO",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFC800),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Adicione os jogadores aqui
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}