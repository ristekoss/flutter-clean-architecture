import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/core/database/secure_database.dart';
import 'package:boilerplate/features/profile/data/local/profile_local_data_sources.dart';
import 'package:boilerplate/features/profile/data/profile_repository_impl.dart';
import 'package:boilerplate/features/profile/data/remote/profile_remote_data_sources.dart';
import 'package:boilerplate/features/profile/domain/profile_interactor.dart';
import 'package:boilerplate/features/profile/domain/repository/profile_repository.dart';
import 'package:boilerplate/features/profile/domain/use_cases/profile_use_cases.dart';
import 'package:boilerplate/features/profile/presentation/blocs/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

void registerProfile(GetIt di) {
  di.registerFactory<ProfileRemoteDataSources>(
      () => ProfileRemoteDataSourceImpl(di<NetworkService>()));
  di.registerFactory<ProfileLocalDataSources>(
      () => ProfileLocalDataSourcesImpl(di<SecureDatabase>()));
  di.registerFactory<ProfileRepository>(() => ProfileRepositoryImpl(
      di<ProfileRemoteDataSources>(), di<ProfileLocalDataSources>()));
  di.registerFactory<ProfileUseCases>(
      () => ProfileInteractor(di<ProfileRepository>()));
  di.registerLazySingleton<ProfileBloc>(
      () => ProfileBloc(di<ProfileUseCases>()));
}
