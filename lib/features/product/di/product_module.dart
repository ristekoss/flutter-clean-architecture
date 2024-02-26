import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/features/product/data/product_repository_impl.dart';
import 'package:boilerplate/features/product/data/remote/product_remote_data_sources.dart';
import 'package:boilerplate/features/product/domain/product_interactor.dart';
import 'package:boilerplate/features/product/domain/repository/product_repository.dart';
import 'package:boilerplate/features/product/domain/use_cases/product_use_cases.dart';
import 'package:boilerplate/features/product/presentation/home/blocs/product_home_bloc.dart';
import 'package:get_it/get_it.dart';

void registerProduct(GetIt di) {
  di.registerFactory<ProductRemoteDataSources>(
      () => ProductRemoteDataSourceImpl(di<NetworkService>()));
  di.registerFactory<ProductRepository>(
      () => ProductRepositoryImpl(di<ProductRemoteDataSources>()));
  di.registerFactory<ProductUseCases>(
      () => ProductInteractor(di<ProductRepository>()));
  di.registerLazySingleton<ProductHomeBloc>(
      () => ProductHomeBloc(di<ProductUseCases>()));
}
