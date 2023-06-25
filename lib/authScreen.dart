import 'package:flameteste/services/googleSignInButton.dart';
import 'package:flutter/material.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removemos a AppBar
      body: Stack(
        children: [
          // Botão para voltar à página anterior
          Positioned(
            top: 40, // ajuste a posição conforme sua necessidade
            left: 10, // ajuste a posição conforme sua necessidade
            child: IconButton(
              icon: Icon(Icons.arrow_back), 
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleSignInButton(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: false,
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
        ],
      ),
    );
  }
}

