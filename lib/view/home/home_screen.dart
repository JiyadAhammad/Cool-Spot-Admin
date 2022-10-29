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
    // log('${productController.products.length} length of String');
    // final User user = FirebaseAuth.instance.currentUser!;
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
              child: ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(
                    () => SizedBox(
                      height: 220,
                      child: ProductCard(
                        product: productController.products[index],
                        index: index,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
