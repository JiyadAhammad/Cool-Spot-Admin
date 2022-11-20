import 'dart:developer';

import 'package:cool_spot_admin/controller/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_nav_bar.dart';
import 'widget/order_card_widget.dart';

class Ordescreen extends StatelessWidget {
  Ordescreen({super.key});

  static const String routeName = '/order';
  static Route<Ordescreen> route() {
    return MaterialPageRoute<Ordescreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => Ordescreen(),
    );
  }

  final OrderController orderController = Get.put(
    OrderController(),
  );

  @override
  Widget build(BuildContext context) {
    log('${orderController.orders.length} lenth of item in firebase in build');
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
            child: Obx(
              () => ListView.builder(
                itemCount: orderController.orders.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  log('${orderController.orders.length} lenth of item in firebase');
                  return OrderCardWidget(
                    order: orderController.orders[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
