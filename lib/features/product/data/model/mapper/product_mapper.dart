import 'package:boilerplate/features/product/data/model/responses/list_product_response.dart';

import '../../../domain/model/product.dart';
import '../responses/product_item_response.dart';

class ProductMapper {

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
