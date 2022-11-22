import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_spot_admin/model/order/order_model.dart';
import '../../model/product/product_model.dart';

class DataBaseService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<dynamic> alldata = [];

  Stream<List<Product>> getProduct() {
    return firebaseFirestore.collection('products').snapshots().map(
      (QuerySnapshot<Map<String, dynamic>> snapshot) {
        return snapshot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                Product.fromSnapshot(doc))
            .toList();
      },
    );
  }

  Future<void> addProduct(Product product) {
    return firebaseFirestore.collection('products').add(
          product.toMap(),
        );
  }

  Stream<List<Order>> getOrders() {
    return firebaseFirestore.collection('checkout').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Order>> getPendingOrders() {
    return firebaseFirestore
        .collection('orders')
        .where('isCancelled', isEqualTo: false)
        .where('isDelivered', isEqualTo: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  Future<void> updateOrder(
    Order order,
    String field,
    dynamic newValue,
  ) {
    return firebaseFirestore
        .collection('orders')
        .where('id', isEqualTo: order.id)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }
}
