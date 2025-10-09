 import 'package:cloud_firestore/cloud_firestore.dart';

    class Jogador {
      final String id;
      final String nome;
      final String posicao;
      final int numero;
      final String fotoUrl;
      final String categoriaId;

      Jogador({
        required this.id,
        required this.nome,
        required this.posicao,
        required this.numero,
        required this.fotoUrl,
        required this.categoriaId,
      });

      factory Jogador.fromFirestore(DocumentSnapshot doc) {
        Map data = doc.data() as Map<String, dynamic>;
        return Jogador(
          id: doc.id,
          nome: data['nome'] ?? '',
          posicao: data['posicao'] ?? '',
          numero: data['numero'] ?? 0,
          fotoUrl: data['fotoUrl'] ?? '',
          categoriaId: data['categoriaId'] ?? '',
        );
      }
    }