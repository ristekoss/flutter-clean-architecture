import 'package:boilerplate/features/product/data/model/responses/product_item_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_product_response.freezed.dart';
part 'list_product_response.g.dart';

@freezed
class ListProductResponse with _$ListProductResponse {
  const factory ListProductResponse({
    required List<ProductItemResponse> products,
    required int total,
    required int skip,
    required int limit,
  }) = _ListProductsResponse;

  factory ListProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProductResponseFromJson(json);
}
