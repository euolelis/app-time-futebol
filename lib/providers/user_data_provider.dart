 import 'package:flutter/material.dart';
    import 'package:firebase_auth/firebase_auth.dart';
    import 'package:cloud_firestore/cloud_firestore.dart';
    import 'package:time_futebol_app/models/usuario.dart';

    class UserDataProvider with ChangeNotifier {
      Usuario? _usuario;
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      Usuario? get usuario => _usuario;

      Future<void> loadUserData(User authUser) async {
        try {
          DocumentSnapshot userDoc =
              await _firestore.collection('users').doc(authUser.uid).get();

          if (userDoc.exists) {
            _usuario = Usuario.fromFirestore(userDoc);
            notifyListeners();
          }
        } catch (e) {
          print("Erro ao carregar dados do usuário: $e");
        }
      }

      void clearUserData() {
        _usuario = null;
        notifyListeners();
      }
    }