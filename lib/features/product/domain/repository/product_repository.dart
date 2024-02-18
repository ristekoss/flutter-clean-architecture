import 'package:boilerplate/features/product/domain/model/product_user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/client/network_exception.dart';
import '../model/product.dart';

abstract class ProductRepository {
  Future<Either<NetworkException, List<Product>>> getProducts(
    int limit,
    int skip,
  );

  Future<Either<NetworkException, ProductUser>> getUser();
}
