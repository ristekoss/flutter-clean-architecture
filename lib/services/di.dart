import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/features/authentication/di/authentication_module.dart';
import 'package:boilerplate/features/onboarding/di/onboaring_module.dart';
import 'package:get_it/get_it.dart';

import '../core/client/network_utils.dart';
import '../core/constants/endpoints.dart';

final di = GetIt.I;

void initLocator(){
  initCore();
  initFeatures();

}

void initCore() {
  initNetwork(NetworkServiceType.staging);
}

void initFeatures() {
  registerOnboarding(di);
  registerAuthentication(di);
}

void initNetwork(NetworkServiceType type) {
  di.registerLazySingleton(() => NetworkUtils());
  switch (type) {
    case NetworkServiceType.production:
      di.registerLazySingleton(
              () => NetworkService(baseUrl: Endpoints.urlProd));
      break;
    case NetworkServiceType.staging:
      di.registerLazySingleton(
              () => NetworkService(baseUrl: Endpoints.urlStaging));
  }
}

