import 'package:flutter/material.dart';

class ElencoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elenco'),
      ),
      body: ListView(
        children: [
          // Adicione os jogadores aqui
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/jogador1.png'),
            ),
            title: Text('Jogador 1'),
            subtitle: Text('Posição: Atacante'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/jogador2.png'),
            ),
            title: Text('Jogador 2'),
            subtitle: Text('Posição: Goleiro'),
          ),
        ],
      ),
    );
  }
}