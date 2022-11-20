import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/order/order_model.dart';
import '../../../model/product/product_model.dart';
import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import 'order_product_list.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    final List<Product> product = Product.products
        .where((item) => order.productId.contains(item.id))
        .toList();
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    ' order id: {order.id}',
                    style: const TextStyle(
                      color: kblackText,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   DateFormat('dd-MM-yyyy').format(
                  //     order.orderedDate,
                  //   ),
                  //   style: const TextStyle(
                  //     color: kblackText,
                  //     fontSize: 22,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
              kheight,
              OrderProductList(product: product),
              kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        'Delivery Fee',
                        style: TextStyle(
                          color: kblackText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${order.deliveryFee}',
                        style: const TextStyle(
                          color: kblackText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        'Sub Total',
                        style: TextStyle(
                          color: kblackText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${order.subTotal}',
                        style: const TextStyle(
                          color: kblackText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        'Total',
                        style: TextStyle(
                          color: kblackText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${order.total}',
                        style: const TextStyle(
                          color: kblackText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kblack,
                      minimumSize: const Size(120, 40),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.check),
                    label: const Text('Accept'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kblack,
                      minimumSize: const Size(120, 40),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                    label: const Text('Cancel'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
