import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final double price;
  final String image;
  final String unit;
  bool isFav;
  bool isNew;
  final Color bgColor;

  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    required this.unit,
    this.isFav = false,
    this.isNew = false,
    required this.bgColor,
  });
}

final List<ProductModel> productList = [
  ProductModel(
    name: 'Fresh Peach',
    price: 8.0,
    image: 'assets/peach.png',
    unit: 'dozen',
    bgColor: Colors.orange.shade50,
  ),
  ProductModel(
    name: 'Avocado',
    price: 7.0,
    image: 'assets/avocado.png',
    unit: '2.0 lbs',
    isNew: true,
    bgColor: Colors.green.shade50,
  ),
  ProductModel(
    name: 'Pineapple',
    price: 9.9,
    image: 'assets/pineapple.png',
    unit: '1.50 lbs',
    isFav: true,
    bgColor: Colors.yellow.shade50,
  ),
  ProductModel(
    name: 'Black Grapes',
    price: 7.05,
    image: 'assets/grapes.png',
    unit: '5.0 lbs',
    bgColor: Colors.purple.shade50,
  ),
  ProductModel(
    name: 'Pomegranate',
    price: 2.09,
    image: 'assets/pomegranate.png',
    unit: '1.50 lbs',
    isNew: true,
    bgColor: Colors.pink.shade50,
  ),
  ProductModel(
    name: 'Fresh Broccoli',
    price: 3.00,
    image: 'assets/broccoli.png',
    unit: '1 kg',
    isFav: true,
    bgColor: Colors.green.shade100,
  ),
   ProductModel(
    name: 'Fresh Lime',
    price: 3.00,
    image: 'assets/lime.png',
    unit: '1 kg',
    isFav: true,
    bgColor: Colors.green.shade100,
  ),
];
