import 'package:flutter/material.dart';

import '../../model/home/product_model.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: Product.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 200,
                    child: ProductCard(product: Product.products[index]),
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

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(
            product.name,
          )
        ],
      ),
    );
  }
}
