import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product/product_controller.dart';
import '../../model/product/product_model.dart';
import '../addproduct/add_product.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_nav_bar.dart';
import 'navigation_drawer/drawer.dart';

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
    // final User user = FirebaseAuth.instance.currentUser!;
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
  ProductCard({
    super.key,
    required this.product,
    required this.index,
  });

  final Product product;
  final int index;
  final ProductController productController = Get.find();

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
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Slider(
                              value: product.price,
                              onChanged: (double value) {
                                productController.updateProductPrice(
                                  index,
                                  product,
                                  value,
                                );
                              },
                              max: 100,
                              divisions: 5,
                              activeColor: kblackIcon,
                              inactiveColor: kbluegrey,
                            ),
                          ),
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Slider(
                              value: product.quantity.toDouble(),
                              onChanged: (double value) {
                                productController.updateProductQuantity(
                                  index,
                                  product,
                                  value.toInt(),
                                );
                              },
                              max: 100,
                              divisions: 5,
                              activeColor: kblackIcon,
                              inactiveColor: kbluegrey,
                            ),
                          ),
                          // SliderWidget(
                          //   product: product.quantity.toDouble(),a: productController,
                          // ),
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

// class SliderWidget extends StatelessWidget {
//   const SliderWidget({
//     super.key,
//     required this.product,
//     required this.a,
//   });

//   final double product;
//   final ProductController a;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width / 2,
//       child: Slider(
//         value: product,
//         onChanged: (double value) {},
//         max: 100,
//         divisions: 5,
//         activeColor: kblackIcon,
//         inactiveColor: kbluegrey,
//       ),
//     );
//   }
// }
