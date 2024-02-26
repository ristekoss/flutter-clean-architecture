import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/product/domain/model/product.dart';
import 'package:boilerplate/features/product/domain/repository/product_repository.dart';
import 'package:boilerplate/features/product/domain/use_cases/product_use_cases.dart';
import 'package:dartz/dartz.dart';

class ProductInteractor implements ProductUseCases {
  final ProductRepository _repository;
  ProductInteractor(this._repository);

  @override
  Future<Either<NetworkException, List<Product>>> getProducts(int limit, int skip) {
    return _repository.getProducts(limit, skip);
  }
  
}