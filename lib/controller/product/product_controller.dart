import 'package:cool_spot_admin/service/database/database_service.dart';
import 'package:get/get.dart';

import '../../model/product/product_model.dart';

class ProductController extends GetxController {
  final DataBaseService dataBaseService = DataBaseService();
  var products = [].obs;

  @override
  void onInit() {
    products.bindStream(dataBaseService.getProduct());
    super.onInit();
  }

  var newProduct = {}.obs;

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
