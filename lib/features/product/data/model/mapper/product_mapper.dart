import 'package:boilerplate/features/product/data/model/responses/list_product_response.dart';

import '../../../domain/model/product.dart';
import '../../../domain/model/product_user.dart';
import '../responses/product_item_response.dart';
import '../responses/product_user_response.dart';

class ProductMapper {
  static ProductUser mapResponseToDomain(ProductUserResponse response) {
    return ProductUser(
      id: response.id,
      username: response.username,
      email: response.email,
      firstName: response.firstName,
      lastName: response.lastName,
      gender: response.gender,
      image: response.image,
    );
  }

  static List<Product> mapListProductResponseToDomain(
    ListProductResponse response,
  ) {
    return response.products.map((e) => mapProductResponseToDomain(e)).toList();
  }

  static Product mapProductResponseToDomain(ProductItemResponse response) {
    return Product(
      id: response.id,
      title: response.title,
      description: response.description,
      price: response.price,
      discountPercentage: response.discountPercentage,
      rating: response.rating,
      stock: response.stock,
      brand: response.brand,
      category: response.category,
      thumbnail: response.thumbnail,
      images: response.images,
    );
  }
}
