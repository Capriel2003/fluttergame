

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'databaseServices.dart';

class GoogleSignInButton extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService _db = DatabaseService();

  Future<void> _handleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        String? photoURL = user.photoURL;
        String? displayName = user.displayName;

        print('Nome do usuário: $displayName');
        print('URL da foto do usuário: $photoURL');

        // Salva as informações do usuário no Firestore
        await _db.saveUser(user);
      }

      Navigator.pushReplacementNamed(context, '/home');
    } catch (error) {
      print('Erro ao autenticar com o Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        _handleSignIn(context);
      },
      icon: Icon(Icons.login),
      label: Text('Entrar com o Google'),
    );
  }
}
