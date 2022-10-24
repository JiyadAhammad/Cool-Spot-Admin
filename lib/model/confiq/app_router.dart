import 'dart:developer';

import 'package:flutter/material.dart';

import '../../view/addproduct/add_product.dart';
import '../../view/home/home_screen.dart';
import '../../view/login/login.dart';
import '../../view/order/order.dart';
import '../../view/splash/splash_screen.dart';
import '../../view/statistics/statistic.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    log('this the route ${settings.name}');

    switch (settings.name) {
      case '/':
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case Ordescreen.routeName:
        return Ordescreen.route();
      case AddProduct.routeName:
        return AddProduct.route();
      case StatisicScreen.routeName:
        return StatisicScreen.route();
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
