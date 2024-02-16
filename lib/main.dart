import 'package:boilerplate/services/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bases/bloc_providers.dart';
import 'core/constants/endpoints.dart';
import 'core/router/app_router_config.dart';

void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.blocs(),
      child: MaterialApp.router(
        title: 'Flutter Boilerplate',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRouterConfig.getRouter(),
      ),
    );
  }
}
