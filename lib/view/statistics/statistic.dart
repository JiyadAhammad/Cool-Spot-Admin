import 'package:flutter/material.dart';

import '../../model/statistic/statistic_model.dart';
import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_nav_bar.dart';
import 'widget/bar_chart.dart';

class StatisicScreen extends StatelessWidget {
  const StatisicScreen({super.key});

  static const String routeName = '/status';
  static Route<StatisicScreen> route() {
    return MaterialPageRoute<StatisicScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const StatisicScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        barTitle: 'Statistic',
        action: Icons.check,
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.width / 1.5,
              child: CustomBarChart(
                orderStatus: OrderStatus.status,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
