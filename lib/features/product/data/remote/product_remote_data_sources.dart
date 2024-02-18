import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/core/constants/endpoints.dart';
import 'package:boilerplate/features/product/data/model/request/get_list_product_request.dart';
import 'package:boilerplate/features/product/data/model/responses/list_product_response.dart';

import '../model/responses/product_user_response.dart';

abstract class ProductRemoteDataSources {
  Future<ProductUserResponse> getUser();

  Future<ListProductResponse> getProducts(GetListProductRequest request);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSources {
  final NetworkService networkService;

  const ProductRemoteDataSourceImpl(this.networkService);

  @override
  Future<ProductUserResponse> getUser() async {
    const url = Endpoints.getUser;
    final response = await networkService.get(url);
    return ProductUserResponse.fromJson(response.data);
  }

  @override
  Future<ListProductResponse> getProducts(GetListProductRequest request) async {
    const url = Endpoints.getProduct;
    final response = await networkService.get(
      url,
      queryParams: request.toJson(),
    );
    return ListProductResponse.fromJson(response.data);
  }
}
