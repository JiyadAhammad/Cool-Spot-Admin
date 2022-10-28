import 'package:flutter/material.dart';

import '../../../model/product/product_model.dart';
import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';

class OrderProductList extends StatelessWidget {
  const OrderProductList({
    super.key,
    required this.product,
  });

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: product.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 70,
                height: 60,
                child: Image.network(
                  product[index].imageUrl,
                ),
              ),
              kwidth,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product[index].name,
                    style: const TextStyle(
                      color: kblackText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kheight5,
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      product[index].decription,
                      style: const TextStyle(
                        color: kblackText,
                        fontSize: 17,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  kheight5,
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
