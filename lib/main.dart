import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RoutesAdministracao.onGenerateRoute,
    );
  }
}
