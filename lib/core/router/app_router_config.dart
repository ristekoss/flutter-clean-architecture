import 'package:boilerplate/features/authentication/presentation/pages/login_page.dart';
import 'package:boilerplate/features/main/presentation/pages/main_page.dart';
import 'package:boilerplate/features/main/presentation/pages/second_page.dart';
import 'package:boilerplate/features/main/presentation/pages/third_page.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class AppRouterConfig {
  static final GoRouter _router = GoRouter(
      initialLocation: LoginPage.route,
      routes: <RouteBase>[
        GoRoute(
          path: LoginPage.route,
          name: LoginPage.route,
          builder: (context, state) => const LoginPage()
        ),
        ShellRoute(
            builder: (context, state, child) => MainPage(body: child),
            routes: [
              GoRoute(
                  path: '/second',
                  name: AppRoutes.secondPage,
                pageBuilder: (context, state) => const NoTransitionPage(child: SecondPage()),
                builder: (context, state) => const SecondPage()
              ),
              GoRoute(
                  path: '/third',
                  name: AppRoutes.thirdPage,
                  pageBuilder: (context, state) => const NoTransitionPage(child: ThirdPage()),
                  builder: (context, state) => const ThirdPage()
              )
            ])
      ]);

  static GoRouter getRouter() => _router;
}