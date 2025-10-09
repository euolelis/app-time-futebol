import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_futebol_app/models/jogador.dart';

class ElencoScreen extends StatelessWidget {
  final String categoriaId;
  final String categoriaNome;

  const ElencoScreen({
    super.key,
    required this.categoriaId,
    required this.categoriaNome,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoriaNome.toUpperCase()), // Deixa o nome da categoria em maiúsculo
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Caminho corrigido para buscar os jogadores
        stream: FirebaseFirestore.instance
            .collection('teams')
            .doc('moreiras-sport')
            .collection('players')
            .where('categoryId', isEqualTo: categoriaId)
            .orderBy('name')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.amber));
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar jogadores."));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Nenhum jogador encontrado nesta categoria."));
          }

          final jogadores = snapshot.data!.docs
              .map((doc) => Jogador.fromFirestore(doc))
              .toList();

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: jogadores.length,
            itemBuilder: (context, index) {
              final jogador = jogadores[index];
              return Card(
                color: Colors.black.withOpacity(0.3),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.amber.withOpacity(0.2),
                    backgroundImage: NetworkImage(jogador.fotoUrl),
                    onBackgroundImageError: (_, __) {},
                  ),
                  title: Text(
                    jogador.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    '${jogador.posicao} - Camisa ${jogador.numero}',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                  trailing: const Icon(Icons.chevron_right, color: Colors.amber),
                  onTap: () {
                    print('Ver perfil de ${jogador.nome}');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}