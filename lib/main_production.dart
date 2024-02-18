import 'package:boilerplate/app.dart';
import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/services/di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator(NetworkServiceType.production);
  runApp(const App());
}
