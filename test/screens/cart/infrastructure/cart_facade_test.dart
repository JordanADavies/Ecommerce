import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/cart/infrastructure/cart_facade.dart';
import 'package:ecommerce/screens/cart/infrastructure/local/cart_product_storage_provider.dart';
import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_facade_test.mocks.dart';

@GenerateMocks([CartProductStorageProvider, Product])
void main() {
  group('Cart Facade - Fetch', () {
    test('returns success when cart product storage provider returns products',
        () async {
      final mockCartProductStorageProvider = MockCartProductStorageProvider();
      final cartFacade = CartFacade(
          cartProductStorageProvider: mockCartProductStorageProvider);

      when(mockCartProductStorageProvider.fetchProducts())
          .thenAnswer((_) async => []);

      final result = await cartFacade.fetchProducts();

      expect(result, isA<Right>());
    });

    test(
        'returns falure when cart product storage provider throws an exception',
        () async {
      final mockCartProductStorageProvider = MockCartProductStorageProvider();
      final cartFacade = CartFacade(
          cartProductStorageProvider: mockCartProductStorageProvider);

      when(mockCartProductStorageProvider.fetchProducts())
          .thenThrow(Exception());

      final result = await cartFacade.fetchProducts();

      expect(result, isA<Left>());
    });
  });

  group('Cart Facade - Add', () {
    test(
        'returns success when cart product storage provider saves without exception',
        () async {
      final mockCartProductStorageProvider = MockCartProductStorageProvider();
      final cartFacade = CartFacade(
          cartProductStorageProvider: mockCartProductStorageProvider);

      final mockProduct = MockProduct();
      when(mockProduct.id).thenReturn(1);
      when(mockProduct.toJson()).thenReturn({});
      final result = await cartFacade.addProduct(mockProduct);

      expect(result, isA<Right>());
    });

    test(
        'returns falure when cart product storage provider throws an exception',
        () async {
      final mockCartProductStorageProvider = MockCartProductStorageProvider();
      final cartFacade = CartFacade(
          cartProductStorageProvider: mockCartProductStorageProvider);

      when(mockCartProductStorageProvider.saveProduct(
        id: anyNamed('id'),
        product: anyNamed('product'),
      )).thenThrow(Exception());

      final mockProduct = MockProduct();
      when(mockProduct.id).thenReturn(1);
      when(mockProduct.toJson()).thenReturn({});
      final result = await cartFacade.addProduct(mockProduct);

      expect(result, isA<Left>());
    });
  });

  group('Cart Facade - Remove', () {
    test(
        'returns success when cart product storage provider removes without exception',
        () async {
      final mockCartProductStorageProvider = MockCartProductStorageProvider();
      final cartFacade = CartFacade(
          cartProductStorageProvider: mockCartProductStorageProvider);

      final mockProduct = MockProduct();
      when(mockProduct.id).thenReturn(1);
      final result = await cartFacade.removeProduct(mockProduct);

      expect(result, isA<Right>());
    });

    test(
        'returns falure when cart product storage provider throws an exception',
        () async {
      final mockCartProductStorageProvider = MockCartProductStorageProvider();
      final cartFacade = CartFacade(
          cartProductStorageProvider: mockCartProductStorageProvider);

      when(mockCartProductStorageProvider.removeProduct(id: anyNamed('id')))
          .thenThrow(Exception());

      final mockProduct = MockProduct();
      when(mockProduct.id).thenReturn(1);
      final result = await cartFacade.removeProduct(mockProduct);

      expect(result, isA<Left>());
    });
  });
}
