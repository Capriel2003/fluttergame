import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Cria um método de login com o Google
  Stream<User?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges(); // Usa o tipo User? para o stream

  User? getCurrentUser() {
    return _firebaseAuth.currentUser; // Usa o getter currentUser
  }

  Widget getProfileImage() {
    if (_firebaseAuth.currentUser?.photoURL != null) {
      // Usa o operador ?
      return Image.network(
        _firebaseAuth.currentUser!.photoURL!,
        height: 30,
        width: 30,
      );
    } else {
      return Icon(
        Icons.account_circle,
        size: 30,
      );
    }
  }
}
