import 'package:charts_flutter/flutter.dart' as charts;

import '../../view/constant/color/colors.dart';

class OrderStatus {
  OrderStatus({
    required this.dateTime,
    required this.index,
    required this.orders,
    this.barColor,
  }) {
    barColor = charts.ColorUtil.fromDartColor(kblack);
  }

  final DateTime dateTime;
  final int index;
  final int orders;
  charts.Color? barColor;

  static final List<OrderStatus> status = <OrderStatus>[
    OrderStatus(
      dateTime: DateTime.now(),
      index: 1,
      orders: 10,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 2,
      orders: 15,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 3,
      orders: 12,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 4,
      orders: 18,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 5,
      orders: 15,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 6,
      orders: 12,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 7,
      orders: 10,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 8,
      orders: 15,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 9,
      orders: 12,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 10,
      orders: 18,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 11,
      orders: 15,
    ),
    OrderStatus(
      dateTime: DateTime.now(),
      index: 12,
      orders: 12,
    ),
  ];
}
