import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/auth_services.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Cria uma instância do AuthService
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Cenário de fundo
          Image.asset(
            'assets/images/background-loading.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            color: Colors.white.withOpacity(0.8), // Opacidade de 80%
            colorBlendMode: BlendMode.modulate,
          ),

          // Resto dos widgets
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo e título do jogo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo do jogo
                    Image.asset(
                      'assets/images/logo-pixel.png',
                      width: 100,
                      height: 100,
                    ),

                    Column(
                      children: [
                        // Título do jogo
                        Text(
                          'Tamarutaca',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PC Senior',
                            color: Color(0xFF3567BD),
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'the Game',
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'PC Senior',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFBD3535),
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // Botões de entrar e desenvolvedores
                SizedBox(height: 20),
                // Botão de jogar
                ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/game');
                  },
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Jogar',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PC Senior',
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF34CB79),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Botão de desenvolvedores
                ElevatedButton(
                  onPressed: () {
                    // Navegar para a página de desenvolvedores
                  },
                  child: Text('Desenvolvedores',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PC Senior',
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 52, 125, 203),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // Botões de opções e foto do usuário
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.all(10), // Espaçamento entre a borda e os botões
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Botão de opções
                        IconButton(
                          onPressed: () {
                            // Navegar para a página de opções
                          },
                          icon:
                              Icon(Icons.settings, color: Colors.white, size: 30),
                          color: Color(0xFF3567BD),
                        ),
                        // Foto do usuário
                        StreamBuilder<User?>(
                          stream: authService
                              .onAuthStateChanged, // Escuta as mudanças no estado de autenticação
                          builder: (BuildContext context,
                              AsyncSnapshot<User?> snapshot) {
                            if (snapshot.hasData) {
                              // Se o usuário está logado, mostra a foto dele usando o método getProfileImage()
                              return authService.getProfileImage();
                            } else {
                              // Se o usuário não está logado, mostra um ícone de pessoa que é um botão
                              return GestureDetector(
                                onTap: () {
                                  // Navega para a página /auth e substitui a HomePage
                                  Navigator.pushReplacementNamed(context, '/auth');
                                },
                                child: Icon(Icons.person,
                                    color: Colors.white, size: 30),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
