import 'package:flutter/material.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  static const route = '/product_home';

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: const Text('Product Home'),
      ),
    );
  }
}
