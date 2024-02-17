import 'package:boilerplate/design/constants/colors.dart';
import 'package:boilerplate/services/di.dart';
import 'package:flutter/material.dart';

import 'core/router/app_router_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
