import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/core/database/secure_database.dart';
import 'package:boilerplate/features/authentication/data/auth_repository_impl.dart';
import 'package:boilerplate/features/authentication/data/local/auth_local_data_sources.dart';
import 'package:boilerplate/features/authentication/data/remote/auth_remote_data_sources.dart';
import 'package:boilerplate/features/authentication/domain/authentication_interactor.dart';
import 'package:boilerplate/features/authentication/domain/repository/auth_repository.dart';
import 'package:boilerplate/features/authentication/domain/use_cases/authentication_use_cases.dart';
import 'package:boilerplate/features/authentication/presentation/blocs/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

void registerAuthentication(GetIt di) {
  di.registerLazySingleton<AuthRemoteDataSources>(
      () => AuthRemoteDataSourceImpl(di<NetworkService>()));
  di.registerLazySingleton<AuthLocalDataSources>(
    () => AuthLocalDataSourcesImpl(
      di<SecureDatabase>(),
    ),
  );
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      di<AuthRemoteDataSources>(),
      di<AuthLocalDataSources>(),
    ),
  );
  di.registerLazySingleton<AuthenticationUseCases>(
      () => AuthenticationInteractor(di<AuthRepository>()));
  di.registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(di<AuthenticationUseCases>()));
}
