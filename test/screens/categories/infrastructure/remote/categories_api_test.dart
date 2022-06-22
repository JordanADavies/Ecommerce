import 'package:ecommerce/screens/categories/infrastructure/remote/categories_api.dart';
import 'package:ecommerce/shared/http_client/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_api_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  group('Categories Api - Fetch', () {
    test('returns categories when http client returns valid response',
        () async {
      final mockHttpClient = MockHttpClient();
      final categoriesApi = CategoriesApi(client: mockHttpClient);

      when(mockHttpClient.get(path: anyNamed('path')))
          .thenAnswer((_) async => ['category 1', 'category 2']);

      final result = await categoriesApi.fetchCategories();

      expect(result, ['category 1', 'category 2']);
    });

    test('returns null when http client returns null', () async {
      final mockHttpClient = MockHttpClient();
      final categoriesApi = CategoriesApi(client: mockHttpClient);

      when(mockHttpClient.get(path: anyNamed('path')))
          .thenAnswer((_) async => null);

      final result = await categoriesApi.fetchCategories();

      expect(result, null);
    });
  });
}
