import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/categories/infrastructure/categories_facade.dart';
import 'package:ecommerce/screens/categories/infrastructure/remote/categories_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_facade_test.mocks.dart';

@GenerateMocks([CategoriesApi])
void main() {
  group('Categories Facade - Fetch', () {
    test('returns success when categories api returns categories', () async {
      final mockCategoriesApi = MockCategoriesApi();
      final categoriesFacade =
          CategoriesFacade(categoriesApi: mockCategoriesApi);

      when(mockCategoriesApi.fetchCategories())
          .thenAnswer((_) async => ['category 1', 'category 2']);

      final result = await categoriesFacade.fetchCategories();

      expect(result, isA<Right>());
    });

    test('returns failure when categories api returns no categories', () async {
      final mockCategoriesApi = MockCategoriesApi();
      final categoriesFacade =
          CategoriesFacade(categoriesApi: mockCategoriesApi);

      when(mockCategoriesApi.fetchCategories()).thenAnswer((_) async => []);

      final result = await categoriesFacade.fetchCategories();

      expect(result, isA<Left>());
    });

    test('returns failure when categories api returns null', () async {
      final mockCategoriesApi = MockCategoriesApi();
      final categoriesFacade =
          CategoriesFacade(categoriesApi: mockCategoriesApi);

      when(mockCategoriesApi.fetchCategories()).thenAnswer((_) async => null);

      final result = await categoriesFacade.fetchCategories();

      expect(result, isA<Left>());
    });

    test('returns failure when categories api throws an exception', () async {
      final mockCategoriesApi = MockCategoriesApi();
      final categoriesFacade =
          CategoriesFacade(categoriesApi: mockCategoriesApi);

      when(mockCategoriesApi.fetchCategories()).thenThrow(Exception());

      final result = await categoriesFacade.fetchCategories();

      expect(result, isA<Left>());
    });
  });
}
