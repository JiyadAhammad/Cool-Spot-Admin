import 'dart:convert';

import 'package:equatable/equatable.dart';

class Order extends Equatable {
  // ignore: always_specify_types
  factory Order.fromSnapshot(snap) {
    return Order(
      // id: snap['id'] as int,
      // cutomerId: snap['customerAddress'] as Map<String,dynamic>,
      cutomerId: snap['customerAddress'] as Map<String, dynamic>,
      productId: snap['Product'] as List<dynamic>,
      deliveryFee: snap['deliveryFee'] as String,
      subTotal: snap['subTotal'] as String,
      total: snap['total'] as String,
      isAccepted: snap['isAccepted'] as bool,
      isCanceled: snap['isCanceled'] as bool,
      isdelivered: snap['isdelivered'] as bool,
      // orderedDate: snap['orderedDate'].toDate(),
    );
  }
  const Order({
    // required this.id,
    required this.cutomerId,
    required this.productId,
    required this.deliveryFee,
    required this.subTotal,
    required this.total,
    required this.isAccepted,
    required this.isdelivered,
    required this.isCanceled,
    // required this.orderedDate,
  });

  // final int id;
  final Map<String, dynamic> cutomerId;
  final List<dynamic> productId;
  final String deliveryFee;
  final String subTotal;
  final String total;
  final bool isAccepted;
  final bool isdelivered;
  final bool isCanceled;
  // final DateTime orderedDate;

  Order copyWith({
    // int? id,
    Map<String, dynamic>? cutomerId,
    List<dynamic>? productId,
    String? deliveryFee,
    String? subTotal,
    String? total,
    bool? isAccepted,
    bool? isdelivered,
    bool? isCanceled,
    // DateTime? orderedDate,
  }) {
    return Order(
      // id: id ?? this.id,
      cutomerId: cutomerId ?? this.cutomerId,
      productId: productId ?? this.productId,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      isAccepted: isAccepted ?? this.isAccepted,
      isdelivered: isdelivered ?? this.isdelivered,
      isCanceled: isCanceled ?? this.isCanceled,
      // orderedDate: orderedDate ?? this.orderedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'cutomerId': cutomerId,
      'productId': productId,
      'deliveryFee': deliveryFee,
      'subTotal': subTotal,
      'total': total,
      'isAccepted': isAccepted,
      'isdelivered': isdelivered,
      'isCanceled': isCanceled,
      // 'ordered': orderedDate,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return <Object?>[
      // id,
      cutomerId,
      productId,
      deliveryFee,
      subTotal,
      total,
      isAccepted,
      isdelivered,
      isCanceled,
      // orderedDate,
    ];
  }

  // static List<Order> order = <Order>[
  //   Order(
  //     // id: 1,
  //     cutomerId: [],
  //     productId: const <int>[1, 2],
  //     deliveryFee: 20,
  //     subTotal: 40,
  //     total: 60,
  //     isAccepted: false,
  //     isdelivered: false,
  //     isCanceled: false,
  //     // orderedDate: DateTime.now(),
  //   ),
  //   Order(
  //     // id: 2,
  //     cutomerId: [101],
  //     productId: const <int>[1, 2, 3],
  //     deliveryFee: 20,
  //     subTotal: 60,
  //     total: 80,
  //     isAccepted: false,
  //     isdelivered: false,
  //     isCanceled: false,
  //     // orderedDate: DateTime.now(),
  //   ),
  //   Order(
  //     // id: 2,
  //     cutomerId: [101],
  //     productId: const <int>[3],
  //     deliveryFee: 20,
  //     subTotal: 60,
  //     total: 80,
  //     isAccepted: false,
  //     isdelivered: false,
  //     isCanceled: false,
  //     // orderedDate: DateTime.now(),
  //   ),
  // ];
}
