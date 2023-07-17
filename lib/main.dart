import 'package:flameteste/gameScreen.dart';
import 'package:flameteste/devScreen.dart';
import 'package:flameteste/firebaseOptions.dart';
import 'package:flameteste/homePage.dart';
import 'package:flameteste/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';

import 'authScreen.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tamarutaca Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Defina a rota inicial como a splash screen
      initialRoute: '/',
      routes: {

        '/': (context) => SplashScreen(),
        '/auth': (context) => AuthScreen(),
        '/home': (context) => HomePage(),
        '/game': (context) => const Game(),
        '/dev': (context) => DeveloperPage(),
      },
    );
  }
}
