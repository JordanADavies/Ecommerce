import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:ecommerce/screens/products/infrastructure/remote/products_api.dart';

class ProductsFacade {
  final ProductsApi _productsApi;

  ProductsFacade({ProductsApi? productsApi})
      : _productsApi = productsApi ?? ProductsApi();

  Future<Either<String, List<Product>>> fetchProducts(
      {required String category}) async {
    try {
      final response = await _productsApi.fetchProducts(category: category);
      if (response == null) return left('No products');
      final products = response.map(_mapToProduct).toList();
      return right(products);
    } catch (e) {
      return left('$e');
    }
  }

  Product _mapToProduct(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      desciption: map['description'],
      price: double.parse(map['price'].toString()),
      image: map['image'],
    );
  }
}
