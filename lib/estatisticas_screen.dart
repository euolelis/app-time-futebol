import 'package:flutter/material.dart';

class EstatisticasScreen extends StatelessWidget {
  const EstatisticasScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 20),
            Text(
              'ESTATÍSTICAS DA PARTIDA',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
              ),
            ),
            SizedBox(height: 20),
            TimelineEvent("1'", "Início do jogo"),
            TimelineEvent("14'", "GOL"),
            TimelineEvent("45+2'", "Intervalo"),
            TimelineEvent("46'", "Início 2º tempo"),
            TimelineEvent("60'", "Substituição"),
            TimelineEvent("72'", "Cartão Amarelo"),
            TimelineEvent("80'", "Fim de jogo"),
          ],
        ),
      ),
    );
  }
}

class TimelineEvent extends StatelessWidget {
  final String time;
  final String event;

  const TimelineEvent(this.time, this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.circle, color: Color(0xFFFFD700)),
          const SizedBox(width: 10),
          Text(
            '$time $event',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}