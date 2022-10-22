import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../widget/custom_nav_bar.dart';
import 'navigation_drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';
  static Route<HomeScreen> route() {
    return MaterialPageRoute<HomeScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navdrawer(),
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          barTitle: 'Cool Spot',
          action: Icons.add_circle,
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.barTitle,
    required this.action,
  });
  final String barTitle;
  final IconData action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kblack,
      elevation: 0,
      title: Text(barTitle),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            action,
          ),
        ),
      ],
    );
  }
}
