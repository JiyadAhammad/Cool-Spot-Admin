import 'package:flutter/material.dart';

import '../../model/order/order_model.dart';
import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_nav_bar.dart';
import 'widget/order_card_widget.dart';

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
      appBar: CustomAppBar(
        barTitle: 'Orders',
        action: Icons.check,
        onPressed: () {},
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: Order.order.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return OrderCardWidget(
                  order: Order.order[index],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
