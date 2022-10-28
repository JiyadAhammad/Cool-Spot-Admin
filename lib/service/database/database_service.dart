import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/product/product_model.dart';

class DataBaseService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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
}
