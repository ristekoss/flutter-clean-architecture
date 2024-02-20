import 'package:boilerplate/features/product/presentation/home/pages/product_home_page.dart';
import 'package:boilerplate/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/go.dart';

class MainPage extends StatelessWidget {
  final Widget body;

  static const route = '/main';

  const MainPage({Key? key, required this.body}) : super(key: key);

  static const List<String> routes = [
    ProductHomePage.route,
    ProfilePage.route,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: routes.indexOf(
          Go.getLocation(context),
        ),
        onTap: (index) => context.goNamed(routes[index]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
