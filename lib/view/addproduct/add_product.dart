import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/product/product_controller.dart';
import '../../service/storage_service/storage_service.dart';
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
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        barTitle: 'Add Product',
        action: Icons.check,
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
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
                      log(image.path);
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
                          ),
                          kwidth20,
                          Text(
                            'Add a Image',
                            style: TextStyle(
                              color: kwhiteText,
                              fontSize: 20,
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
              textFormFeild('Product Category'),
              textFormFeild('Product Name'),
              // textFormFeild('Product Price'),
              textFormFeild('Product Description'),
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
              sliderWidget(
                'Price',
                'price',
                productController,
                productController.price,
              ),
              sliderWidget(
                'Qanty',
                'quantity',
                productController,
                productController.quantity,
              ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kblack,
                  ),
                  onPressed: () {},
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
          value: (contrllerValue ?? true) as bool,
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
            max: 25,
            divisions: 10,
            activeColor: kblackIcon,
            inactiveColor: kbluegrey,
          ),
        ),
      ],
    );
  }

  Padding textFormFeild(String hintText) {
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
      ),
    );
  }
}
