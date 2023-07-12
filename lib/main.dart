import 'package:flameteste/Home/homePage.dart';
import 'package:flameteste/devScreen.dart';
import 'package:flameteste/firebaseOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';

import 'authScreen.dart';
import 'gamePage.dart';
import 'splashScreen.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Defina a rota inicial como a splash screen
      initialRoute: '/',
      routes: {
        // Defina a rota da splash screen
        '/': (context) => SplashScreen(),
        // Defina a rota do jogo
        '/auth': (context) => AuthScreen(),
        '/home': (context) => HomePage(),
        '/game': (context) => const MyHomePage(),
        '/dev': (context) => const DevScreen(),
      },
    );
  }
}
