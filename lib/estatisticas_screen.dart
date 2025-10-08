import 'package:flutter/material.dart';

class EstatisticasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estatísticas'),
      ),
      body: Center(
        child: Text(
          'Aqui você verá as estatísticas dos jogos.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}