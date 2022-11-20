import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/product/product_controller.dart';
import '../../model/product/product_model.dart';
import '../../service/database/database_service.dart';
import '../../service/storage/storage_service.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_nav_bar.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  static const String routeName = '/addproduct';
  static Route<AddProduct> route() {
    return MaterialPageRoute<AddProduct>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => AddProduct(),
    );
  }

  final StorageService storage = StorageService();
  final DataBaseService dataBaseService = DataBaseService();
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Fresh Jucie',
      'Burger',
      'Shawarma',
      'Pizza',
    ];
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        barTitle: 'Add Product',
        action: Icons.check,
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
        ),
        child: Obx(
          () => ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.width / 4,
                child: GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image == null) {
                      Get.snackbar(
                        "Could't find Path",
                        'Please Select an Image',
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: kwhiteText,
                        backgroundColor: kblack,
                      );
                    }
                    if (image != null) {
                      log('${image.path} this th direct path');
                      await storage.uploadImage(image);
                      final String imageUrl =
                          await storage.getDownloadURL(image.name);

                      productController.newProduct.update(
                        'imageUrl',
                        (_) => imageUrl,
                        ifAbsent: () => imageUrl,
                      );
                      log('${productController.newProduct['imageUrl']} this is the controlller');
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: kblack,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.add_a_photo,
                            color: kwhiteIcon,
                            size: 30,
                          ),
                          kwidth20,
                          Text(
                            'Add a Image',
                            style: TextStyle(
                              color: kwhiteText,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              kheight,
              // textFormFeild(
              //   'Product ID',
              //   'id',
              //   productController,
              // ),
              dropDownFormWidget(categories),

              textFormFeild(
                'Product Name',
                'name',
                productController,
              ),

              Row(
                children: [
                  NumberFormField(
                    hintText: 'Product Price',
                    name: 'price',
                    productController: productController,
                  ),
                  NumberFormField(
                    hintText: 'Quantity',
                    name: 'quantity',
                    productController: productController,
                  ),
                ],
              ),

              textFormFeild(
                'Product Description',
                'decription',
                productController,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  checkBoxWidget(
                    'Recommended',
                    'isRecommended',
                    productController,
                    productController.isRecommended,
                  ),
                  checkBoxWidget(
                    'Popular',
                    'isPopular',
                    productController,
                    productController.isPopular,
                  ),
                ],
              ),
              // sliderWidget(
              //   'Price',
              //   'price',
              //   100,
              //   productController,
              //   productController.price,
              // ),
              // sliderWidget(
              //   'Qanty',
              //   'quantity',
              //   25,
              //   productController,
              //   productController.quantity,
              // ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kblack,
                  ),
                  onPressed: () {
                    dataBaseService.addProduct(
                      Product(
                        id: productController.newProduct['id'],
                        name: productController.newProduct['name'],
                        catergory: productController.newProduct['catergory'],
                        decription: productController.newProduct['decription'],
                        imageUrl: productController.newProduct['imageUrl'],
                        isRecommended:
                            productController.newProduct['isRecommended'] ??
                                false,
                        isPopular:
                            productController.newProduct['isPopular'] ?? false,
                        price:
                            double.parse(productController.newProduct['price']),
                        quantity:
                            int.parse(productController.newProduct['quantity']),
                      ),
                    );
                    log('${productController.newProduct} this is lsit of map');
                    Get.back();
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('SAVE'),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }

  Widget dropDownFormWidget(List<String> categories) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: DropdownButtonFormField(
        iconSize: 20,
        decoration: InputDecoration(
          hintText: 'Product Categories',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              width: 3,
            ),
          ),
        ),
        items: categories.map(
          (item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          },
        ).toList(),
        onChanged: (value) {
          productController.newProduct.update(
            'catergory',
            (_) => value,
            ifAbsent: () => value,
          );
        },
      ),
    );
  }

  Row checkBoxWidget(
    String title,
    String name,
    ProductController productController,
    dynamic contrllerValue,
  ) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Checkbox(
          value: (contrllerValue ?? false) as bool,
          checkColor: kwhiteIcon,
          fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(
                MaterialState.disabled,
              )) {
                return kblackIcon.withOpacity(.32);
              }
              return kblackIcon;
            },
          ),
          onChanged: (bool? value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: () => value,
            );
          },
        ),
      ],
    );
  }

  Row sliderWidget(
    String text,
    String name,
    double maxValue,
    ProductController productController,
    dynamic contrllerValue,
  ) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        kwidtht50,
        Expanded(
          child: Slider(
            value: (contrllerValue == null) ? 0 : contrllerValue as double,
            onChanged: (double value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
            max: maxValue,
            divisions: 10,
            activeColor: kblackIcon,
            inactiveColor: kbluegrey,
          ),
        ),
      ],
    );
  }

  Padding textFormFeild(
    String hintText,
    String name,
    ProductController productController,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              width: 3,
            ),
          ),
        ),
        onChanged: (String value) {
          productController.newProduct.update(
            name,
            (_) => value,
            ifAbsent: () => value,
          );
        },
      ),
    );
  }
}

class NumberFormField extends StatelessWidget {
  const NumberFormField({
    Key? key,
    required this.productController,
    required this.hintText,
    required this.name,
  }) : super(key: key);

  final ProductController productController;
  final String hintText;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                width: 3,
              ),
            ),
          ),
          onChanged: (dynamic value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: () => value,
            );
          },
        ),
      ),
    );
  }
}
