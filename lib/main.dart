import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/addproduct/add_product.dart';
import 'view/home/home_screen.dart';
import 'view/login/login.dart';
import 'view/order/order.dart';
import 'view/splash/splash_screen.dart';
import 'view/statistics/statistic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      getPages: <GetPage<dynamic>>[
        GetPage<LoginScreen>(
          name: '/login',
          page: () => const LoginScreen(),
        ),
        GetPage<HomeScreen>(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        GetPage<Ordescreen>(
          name: '/order',
          page: () => const Ordescreen(),
        ),
        GetPage<AddProduct>(
          name: '/addproduct',
          page: () => const AddProduct(),
        ),
        GetPage<AddProduct>(
          name: '/status',
          page: () => const StatisicScreen(),
        ),
      ],
    );
  }
}
