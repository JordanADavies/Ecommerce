import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/products/infrastructure/products_facade.dart';
import 'package:ecommerce/screens/products/infrastructure/remote/products_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_facade_test.mocks.dart';

@GenerateMocks([ProductsApi])
void main() {
  group('Products Facade - Fetch', () {
    test('returns success when products api returns products', () async {
      final mockProductsApi = MockProductsApi();
      final productsFacade = ProductsFacade(productsApi: mockProductsApi);

      when(mockProductsApi.fetchProducts(category: anyNamed('category')))
          .thenAnswer((_) async => [
                {
                  'id': 1,
                  'title': 'title',
                  'description': 'description',
                  'price': 1.0,
                  'image': 'image',
                }
              ]);

      final result = await productsFacade.fetchProducts(category: 'category');

      expect(result, isA<Right>());
    });

    test('returns failure when products api returns no products', () async {
      final mockProductsApi = MockProductsApi();
      final productsFacade = ProductsFacade(productsApi: mockProductsApi);

      when(mockProductsApi.fetchProducts(category: anyNamed('category')))
          .thenAnswer((_) async => []);

      final result = await productsFacade.fetchProducts(category: 'category');

      expect(result, isA<Left>());
    });

    test('returns failure when products api returns null', () async {
      final mockProductsApi = MockProductsApi();
      final productsFacade = ProductsFacade(productsApi: mockProductsApi);

      when(mockProductsApi.fetchProducts(category: anyNamed('category')))
          .thenAnswer((_) async => null);

      final result = await productsFacade.fetchProducts(category: 'category');

      expect(result, isA<Left>());
    });

    test('returns failure when products api throws an exception', () async {
      final mockProductsApi = MockProductsApi();
      final productsFacade = ProductsFacade(productsApi: mockProductsApi);

      when(mockProductsApi.fetchProducts(category: anyNamed('category')))
          .thenThrow(Exception());

      final result = await productsFacade.fetchProducts(category: 'category');

      expect(result, isA<Left>());
    });
  });
}
