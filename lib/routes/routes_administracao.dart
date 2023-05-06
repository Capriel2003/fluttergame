import 'package:flutter/material.dart';

import '../homePage.dart';
import '../login/splashScreen.dart';

class RoutesAdministracao {
  static const loadingPage = '/';
  static const String homePage = '../homePage.dart';
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesAdministracao.loadingPage:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case RoutesAdministracao.homePage:
      return MaterialPageRoute(builder: (_) => const MyHomePage());
    default:
      return MaterialPageRoute(builder: (_) => const MyHomePage());
  }
}
