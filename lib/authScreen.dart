import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autenticação do Google'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GoogleSignInButton(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: false, // Use uma variável para controlar o estado do Checkbox
                  onChanged: (value) {
                    // Implemente o código para lidar com a mudança de estado do Checkbox aqui
                  },
                ),
                Text('Li e aceito os termos de uso.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

      // Aqui você pode usar os dados do usuário autenticado, como user.uid, user.displayName, etc.

      // Depois de autenticar com sucesso, navegue para a próxima tela.
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

  // Resto do código
}

