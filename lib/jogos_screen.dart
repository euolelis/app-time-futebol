import 'package:flutter/material.dart';

class JogosScreen extends StatelessWidget {
  const JogosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A1A00),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "MOREIRA'S JOGOS",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFC800),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildGameTile("10 MAIO", "14:00", "MOREIRA'S SPORT X CIDADE"),
                  _buildGameTile("17 MAIO", "10:30", "VILA UNIDA X SRRERA"),
                  _buildGameTile("23 MAIO", "13:15", "UNIÃO ESPORTE X UNIÃO"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameTile(String date, String time, String teams) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF5A1300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$date $time",
            style: const TextStyle(
              color: Color(0xFFFFC800),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            teams,
            style: const TextStyle(
              color: Color(0xFFFFC800),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}