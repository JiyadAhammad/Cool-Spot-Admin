import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../service/storage_service/storage_service.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../home/home_screen.dart';
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

  StorageService storage = StorageService();
  String? imageUrl;
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          barTitle: 'Add Product',
          action: Icons.check,
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.width / 2,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      image.toString(),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: MediaQuery.of(context).size.width / 5,
                    child: RawMaterialButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image == null) {
                          Get.snackbar('no Image selected', '');
                        }
                        if (image != null) {
                          await storage.uploadImage(image!);
                          try {
                            imageUrl =
                                await storage.getDownloadURL(image!.name);
                          } catch (e) {
                            log(e.toString());
                          }

                          log(imageUrl!);
                        }
                      },
                      fillColor: const Color(0xFFF5F6F9),
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kheight,
            textFormFeild('Product ID'),
            textFormFeild('Product Name'),
            textFormFeild('Product Price'),
            textFormFeild('Product Description'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                checkBoxWidget('Recommended'),
                checkBoxWidget('Popular'),
              ],
            ),
            sliderWidget('Price'),
            sliderWidget('Qanty'),
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
      bottomNavigationBar: const CustomNavBar(),
    );
  }

  Row checkBoxWidget(String value) {
    return Row(
      children: <Widget>[
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Checkbox(
          value: false,
          onChanged: (bool? value) {},
        ),
      ],
    );
  }

  Row sliderWidget(String text) {
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
            value: 0,
            onChanged: (double value) {},
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
