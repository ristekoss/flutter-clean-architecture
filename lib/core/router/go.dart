import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Go {
  static void pushNamed(BuildContext context, {required String route, Map<String, String>? params, Map<String, String>? queryParams}){
    GoRouter.of(context).pushNamed(route, pathParameters: params ?? const <String, String>{}, queryParameters: queryParams ?? const <String, String>{});
  }

  static void goNamed(BuildContext context, {required String route, Map<String, String>? params, Map<String, String>? queryParams}){
    GoRouter.of(context).goNamed(route, pathParameters: params ?? const <String, String>{}, queryParameters: queryParams ?? const <String, String>{});
  }

  static void pop(BuildContext context){
    GoRouter.of(context).pop();
  }

  static void pushReplacementNamed(BuildContext context, {required String route, Map<String, String>? params}){
    GoRouter.of(context).pushReplacementNamed(route, pathParameters: params ?? const <String, String>{});
  }

  static String getLocation(BuildContext context){
    return GoRouterState.of(context).uri.toString();
  }
}