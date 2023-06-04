import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3567BD),
                        
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'the Game',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBD3535),
                        
                      ),
                    ),
                      ],
                    )
                  ],
                ),
                // Botões de entrar e desenvolvedores
                SizedBox(height: 20),
                // Botão de entrar
                ElevatedButton.icon(
                  onPressed: () {
                    // Navegar para a próxima página
                  },
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF3567BD),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // Botão de desenvolvedores
                TextButton(
                  onPressed: () {
                    // Navegar para a página de desenvolvedores
                  },
                  child: Text('Desenvolvedores'),
                  style: TextButton.styleFrom(
                    primary: Color(0xFFBD3535),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Botões de opções e foto do usuário
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Botão de opções
          IconButton(
            onPressed: () {
              // Navegar para a página de opções
            },
            icon: Icon(Icons.settings),
            color: Color(0xFF3567BD),
          ),
          // Foto do usuário
          CircleAvatar(
            backgroundImage:
                NetworkImage('https://lh3.googleusercontent.com/a-/AOh14GhQZ8p4Ys9wXk9g6Zy4oqJ1fKlLdFVl8yRnZxQ=s96-c'), // URL da foto do google do usuário
          ),
        ],
      ),
    );
  }
}
