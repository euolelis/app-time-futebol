import 'package:flutter/material.dart';

class PatrocinadoresScreen extends StatelessWidget {
  const PatrocinadoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A1A00),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "PATROCINADORES",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFC800),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Aqui ficarão os patrocinadores do clube",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}