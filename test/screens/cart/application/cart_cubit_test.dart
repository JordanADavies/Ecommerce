import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/cart/application/cart_cubit.dart';
import 'package:ecommerce/screens/cart/infrastructure/cart_facade.dart';
import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_cubit_test.mocks.dart';

@GenerateMocks([CartFacade, Product])
void main() {
  group('Cart Cubit - Fetch', () {
    blocTest<CartCubit, CartState>(
      'emits loaded state when cart facade returns success',
      build: () {
        final mockCartFacade = MockCartFacade();
        when(mockCartFacade.fetchProducts())
            .thenAnswer((_) async => const Right([]));
        return CartCubit(cartFacade: mockCartFacade);
      },
      act: (cubit) async => await cubit.fetchProducts(),
      expect: () => [isA<CartStateLoaded>()],
    );

    blocTest<CartCubit, CartState>(
      'emits failed state when cart facade returns failure',
      build: () {
        final mockCartFacade = MockCartFacade();
        when(mockCartFacade.fetchProducts())
            .thenAnswer((_) async => const Left('Error'));
        return CartCubit(cartFacade: mockCartFacade);
      },
      act: (cubit) async => await cubit.fetchProducts(),
      expect: () => [isA<CartStateFailed>()],
    );
  });

  group('Cart Cubit - Add to Cart', () {
    blocTest<CartCubit, CartState>(
      'emits loaded state when cart facade returns success',
      build: () {
        final mockCartFacade = MockCartFacade();
        when(mockCartFacade.addProduct(any))
            .thenAnswer((_) async => const Right(unit));
        when(mockCartFacade.fetchProducts())
            .thenAnswer((_) async => const Right([]));
        return CartCubit(cartFacade: mockCartFacade);
      },
      act: (cubit) async {
        final mockProduct = MockProduct();
        await cubit.addProductToCart(product: mockProduct);
      },
      expect: () => [isA<CartStateLoaded>()],
    );

    blocTest<CartCubit, CartState>(
      'emits failed state when cart facade returns failure',
      build: () {
        final mockCartFacade = MockCartFacade();
        when(mockCartFacade.addProduct(any))
            .thenAnswer((_) async => const Left('Error'));
        when(mockCartFacade.fetchProducts())
            .thenAnswer((_) async => const Right([]));
        return CartCubit(cartFacade: mockCartFacade);
      },
      act: (cubit) async {
        final mockProduct = MockProduct();
        await cubit.addProductToCart(product: mockProduct);
      },
      expect: () => [isA<CartStateFailed>()],
    );
  });

  group('Cart Cubit - Remove from Cart', () {
    blocTest<CartCubit, CartState>(
      'emits loaded state when cart facade returns success',
      build: () {
        final mockCartFacade = MockCartFacade();
        when(mockCartFacade.removeProduct(any))
            .thenAnswer((_) async => const Right(unit));
        when(mockCartFacade.fetchProducts())
            .thenAnswer((_) async => const Right([]));
        return CartCubit(cartFacade: mockCartFacade);
      },
      act: (cubit) async {
        final mockProduct = MockProduct();
        await cubit.removeProductFromCart(product: mockProduct);
      },
      expect: () => [isA<CartStateLoaded>()],
    );

    blocTest<CartCubit, CartState>(
      'emits failed state when cart facade returns failure',
      build: () {
        final mockCartFacade = MockCartFacade();
        when(mockCartFacade.removeProduct(any))
            .thenAnswer((_) async => const Left('Error'));
        when(mockCartFacade.fetchProducts())
            .thenAnswer((_) async => const Right([]));
        return CartCubit(cartFacade: mockCartFacade);
      },
      act: (cubit) async {
        final mockProduct = MockProduct();
        await cubit.removeProductFromCart(product: mockProduct);
      },
      expect: () => [isA<CartStateFailed>()],
    );
  });
}
