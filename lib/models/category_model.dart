import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CategoryModel {
  final IconData icon;
  final String label;
  final Color color;

  CategoryModel({
    required this.icon,
    required this.label,
    required this.color,
  });
}

final List<CategoryModel> categoryList = [
  CategoryModel(
      icon: FontAwesome5Solid.leaf,
      label: 'Vegetables',
      color: Colors.green),
  CategoryModel(
      icon: MaterialCommunityIcons.food_apple,
      label: 'Fruits',
      color: Colors.red),
  CategoryModel(
      icon: FontAwesome5Solid.cocktail, label: 'Beverages', color: Colors.orange),
  CategoryModel(icon: MaterialCommunityIcons.package_variant_closed, label: 'Grocery', color: Colors.purple),
  CategoryModel(
      icon: FontAwesome5Solid.wine_bottle,
      label: 'Edible oil',
      color: Colors.teal),
  CategoryModel(
      icon: MaterialCommunityIcons.vacuum, label: 'Household', color: Colors.pinkAccent),
  CategoryModel(
      icon: Icons.child_care, label: 'Babycare', color: Colors.blue),
];
