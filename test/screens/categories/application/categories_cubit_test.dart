import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/categories/application/categories_cubit.dart';
import 'package:ecommerce/screens/categories/infrastructure/categories_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_cubit_test.mocks.dart';

@GenerateMocks([CategoriesFacade])
void main() {
  group('Categories Cubit - Fetch', () {
    blocTest<CategoriesCubit, CategoriesState>(
      'emits loading and loaded state when categories facade returns success',
      build: () {
        final mockCategoriesFacade = MockCategoriesFacade();
        when(mockCategoriesFacade.fetchCategories())
            .thenAnswer((_) async => const Right([]));
        return CategoriesCubit(categoriesFacade: mockCategoriesFacade);
      },
      act: (cubit) => cubit.fetchCategories(),
      expect: () => [
        isA<CategoriesStateLoading>(),
        isA<CategoriesStateLoaded>(),
      ],
    );

    blocTest<CategoriesCubit, CategoriesState>(
      'emits loading and failed state when categories facade returns failure',
      build: () {
        final mockCategoriesFacade = MockCategoriesFacade();
        when(mockCategoriesFacade.fetchCategories())
            .thenAnswer((_) async => const Left('Error'));
        return CategoriesCubit(categoriesFacade: mockCategoriesFacade);
      },
      act: (cubit) => cubit.fetchCategories(),
      expect: () => [
        isA<CategoriesStateLoading>(),
        isA<CategoriesStateFailed>(),
      ],
    );
  });
}
