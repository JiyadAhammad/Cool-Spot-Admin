import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product/product_model.dart';
import '../addproduct/add_product.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
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
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      drawer: const Navdrawer(),
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          barTitle: 'Cool Spot',
          action: Icons.add_circle,
          onPressed: () => Get.to(() => AddProduct()),
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
                    height: 220,
                    child: ProductCard(
                      product: Product.products[index],
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.barTitle,
    required this.action,
    required this.onPressed,
  });
  final String barTitle;
  final IconData action;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kblack,
      elevation: 0,
      title: Text(barTitle),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: onPressed,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product.name,
              style: const TextStyle(
                color: kblackText,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            kheight5,
            Text(
              product.decription,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  kwidth5,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Text(
                            'Price',
                          ),
                          SliderWidget(product: product.price),
                          Text(
                            '₹${product.price}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            'Qunty',
                          ),
                          SliderWidget(
                            product: product.quantity.toDouble(),
                          ),
                          Text(
                            '₹${product.quantity}',
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.product,
  });

  final double product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Slider(
        value: product,
        onChanged: (double value) {},
        max: 100,
        divisions: 5,
        activeColor: kblackIcon,
        inactiveColor: kbluegrey,
      ),
    );
  }
}
