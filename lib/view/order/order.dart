import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/order/order_model.dart';
import '../../model/product/product_model.dart';
import '../constant/color/colors.dart';
import '../home/home_screen.dart';
import '../widget/custom_nav_bar.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          barTitle: 'Orders',
          action: Icons.check,
          onPressed: () {},
        ),
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

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    final List<Product> product = Product.products
        .where((Product item) => order.productId.contains(item.id))
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
                    ' order id${order.id}',
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(
                      order.orderedDate,
                    ),
                  ),
                ],
              ),
              OrderProductList(product: product),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Delivery Fee',
                      ),
                      Text(
                        '${order.deliveryFee}',
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Total',
                      ),
                      Text(
                        '${order.subTotal}',
                      ),
                    ],
                  ),
                ],
              ),
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

class OrderProductList extends StatelessWidget {
  const OrderProductList({
    Key? key,
    required this.product,
  }) : super(key: key);

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            SizedBox(
              width: 70,
              height: 60,
              child: Image.network(
                product[index].imageUrl,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product[index].name,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    product[index].decription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
