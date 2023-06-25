import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<User?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges(); // Usa o tipo User? para o stream

  User? getCurrentUser() {
    return _firebaseAuth.currentUser; // Usa o getter currentUser
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        String? photoURL = user.photoURL;
        String? displayName = user.displayName;

        // Adicionando o usuário ao Firestore
        await _db.collection('users').doc(user.uid).set({
          'displayName': displayName,
          'photoURL': photoURL,
        });

        print('Nome do usuário: $displayName');
        print('URL da foto do usuário: $photoURL');
      }

      Navigator.pushReplacementNamed(context, '/home');
    } catch (error) {
      print('Erro ao autenticar com o Google: $error');
    }
  }

  Future<Widget> getProfileData() async {
    final User? user = _firebaseAuth.currentUser;
    final User currentUser = user!;

    if (currentUser.photoURL != null) {
      return Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(currentUser.photoURL!),
            radius: 20,
          ),
          SizedBox(height: 1.5),
          Text(currentUser.displayName ?? 'Usuário', style: TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'PC Senior')),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          CircleAvatar(
            child: Icon(Icons.account_circle, size: 20),
            radius: 20,
          ),
          SizedBox(height: 1.5),
          Text('Usuário'),
        ],
      );
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
