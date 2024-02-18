import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_user_response.freezed.dart';
part 'product_user_response.g.dart';

@freezed
class ProductUserResponse with _$ProductUserResponse {
  const factory ProductUserResponse({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String image,
  }) = _ProductUserResponse;

  factory ProductUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductUserResponseFromJson(json);
}