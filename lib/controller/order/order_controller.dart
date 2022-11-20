import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_spot_admin/model/order/order_model.dart';
import 'package:cool_spot_admin/service/database/database_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final DataBaseService dataBaseService = DataBaseService();
  var orders = <Order>[].obs;

  @override
  void onInit() {
    // orders.bindStream(dataBaseService.getOrders());
    getData();
    super.onInit();
  }

  // @override
  // void onInit() {
  //   orders.bindStream(dataBaseService.getData());
  //   super.onInit();
  // }
  Future<QuerySnapshot?> getData() async {
    log('message0');
    var dataofItem = FirebaseFirestore.instance
        .collection('checkout')
        .get()
        .then((QuerySnapshot? querySnapshot) {
      for (var doc in querySnapshot!.docs) {
        orders = doc["customerAddress"];
        log("allData = $orders");
        //  print("getData = ${doc["item_text_"]}");
      }
    });
    log('$dataofItem data of item');
    // orders.add(orders as Order);
    return dataofItem;
  }
}
