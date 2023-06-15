import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Chame a função que espera 5 segundos antes de mudar para a tela do jogo
    _navigateToGame();
  }

  Future<void> _navigateToGame() async {
    // Aguarde 5 segundos
    await Future.delayed(const Duration(seconds: 5));

    // Navegue para a tela do jogo
    Navigator.of(context).pushNamed('/auth');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/images/background-loading.png'),
            fit: BoxFit.cover,
            ),
          ),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const CircularProgressIndicator(),
          ],
          ),
        ),
      ),
    );
  }
}

