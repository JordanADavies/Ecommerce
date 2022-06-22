import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/cart/infrastructure/local/cart_product_storage_provider.dart';
import 'package:ecommerce/screens/products/domain/product.dart';

class CartFacade {
  final CartProductStorageProvider _cartProductStorageProvider;

  CartFacade({CartProductStorageProvider? cartProductStorageProvider})
      : _cartProductStorageProvider =
            cartProductStorageProvider ?? CartProductStorageProvider();

  Future<Either<String, List<Product>>> fetchProducts() async {
    try {
      final productMaps = await _cartProductStorageProvider.fetchProducts();
      final products = productMaps.map((p) => Product.fromJson(p)).toList();
      return right(products);
    } catch (e) {
      return left('$e');
    }
  }

  Future<Either<String, Unit>> addProduct(Product product) async {
    try {
      await _cartProductStorageProvider.saveProduct(
        id: product.id,
        product: product.toJson(),
      );
      return right(unit);
    } catch (e) {
      return left('$e');
    }
  }

  Future<Either<String, Unit>> removeProduct(Product product) async {
    try {
      await _cartProductStorageProvider.removeProduct(id: product.id);
      return right(unit);
    } catch (e) {
      return left('$e');
    }
  }
}
