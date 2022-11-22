// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class Order extends Equatable {
//   // ignore: always_specify_types
//   factory Order.fromSnapshot(snap) {
//     return Order(
//       // id: snap['id'] as int,
//       // cutomerId: snap['customerAddress'] as Map<String,dynamic>,
//       cutomerId: snap['customerAddress'] as Map<String, dynamic>,
//       productId: snap['Product'] as List<dynamic>,
//       deliveryFee: snap['deliveryFee'] as String,
//       subTotal: snap['subTotal'] as String,
//       total: snap['total'] as String,
//       isAccepted: snap['isAccepted'] as bool,
//       isCanceled: snap['isCanceled'] as bool,
//       isdelivered: snap['isdelivered'] as bool,
//       // orderedDate: snap['orderedDate'].toDate(),
//     );
//   }
//   const Order({
//     // required this.id,
//     required this.cutomerId,
//     required this.productId,
//     required this.deliveryFee,
//     required this.subTotal,
//     required this.total,
//     required this.isAccepted,
//     required this.isdelivered,
//     required this.isCanceled,
//     // required this.orderedDate,
//   });

//   // final int id;
//   final Map<String, dynamic> cutomerId;
//   final List<dynamic> productId;
//   final String deliveryFee;
//   final String subTotal;
//   final String total;
//   final bool isAccepted;
//   final bool isdelivered;
//   final bool isCanceled;
//   // final DateTime orderedDate;

//   Order copyWith({
//     // int? id,
//     Map<String, dynamic>? cutomerId,
//     List<dynamic>? productId,
//     String? deliveryFee,
//     String? subTotal,
//     String? total,
//     bool? isAccepted,
//     bool? isdelivered,
//     bool? isCanceled,
//     // DateTime? orderedDate,
//   }) {
//     return Order(
//       // id: id ?? this.id,
//       cutomerId: cutomerId ?? this.cutomerId,
//       productId: productId ?? this.productId,
//       deliveryFee: deliveryFee ?? this.deliveryFee,
//       subTotal: subTotal ?? this.subTotal,
//       total: total ?? this.total,
//       isAccepted: isAccepted ?? this.isAccepted,
//       isdelivered: isdelivered ?? this.isdelivered,
//       isCanceled: isCanceled ?? this.isCanceled,
//       // orderedDate: orderedDate ?? this.orderedDate,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       // 'id': id,
//       'cutomerId': cutomerId,
//       'productId': productId,
//       'deliveryFee': deliveryFee,
//       'subTotal': subTotal,
//       'total': total,
//       'isAccepted': isAccepted,
//       'isdelivered': isdelivered,
//       'isCanceled': isCanceled,
//       // 'ordered': orderedDate,
//     };
//   }

//   String toJson() => json.encode(toMap());

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props {
//     return <Object?>[
//       // id,
//       cutomerId,
//       productId,
//       deliveryFee,
//       subTotal,
//       total,
//       isAccepted,
//       isdelivered,
//       isCanceled,
//       // orderedDate,
//     ];
//   }

//   // static List<Order> order = <Order>[
//   //   Order(
//   //     // id: 1,
//   //     cutomerId: [],
//   //     productId: const <int>[1, 2],
//   //     deliveryFee: 20,
//   //     subTotal: 40,
//   //     total: 60,
//   //     isAccepted: false,
//   //     isdelivered: false,
//   //     isCanceled: false,
//   //     // orderedDate: DateTime.now(),
//   //   ),
//   //   Order(
//   //     // id: 2,
//   //     cutomerId: [101],
//   //     productId: const <int>[1, 2, 3],
//   //     deliveryFee: 20,
//   //     subTotal: 60,
//   //     total: 80,
//   //     isAccepted: false,
//   //     isdelivered: false,
//   //     isCanceled: false,
//   //     // orderedDate: DateTime.now(),
//   //   ),
//   //   Order(
//   //     // id: 2,
//   //     cutomerId: [101],
//   //     productId: const <int>[3],
//   //     deliveryFee: 20,
//   //     subTotal: 60,
//   //     total: 80,
//   //     isAccepted: false,
//   //     isdelivered: false,
//   //     isCanceled: false,
//   //     // orderedDate: DateTime.now(),
//   //   ),
//   // ];
// }

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final int customerId;
  final List<int> productIds;
  final double deliveryFee;
  final double subtotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final bool isCancelled;
  final DateTime createdAt;

  const Order({
    required this.id,
    required this.customerId,
    required this.productIds,
    required this.deliveryFee,
    required this.subtotal,
    required this.total,
    required this.isAccepted,
    required this.isDelivered,
    required this.isCancelled,
    required this.createdAt,
  });

  Order copyWith({
    int? id,
    int? customerId,
    List<int>? productIds,
    double? deliveryFee,
    double? subtotal,
    double? total,
    bool? isAccepted,
    bool? isDelivered,
    bool? isCancelled,
    DateTime? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      productIds: productIds ?? this.productIds,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      isAccepted: isAccepted ?? this.isAccepted,
      isDelivered: isDelivered ?? this.isDelivered,
      isCancelled: isCancelled ?? this.isCancelled,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'productIds': productIds,
      'deliveryFee': deliveryFee,
      'subtotal': subtotal,
      'total': total,
      'isAccepted': isAccepted,
      'isDelivered': isDelivered,
      'isCancelled': isCancelled,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromSnapshot(DocumentSnapshot snap) {
    return Order(
      id: snap['id'],
      customerId: snap['customerId'],
      productIds: List<int>.from(snap['productIds']),
      deliveryFee: snap['deliveryFee'],
      subtotal: snap['subtotal'],
      total: snap['total'],
      isAccepted: snap['isAccepted'],
      isDelivered: snap['isDelivered'],
      isCancelled: snap['isCancelled'],
      createdAt: snap['createdAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productIds,
      deliveryFee,
      subtotal,
      total,
      isAccepted,
      isDelivered,
      isCancelled,
      createdAt,
    ];
  }

  static List<Order> orders = [
    Order(
      id: 1,
      customerId: 2345,
      productIds: const [1, 2],
      deliveryFee: 10,
      subtotal: 20,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      isCancelled: false,
      createdAt: DateTime.now(),
    ),
    Order(
      id: 2,
      customerId: 23,
      productIds: const [1, 2, 3],
      deliveryFee: 10,
      subtotal: 30,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      isCancelled: false,
      createdAt: DateTime.now(),
    ),
    Order(
      id: 2,
      customerId: 23,
      productIds: const [2, 1],
      deliveryFee: 10,
      subtotal: 30,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      isCancelled: false,
      createdAt: DateTime.now(),
    ),
  ];
}
