import 'package:ecommerce/screens/products/infrastructure/remote/products_api.dart';
import 'package:ecommerce/shared/http_client/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_api_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  group('Products Api - Fetch', () {
    test('returns products when http client returns valid response', () async {
      final mockHttpClient = MockHttpClient();
      final productsApi = ProductsApi(client: mockHttpClient);

      when(mockHttpClient.get(path: anyNamed('path'))).thenAnswer((_) async => [
            {
              'id': 1,
              'title': 'title',
              'description': 'description',
              'price': 1.0,
              'image': 'image',
            },
            {
              'id': 2,
              'title': 'title',
              'description': 'description',
              'price': 2.0,
              'image': 'image',
            }
          ]);

      final result = await productsApi.fetchProducts(category: 'category');

      expect(result, [
        {
          'id': 1,
          'title': 'title',
          'description': 'description',
          'price': 1.0,
          'image': 'image',
        },
        {
          'id': 2,
          'title': 'title',
          'description': 'description',
          'price': 2.0,
          'image': 'image',
        }
      ]);
    });

    test('returns null when http client returns null', () async {
      final mockHttpClient = MockHttpClient();
      final productsApi = ProductsApi(client: mockHttpClient);

      when(mockHttpClient.get(path: anyNamed('path')))
          .thenAnswer((_) async => null);

      final result = await productsApi.fetchProducts(category: 'category');

      expect(result, null);
    });
  });
}
