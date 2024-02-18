import 'package:boilerplate/features/product/presentation/home/pages/product_home_page.dart';
import 'package:boilerplate/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/go.dart';
import '../../../../design/constants/colors.dart';

class MainPage extends StatelessWidget {
  final Widget body;

  const MainPage({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: AppColors.primary, child: SafeArea(child: body)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Go.getLocation(context).contains("product") ? 0 : 1,
        onTap: (index) {
          switch (index) {
            case 0:
              context.goNamed(ProductHomePage.route);
            case 1:
              context.goNamed(ProfilePage.route);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }
}
