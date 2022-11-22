// import 'dart:developer';

// import 'package:cool_spot_admin/controller/order/order_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../constant/color/colors.dart';
// import '../widget/custom_app_bar.dart';
// import '../widget/custom_nav_bar.dart';
// import 'widget/order_card_widget.dart';

// class Ordescreen extends StatelessWidget {
//   Ordescreen({super.key});

//   static const String routeName = '/order';
//   static Route<Ordescreen> route() {
//     return MaterialPageRoute<Ordescreen>(
//       settings: const RouteSettings(name: routeName),
//       builder: (_) => Ordescreen(),
//     );
//   }

//   final OrderController orderController = Get.put(
//     OrderController(),
//   );

//   @override
//   Widget build(BuildContext context) {
//     log('${orderController.orders.length} lenth of item in firebase in build');
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: CustomAppBar(
//         barTitle: 'Orders',
//         action: Icons.check,
//         onPressed: () {},
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: orderController.orders.length,
//               physics: const BouncingScrollPhysics(),
//               itemBuilder: (BuildContext context, int index) {
//                 log('${orderController.orders.length} lenth of item in firebase');
//                 return OrderCardWidget(
//                   order: orderController.orders[index],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: const CustomNavBar(),
//     );
//   }
// }
import 'package:cool_spot_admin/controller/order/order_controller.dart';
import 'package:cool_spot_admin/model/order/order_model.dart';
import 'package:cool_spot_admin/model/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);

  static const String routeName = '/order';
  static Route<OrdersScreen> route() {
    return MaterialPageRoute<OrdersScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => OrdersScreen(),
    );
  }

  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: orderController.pendingOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderCard(order: orderController.pendingOrders[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;
  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    var products = Product.products
        .where((product) => order.productIds.contains(product.id))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        top: 10.0,
        right: 10.0,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID: ${order.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yy').format(order.createdAt),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(
                            products[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 280,
                              child: Text(
                                Product.products[index].decription,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ],
                    );
                  }),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Delivery Fee',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${order.deliveryFee}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${order.total}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  order.isAccepted
                      ? ElevatedButton(
                          onPressed: () {
                            orderController.updateOrder(
                              order,
                              "isDelivered",
                              !order.isDelivered,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size(150, 40),
                          ),
                          child: const Text(
                            'Deliver',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            orderController.updateOrder(
                              order,
                              "isAccepted",
                              !order.isAccepted,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size(150, 40),
                          ),
                          child: const Text(
                            'Accept',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                  ElevatedButton(
                    onPressed: () {
                      orderController.updateOrder(
                        order,
                        "isCancelled",
                        !order.isCancelled,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(150, 40),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
