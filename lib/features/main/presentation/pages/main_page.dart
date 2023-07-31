import 'package:flutter/material.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/router/go.dart';
import '../../../../design/constants/colors.dart';

class MainPage extends StatelessWidget {
  final Widget body;
  const MainPage({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColors.primary,
          child: SafeArea(child: body)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Go.getLocation(context).contains("second") ? 0 : 1,
        onTap: (index){
          switch(index){
            case 0:
              Go.goNamed(context, route: AppRoutes.secondPage);
            case 1:
              Go.goNamed(context, route: AppRoutes.thirdPage);
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

