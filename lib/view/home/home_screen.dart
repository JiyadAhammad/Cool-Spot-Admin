import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product/product_controller.dart';
import '../addproduct/add_product.dart';
import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_nav_bar.dart';
import 'navigation_drawer/drawer.dart';
import 'widget/product_card_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const String routeName = '/home';
  static Route<HomeScreen> route() {
    return MaterialPageRoute<HomeScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navdrawer(),
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        barTitle: 'Cool Spot',
        action: Icons.add_circle,
        onPressed: () => Get.to(() => AddProduct()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.width / 1.9,
                      child: ProductCard(
                        product: productController.products[index],
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
