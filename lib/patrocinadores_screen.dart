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
              "MOREIRA'S SPORT",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFC800),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "PATROCINADORES",
              style: TextStyle(
                fontSize: 24,
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
                  _buildSponsorTile("EMPRESA A"),
                  _buildSponsorTile("EMPRESA B"),
                  _buildSponsorTile("MARCA C"),
                  _buildSponsorTile("INDÚSTRIA D"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSponsorTile(String sponsorName) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF5A1300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          sponsorName,
          style: const TextStyle(
            color: Color(0xFFFFC800),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}