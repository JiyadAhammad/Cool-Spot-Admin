import 'dart:convert';

import 'package:equatable/equatable.dart';

class Order extends Equatable {

  // ignore: always_specify_types
  factory Order.fromSnapshot(snap) {
    return Order(
      id: snap['id'] as int,
      cutomerId: snap['cutomerId'] as int,
      productId: snap['productId'] as List<int>,
      deliveryFee: snap['deliveryFee'] as double,
      subTotal: snap['subTotal'] as double,
      total: snap['total'] as double,
      isAccepted: snap['isAccepted'] as bool,
      isdelivered: snap['isdelivered'] as bool,
      orderedDate:
          DateTime.fromMillisecondsSinceEpoch(snap['orderedDate'] as int),
    );
  }
  const Order({
    required this.id,
    required this.cutomerId,
    required this.productId,
    required this.deliveryFee,
    required this.subTotal,
    required this.total,
    required this.isAccepted,
    required this.isdelivered,
    required this.orderedDate,
  });

  final int id;
  final int cutomerId;
  final List<int> productId;
  final double deliveryFee;
  final double subTotal;
  final double total;
  final bool isAccepted;
  final bool isdelivered;
  final DateTime orderedDate;

  Order copyWith({
    int? id,
    int? cutomerId,
    List<int>? productId,
    double? deliveryFee,
    double? subTotal,
    double? total,
    bool? isAccepted,
    bool? isdelivered,
    DateTime? orderedDate,
  }) {
    return Order(
      id: id ?? this.id,
      cutomerId: cutomerId ?? this.cutomerId,
      productId: productId ?? this.productId,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      isAccepted: isAccepted ?? this.isAccepted,
      isdelivered: isdelivered ?? this.isdelivered,
      orderedDate: orderedDate ?? this.orderedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cutomerId': cutomerId,
      'productId': productId,
      'deliveryFee': deliveryFee,
      'subTotal': subTotal,
      'total': total,
      'isAccepted': isAccepted,
      'isdelivered': isdelivered,
      'ordered': orderedDate,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return <Object?>[
      id,
      cutomerId,
      productId,
      deliveryFee,
      subTotal,
      total,
      isAccepted,
      isdelivered,
      orderedDate,
    ];
  }

  static List<Order> order = <Order>[
    Order(
      id: 1,
      cutomerId: 100,
      productId: const <int>[1, 2],
      deliveryFee: 20,
      subTotal: 40,
      total: 60,
      isAccepted: false,
      isdelivered: false,
      orderedDate: DateTime.now(),
    ),
    Order(
      id: 2,
      cutomerId: 101,
      productId: const <int>[1, 2, 3],
      deliveryFee: 20,
      subTotal: 60,
      total: 80,
      isAccepted: false,
      isdelivered: false,
      orderedDate: DateTime.now(),
    ),
    Order(
      id: 2,
      cutomerId: 101,
      productId: const <int>[3],
      deliveryFee: 20,
      subTotal: 60,
      total: 80,
      isAccepted: false,
      isdelivered: false,
      orderedDate: DateTime.now(),
    ),
  ];
}
