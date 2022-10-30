import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product/product_controller.dart';
import '../../../model/product/product_model.dart';
import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';

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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    child: product.imageUrl.isEmpty
                        ? const CircularProgressIndicator(
                            strokeWidth: 2.0,
                          )
                        : Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                  ),
                  kwidth5,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Text(
                              'Price',
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.1,
                              child: SizedBox(
                                child: Slider(
                                  value: product.price.toDouble(),
                                  onChanged: (value) {
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
                                max: 20,
                                divisions: 5,
                                activeColor: kblackIcon,
                                inactiveColor: kbluegrey,
                              ),
                            ),
                            Text(
                              '₹${product.quantity}',
                            ),
                          ],
                        ),
                      ],
                    ),
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
