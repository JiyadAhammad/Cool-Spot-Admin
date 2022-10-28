import 'package:get/get.dart';

import '../../model/product/product_model.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;

  RxMap<dynamic, dynamic> newProduct = <dynamic, dynamic>{}.obs;

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(
    int index,
    Product product,
    int value,
  ) {
    product.quantity = value;
    products[index] = product;
  }
}
