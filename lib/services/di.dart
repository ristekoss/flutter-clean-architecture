import 'package:boilerplate/features/onboarding/di/onboaring_module.dart';
import 'package:get_it/get_it.dart';
import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/features/main/data/data_sources/main_remote_data_sources.dart';
import 'package:boilerplate/features/main/data/repositories/main_repository_impl.dart';
import 'package:boilerplate/features/main/domain/use_cases/get_users_use_case.dart';
import 'package:boilerplate/features/main/presentation/bloc/main_cubit.dart';

import '../core/client/network_utils.dart';
import '../core/constants/endpoints.dart';
import '../features/main/domain/repositories/main_repository.dart';

final di = GetIt.I;

void initLocator(){
  initCore();
  initFeatures();

}

void initCore() {
  initNetwork(NetworkServiceType.staging);
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

void initFeatures() {
  registerOnboarding(di);
  initMain();
}

void initMain(){
  di.registerFactory<MainRemoteDataSources>(() => MainRemoteDataSourceImpl(di<NetworkService>()));
  di.registerFactory<MainRepository>(() => MainRepositoryImpl(di<MainRemoteDataSources>()));

  // USE CASE
  di.registerFactory<GetUserUseCase>(() => GetUserUseCase(di<MainRepository>()));

  di.registerLazySingleton<MainCubit>(() => MainCubit(
    getUserUseCase: di<GetUserUseCase>()
  ));
}

