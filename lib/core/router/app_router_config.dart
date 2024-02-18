import 'package:boilerplate/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:boilerplate/features/authentication/presentation/pages/login_page.dart';
import 'package:boilerplate/features/main/presentation/pages/main_page.dart';
import 'package:boilerplate/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:boilerplate/features/onboarding/presentation/pages/splash_page.dart';
import 'package:boilerplate/features/product/presentation/home/pages/product_home_page.dart';
import 'package:boilerplate/features/profile/presentation/pages/profile_page.dart';
import 'package:go_router/go_router.dart';

class AppRouterConfig {
  static final GoRouter _router = GoRouter(
    initialLocation: LoginPage.route,
    routes: <RouteBase>[
      GoRoute(
          path: ForgotPasswordPage.route,
          name: ForgotPasswordPage.route,
          builder: (context, state) => const ForgotPasswordPage()),
      GoRoute(
          path: SplashPage.route,
          name: SplashPage.route,
          builder: (context, state) => const SplashPage()),
      GoRoute(
          path: OnboardingPage.route,
          name: OnboardingPage.route,
          builder: (context, state) => const OnboardingPage()),
      GoRoute(
          path: LoginPage.route,
          name: LoginPage.route,
          builder: (context, state) => const LoginPage()),
      ShellRoute(
        builder: (context, state, child) => MainPage(body: child),
        routes: [
          GoRoute(
              path: ProductHomePage.route,
              name: ProductHomePage.route,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProductHomePage()),
              builder: (context, state) => const ProductHomePage()),
          GoRoute(
              path: ProfilePage.route,
              name: ProfilePage.route,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfilePage()),
              builder: (context, state) => const ProfilePage())
        ],
      )
    ],
  );

  static GoRouter getRouter() => _router;
}
