import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_item_response.freezed.dart';
part 'product_item_response.g.dart';

@freezed
class ProductItemResponse with _$ProductItemResponse {
  const factory ProductItemResponse({
    required int id,
    required String title,
    required String description,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required String brand,
    required String category,
    required String thumbnail,
    required List<String> images,
  }) = _ProductItemResponse;

  factory ProductItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductItemResponseFromJson(json);
}
