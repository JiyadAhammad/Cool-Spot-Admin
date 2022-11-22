import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore_example/firebase_config.dart' ;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/addproduct/add_product.dart';
import 'view/home/home_screen.dart';
import 'view/login/login.dart';
import 'view/order/order.dart';
import 'view/splash/splash_screen.dart';
import 'view/statistics/statistic.dart';

bool shouldUseFirestoreEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator(
      'localhost',
      8080,
    );
  }
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
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
          page: () => HomeScreen(),
        ),
        GetPage<OrdersScreen>(
          name: '/order',
          page: () => OrdersScreen(),
        ),
        GetPage<AddProduct>(
          name: '/addproduct',
          page: () => AddProduct(),
        ),
        GetPage<AddProduct>(
          name: '/status',
          page: () => const StatisicScreen(),
        ),
      ],
    );
  }
}
