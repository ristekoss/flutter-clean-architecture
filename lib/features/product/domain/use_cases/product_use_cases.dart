import 'package:dartz/dartz.dart';

import '../../../../core/client/network_exception.dart';
import '../model/product.dart';
import '../model/product_user.dart';

abstract class ProductUseCases {
  Future<Either<NetworkException, ProductUser>> getUser();

  Future<Either<NetworkException, Product>> getProducts(
    int limit,
    int skip,
  );
}
