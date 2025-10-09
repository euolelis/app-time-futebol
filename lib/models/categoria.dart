import 'package:cloud_firestore/cloud_firestore.dart';

    class Categoria {
      final String id;
      final String nome;
      final int ordem;

      Categoria({required this.id, required this.nome, required this.ordem});

      factory Categoria.fromFirestore(DocumentSnapshot doc) {
        Map data = doc.data() as Map<String, dynamic>;
        return Categoria(
          id: doc.id,
          nome: data['nome'] ?? '',
          ordem: data['ordem'] ?? 0,
        );
      }
    }