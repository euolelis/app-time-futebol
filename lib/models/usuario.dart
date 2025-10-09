import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  final String uid;
  final String email;
  final String nome;
  final String role; // 'admin', 'pai_atleta'

  Usuario({
    required this.uid,
    required this.email,
    required this.nome,
    required this.role,
  });

  factory Usuario.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Usuario(
      uid: doc.id,
      email: data['email'] ?? '',
      nome: data['nome'] ?? '',
      role: data['role'] ?? 'visitante',
    );
  }
}