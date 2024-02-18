import 'package:boilerplate/design/constants/colors.dart';
import 'package:flutter/material.dart';

import 'core/router/app_router_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Boilerplate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        useMaterial3: true,
      ),
      routerConfig: AppRouterConfig.getRouter(),
    );
  }
}