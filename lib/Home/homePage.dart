import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/authServices.dart';

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
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background-loading.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Botão de logout
          Positioned(
            top: 30, // ajuste conforme necessário
            left: 30, // ajuste conforme necessário
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await authService.signOut();
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
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

                    Column(
                      children: [
                        // Título do jogo
                        Text(
                          'Tamarutaca',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PC Senior',
                            color: Colors.black,
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
                          'Game',
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'PC Senior',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.0, top: 0.0),
                          child: Image.asset('assets/images/logo.png'),
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
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // Botões de opções e foto do usuário
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(
                        10), // Espaçamento entre a borda e os botões
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Botão de opções
                        IconButton(
                          onPressed: () {
                            // Navegar para a página de opções
                          },
                          icon: Icon(Icons.settings,
                              color: Colors.white, size: 30),
                          color: Color(0xFF3567BD),
                        ),
                        // Foto do usuário
                        StreamBuilder<User?>(
                          stream: authService
                              .onAuthStateChanged, // Escuta as mudanças no estado de autenticação
                          builder: (BuildContext context,
                              AsyncSnapshot<User?> snapshot) {
                            if (snapshot.hasData) {
                              // Se o usuário está logado, mostra a foto dele e o nome usando o método getProfileData()
                              return FutureBuilder(
                                future: authService.getProfileData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<Widget> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator(); // ou outro widget de carregamento
                                  } else {
                                    if (snapshot.hasError) {
                                      return Text('Erro: ${snapshot.error}');
                                    } else {
                                      return snapshot
                                          .data!; // seu Widget com dados do perfil
                                    }
                                  }
                                },
                              );
                            } else {
                              // Se o usuário não está logado, mostra um ícone de pessoa que é um botão
                              return GestureDetector(
                                onTap: () {
                                  // Navega para a página /auth e substitui a HomePage
                                  Navigator.pushReplacementNamed(
                                      context, '/auth');
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
