import 'package:boilerplate/features/product/domain/model/product_categories.dart';
import 'package:flutter/material.dart';

class ProductStaticDataSources {
  static List<ProductCategories> productCategories = const [
    ProductCategories(
      icon: Icons.phone_android,
      title: 'Phone',
    ),
    ProductCategories(
      icon: Icons.laptop_chromebook,
      title: 'Laptop',
    ),
    ProductCategories(
      icon: Icons.electric_bike,
      title: 'Automotive',
    ),
    ProductCategories(
      icon: Icons.local_grocery_store,
      title: 'Groceries',
    ),
    ProductCategories(
      icon: Icons.home,
      title: 'Furniture',
    ),
  ];
}
