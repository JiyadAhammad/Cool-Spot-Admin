import 'dart:developer';

import 'package:flutter/material.dart';

import '../../view/splash/splash_screen.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    log('this the route ${settings.name}');

    switch (settings.name) {
      case '/':
        return SplashScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route<Scaffold> _errorRoute() {
    return MaterialPageRoute<Scaffold>(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error Router'),
        ),
      ),
    );
  }
}
