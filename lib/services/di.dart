import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/features/authentication/di/authentication_module.dart';
import 'package:boilerplate/features/onboarding/di/onboarding_module.dart';
import 'package:boilerplate/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../core/client/network_utils.dart';
import '../core/constants/endpoints.dart';

final di = GetIt.I;

Future<void> initLocator() async {
  await initCore();
  initFeatures();
}

Future<void> initCore() async {
  initStorage();
  await initNetwork(NetworkServiceType.staging);
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
          () => NetworkService(baseUrl: Endpoints.urlProd));
      break;
    case NetworkServiceType.staging:
      di.registerLazySingleton<NetworkService>(
          () => NetworkService(baseUrl: Endpoints.urlStaging));
  }
}

void initStorage() {
  di.registerLazySingleton<SecureStorage>(() => SecureStorage());
}
