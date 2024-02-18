import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Go {
  static String getLocation(BuildContext context){
    return GoRouterState.of(context).uri.toString();
  }
}