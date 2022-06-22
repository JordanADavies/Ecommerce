import 'package:ecommerce/screens/cart/application/cart_cubit.dart';
import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:ecommerce/screens/products/presentation/add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_to_cart_button_test.mocks.dart';

@GenerateMocks([CartCubit, Product])
void main() {
  group('Add to Cart Button - State', () {
    testWidgets('shows add to cart when state is initial', (tester) async {
      final mockCartCubit = MockCartCubit();
      final mockProduct = MockProduct();
      final testableWidget = BlocProvider<CartCubit>(
        create: (_) => mockCartCubit,
        child: MaterialApp(home: AddToCartButton(product: mockProduct)),
      );

      when(mockCartCubit.state).thenReturn(CartStateInitial());
      when(mockCartCubit.stream)
          .thenAnswer((_) => Stream.value(CartStateInitial()));

      await tester.pumpWidget(testableWidget);

      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.byIcon(Icons.add_shopping_cart), findsOneWidget);
    });

    testWidgets('shows remove from cart when state is failed', (tester) async {
      final mockCartCubit = MockCartCubit();
      final mockProduct = MockProduct();
      final testableWidget = BlocProvider<CartCubit>(
        create: (_) => mockCartCubit,
        child: MaterialApp(home: AddToCartButton(product: mockProduct)),
      );

      when(mockCartCubit.state).thenReturn(CartStateFailed());
      when(mockCartCubit.stream)
          .thenAnswer((_) => Stream.value(CartStateFailed()));

      await tester.pumpWidget(testableWidget);

      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.byIcon(Icons.add_shopping_cart), findsOneWidget);
    });

    testWidgets(
        'shows add to cart when state is loaded but doesnt include this product',
        (tester) async {
      final mockCartCubit = MockCartCubit();
      final mockProduct = MockProduct();
      final testableWidget = BlocProvider<CartCubit>(
        create: (_) => mockCartCubit,
        child: MaterialApp(home: AddToCartButton(product: mockProduct)),
      );

      when(mockCartCubit.state).thenReturn(CartStateLoaded(const []));
      when(mockCartCubit.stream)
          .thenAnswer((_) => Stream.value(CartStateLoaded(const [])));

      await tester.pumpWidget(testableWidget);

      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.byIcon(Icons.add_shopping_cart), findsOneWidget);
    });

    testWidgets(
        'shows remove from cart when state is loaded and includes this product',
        (tester) async {
      final mockCartCubit = MockCartCubit();
      final mockProduct = MockProduct();
      final testableWidget = BlocProvider<CartCubit>(
        create: (_) => mockCartCubit,
        child: MaterialApp(home: AddToCartButton(product: mockProduct)),
      );

      when(mockCartCubit.state).thenReturn(CartStateLoaded([mockProduct]));
      when(mockCartCubit.stream)
          .thenAnswer((_) => Stream.value(CartStateLoaded([mockProduct])));

      await tester.pumpWidget(testableWidget);

      expect(find.text('Remove from Cart'), findsOneWidget);
      expect(find.byIcon(Icons.remove_shopping_cart), findsOneWidget);
    });
  });
}
