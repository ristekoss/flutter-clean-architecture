import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/product/data/model/request/get_list_product_request.dart';
import 'package:boilerplate/features/product/data/remote/product_remote_data_sources.dart';
import 'package:boilerplate/features/product/domain/model/product.dart';
import 'package:dartz/dartz.dart';

import '../../../core/client/api_call.dart';
import '../domain/repository/product_repository.dart';
import 'model/mapper/product_mapper.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSources _dataSources;

  const ProductRepositoryImpl(this._dataSources);

  @override
  Future<Either<NetworkException, List<Product>>> getProducts(
    int limit,
    int skip,
  ) {
    final request = GetListProductRequest(limit: limit, skip: skip);
    return apiCall<List<Product>>(
      func: _dataSources.getProducts(request),
      mapper: (value) => ProductMapper.mapListProductResponseToDomain(value),
    );
  }
}
