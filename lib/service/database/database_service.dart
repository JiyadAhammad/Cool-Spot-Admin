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
    return firebaseFirestore.collection('checkout').snapshots().map(
      (QuerySnapshot<Map<String, dynamic>> snapshot) {
        // return snapshot.docs.map((item) => Order.fromSnapshot(item)).toList();
        return snapshot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                Order.fromSnapshot(doc))
            .toList();
      },
    );
  }

  
}
