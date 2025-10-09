import 'package:cloud_firestore/cloud_firestore.dart';

    class DatabaseSeeder {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      Future<void> seedInitialData() async {
        print('Iniciando o processo de popular o banco de dados...');

        // Referência para o documento do time
        final teamRef = _firestore.collection('teams').doc('moreiras-sport');

        // Usamos um WriteBatch para executar todas as operações de uma vez só.
        // É mais rápido e eficiente.
        final batch = _firestore.batch();

        // --- 1. DADOS DAS CATEGORIAS ---
        final categories = [
          {'id': 'sub-8-2025', 'name': 'Sub-8', 'year': 2025},
          {'id': 'sub-10-2025', 'name': 'Sub-10', 'year': 2025},
          {'id': 'sub-12-2025', 'name': 'Sub-12', 'year': 2025},
        ];

        for (var catData in categories) {
          final catRef = teamRef.collection('categories').doc(catData['id'] as String);
          batch.set(catRef, {
            'name': catData['name'],
            'year': catData['year'],
            'isActive': true,
          });
        }
        print('Categorias adicionadas ao batch.');

        // --- 2. DADOS DOS JOGADORES ---
        final players = [
          // Jogadores Sub-10
          {'name': 'LUCCA', 'position': 'ATACANTE', 'number': 11, 'categoryId': 'sub-10-2025', 'photoUrl': 'https://i.pravatar.cc/150?img=1'},
          {'name': 'GUSTAVO', 'position': 'MEIO-CAMPO', 'number': 8, 'categoryId': 'sub-10-2025', 'photoUrl': 'https://i.pravatar.cc/150?img=2'},
          {'name': 'SAMUEL', 'position': 'ZAGUEIRO', 'number': 5, 'categoryId': 'sub-10-2025', 'photoUrl': 'https://i.pravatar.cc/150?img=3'},
          // Jogadores Sub-12
          {'name': 'MATEO', 'position': 'ATACANTE', 'number': 10, 'categoryId': 'sub-12-2025', 'photoUrl': 'https://i.pravatar.cc/150?img=4'},
          {'name': 'BRUNO', 'position': 'GOLEIRO', 'number': 1, 'categoryId': 'sub-12-2025', 'photoUrl': 'https://i.pravatar.cc/150?img=5'},
        ];

        for (var playerData in players) {
          // Geramos um ID automático para cada jogador
          final playerRef = teamRef.collection('players').doc(); 
          batch.set(playerRef, {
            'name': playerData['name'],
            'position': playerData['position'],
            'number': playerData['number'],
            'categoryId': playerData['categoryId'],
            'photoUrl': playerData['photoUrl'],
          });
        }
        print('Jogadores adicionados ao batch.');

        // --- 3. EXECUTAR TUDO ---
        try {
          await batch.commit();
          print('SUCESSO: Banco de dados populado com dados de teste!');
        } catch (e) {
          print('ERRO ao popular o banco de dados: $e');
        }
      }
    }