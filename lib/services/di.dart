import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/core/constants/secrets.dart';
import 'package:boilerplate/features/authentication/di/authentication_module.dart';
import 'package:boilerplate/features/onboarding/di/onboarding_module.dart';
import 'package:boilerplate/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../core/client/network_utils.dart';

final di = GetIt.I;

Future<void> initLocator(NetworkServiceType type) async {
  await initCore(type);
  initFeatures();
}

Future<void> initCore(NetworkServiceType type) async {
  initStorage();
  await initNetwork(type);
}

void initFeatures() {
  registerOnboarding(di);
  registerAuthentication(di);
}

Future<void> initNetwork(NetworkServiceType type) async {
  di.registerLazySingleton<NetworkUtils>(() => NetworkUtils());
  await di<NetworkUtils>().init();

  switch (type) {
    case NetworkServiceType.production:
      di.registerLazySingleton<NetworkService>(
          () => NetworkService(baseUrl: Secret.baseUrlProd));
      break;
    case NetworkServiceType.staging:
      di.registerLazySingleton<NetworkService>(
          () => NetworkService(baseUrl: Secret.baseUrlDev));
  }
}

void initStorage() {
  di.registerLazySingleton<SecureStorage>(() => SecureStorage());
}
