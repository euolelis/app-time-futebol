import 'package:flutter/material.dart';

class PatrocinadoresScreen extends StatelessWidget {
  const PatrocinadoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5B1A18),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B1A18),
        title: const Text(
          'MOREIRA\'S SPORT',
          style: TextStyle(color: Color(0xFFFFD700)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'PATROCINADORES',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  SponsorTile("EMPRESA A"),
                  SponsorTile("EMPRESA B"),
                  SponsorTile("MARCA C"),
                  SponsorTile("INDÚSTRIA D"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SponsorTile extends StatelessWidget {
  final String sponsorName;

  const SponsorTile(this.sponsorName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF7A1A00),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          sponsorName,
          style: const TextStyle(
            color: Color(0xFFFFD700),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}