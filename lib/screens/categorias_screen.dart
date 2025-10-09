import 'package:flutter/material.dart';
    import 'package:cloud_firestore/cloud_firestore.dart';
    import 'package:time_futebol_app/models/categoria.dart';
    import 'package:time_futebol_app/screens/elenco_screen.dart';

    class CategoriasScreen extends StatelessWidget {
      const CategoriasScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("CATEGORIAS"),
            centerTitle: true,
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('teams')
                .doc('moreiras-sport')
                .collection('categories')
                .orderBy('year')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.amber));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("Nenhuma categoria encontrada."));
              }

              final categorias = snapshot.data!.docs
                  .map((doc) => Categoria.fromFirestore(doc))
                  .toList();

              return ListView.builder(
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  return Card(
                    color: Colors.black.withOpacity(0.3),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        categoria.nome,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right, color: Colors.amber),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ElencoScreen(
                              categoriaId: categoria.id,
                              categoriaNome: categoria.nome,
                            ),
                          ),
                        );
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