import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/home/product_model.dart';
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
    return Scaffold(
      drawer: const Navdrawer(),
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          barTitle: 'Cool Spot',
          action: Icons.add_circle,
          onPressed: () => Get.to(() => const AddProduct()),
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
            Row(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                kwidth,
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Text(
                            'Price',
                          ),
                          SliderWidget(product: product.price),
                          Text(
                            '₹ ${product.price}',
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
                            '₹ ${product.quantity}',
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final double product;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: product,
      onChanged: (double value) {},
      max: 100,
      divisions: 5,
      activeColor: kblackIcon,
      inactiveColor: kbluegrey,
    );
  }
}
