import 'package:boilerplate/features/product/presentation/home/widgets/product_home_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  static const route = '/product_home';

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        ProductHomeAppBarWidget(
          controller: _searchController,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  width: 100,
                  child: const Placeholder(),
                ),
                title: Text(
                  'Place ${index + 1}',
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
