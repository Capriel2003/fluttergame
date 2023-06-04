import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 3).animate(_controller);
    // Chame a função que espera 5 segundos antes de mudar para a tela do jogo
    _navigateToGame();
  }

  Future<void> _navigateToGame() async {
    // Aguarde 5 segundos
    await Future.delayed(const Duration(seconds: 9));

    // Navegue para a tela do jogo
    Navigator.of(context).pushNamed('/home');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background-loading.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo-pixel.png'),
                    SizedBox(height: 16),
                    Text(
                      'Loading' + '.' * _animation.value.toInt(),
                      style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, shadows: [
                        Shadow(
                          blurRadius: 7.0,
                          color: Colors.black,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
