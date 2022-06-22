import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/products/application/products_cubit.dart';
import 'package:ecommerce/screens/products/infrastructure/products_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_cubit_test.mocks.dart';

@GenerateMocks([ProductsFacade])
void main() {
  group('Products Cubit - Fetch', () {
    blocTest<ProductsCubit, ProductsState>(
      'emits loading and loaded states when products facade returns success',
      build: () {
        final mockProductsFacade = MockProductsFacade();
        when(mockProductsFacade.fetchProducts(category: anyNamed('category')))
            .thenAnswer((_) async => const Right([]));
        return ProductsCubit(
          category: 'category',
          productsFacade: mockProductsFacade,
        );
      },
      act: (cubit) => cubit.fetchProducts(),
      expect: () => [
        isA<ProductsStateLoading>(),
        isA<ProductsStateLoaded>(),
      ],
    );

    blocTest<ProductsCubit, ProductsState>(
      'emits loading and failed states when products facade returns failure',
      build: () {
        final mockProductsFacade = MockProductsFacade();
        when(mockProductsFacade.fetchProducts(category: anyNamed('category')))
            .thenAnswer((_) async => const Left('Error'));
        return ProductsCubit(
          category: 'category',
          productsFacade: mockProductsFacade,
        );
      },
      act: (cubit) => cubit.fetchProducts(),
      expect: () => [
        isA<ProductsStateLoading>(),
        isA<ProductsStateFailed>(),
      ],
    );
  });
}
