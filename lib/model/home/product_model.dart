import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.name,
    required this.catergory,
    required this.decription,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.quantity = 0,
    this.price = 0,
  });

  final int id;
  final String name;
  final String catergory;
  final String decription;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  final int quantity;
  final double price;

  @override
  List<Object?> get props => <Object>[
        id,
        name,
        catergory,
        decription,
        imageUrl,
        isRecommended,
        isPopular,
        quantity,
        price,
      ];

  Product copyWith({
    int? id,
    String? name,
    String? catergory,
    String? decription,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    int? quantity,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      catergory: catergory ?? this.catergory,
      decription: decription ?? this.decription,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'catergory': catergory,
      'decription': decription,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  // ignore: sort_constructors_first
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      catergory: json['catergory'] as String,
      decription: json['decription'] as String,
      imageUrl: json['imageUrl'] as String,
      isRecommended: json['isRecommended'] as bool,
      isPopular: json['isPopular'] as bool,
      price: json['price'] as double,
      quantity: json['quantity'] as int,
    );
  }
  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  static List<Product> products = <Product>[
    const Product(
        id: 1,
        imageUrl:
            'https://img.taste.com.au/RemyDecY/w720-h480-cfill-q80/taste/2020/01/jan20_easy-berry-smoothie-taste-156331-1.jpg',
        name: 'Coca cola',
        price: 40.0,
        catergory: 'Cool Drinks',
        isRecommended: true,
        isPopular: true,
        decription: ''),
    const Product(
        id: 2,
        imageUrl:
            'https://3.imimg.com/data3/DS/UB/MY-14503484/soft-drink-500x500.png',
        name: 'Dew',
        price: 40.0,
        catergory: 'Cool Drinks',
        isRecommended: true,
        isPopular: false,
        decription: ''),
    const Product(
        id: 2,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcawjcJOFIRy1lq3EKx76d4qbV8MfN13CCjg&usqp=CAU',
        name: 'Fresh Lime',
        price: 20.0,
        catergory: 'Smoothies',
        isRecommended: false,
        isPopular: true,
        decription: ''),
    const Product(
        id: 2,
        imageUrl:
            'https://loveincorporated.blob.core.windows.net/contentimages/main/1249b51f-4258-44f6-8414-221954ae6a79-waterbottlefacts.jpg',
        name: 'Mango Juice',
        price: 60.0,
        catergory: 'Smoothies',
        isRecommended: true,
        isPopular: false,
        decription: ''),
    const Product(
        id: 2,
        imageUrl:
            'https://loveincorporated.blob.core.windows.net/contentimages/main/1249b51f-4258-44f6-8414-221954ae6a79-waterbottlefacts.jpg',
        name: 'Bisleri',
        price: 10.0,
        catergory: 'Water',
        isRecommended: false,
        isPopular: false,
        decription: ''),
    const Product(
        id: 2,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrTpIC4f7ooBZV6-A_Cpslt9IRRpGbVdoV8A&usqp=CAU',
        name: 'Kinley',
        price: 12.0,
        catergory: 'Water',
        isRecommended: false,
        isPopular: true,
        decription: ''),
  ];
}
