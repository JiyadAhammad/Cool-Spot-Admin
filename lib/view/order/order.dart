import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../home/home_screen.dart';
import '../widget/custom_nav_bar.dart';

class Ordescreen extends StatelessWidget {
  const Ordescreen({super.key});

  static const String routeName = '/order';
  static Route<Ordescreen> route() {
    return MaterialPageRoute<Ordescreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const Ordescreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          barTitle: 'Orders',
          action: Icons.check,
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
