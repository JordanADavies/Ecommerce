import 'package:ecommerce/screens/cart/application/cart_cubit.dart';
import 'package:ecommerce/screens/cart/presentation/cart_button.dart';
import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_button_test.mocks.dart';

@GenerateMocks([CartCubit, Product])
void main() {
  group('Cart Button - State', () {
    testWidgets('show cart icon when state is initial', (tester) async {
      final mockCartCubit = MockCartCubit();
      final testableWidget = BlocProvider<CartCubit>(
        create: (_) => mockCartCubit,
        child: const MaterialApp(home: CartButton()),
      );

      when(mockCartCubit.state).thenReturn(CartStateInitial());
      when(mockCartCubit.stream)
          .thenAnswer((_) => Stream.value(CartStateInitial()));

      await tester.pumpWidget(testableWidget);

      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    });

    testWidgets('show exclamation mark when state is failed', (tester) async {
      final mockCartCubit = MockCartCubit();
      final testableWidget = BlocProvider<CartCubit>(
        create: (_) => mockCartCubit,
        child: const MaterialApp(home: CartButton()),
      );

      when(mockCartCubit.state).thenReturn(CartStateFailed());
      when(mockCartCubit.stream)
          .thenAnswer((_) => Stream.value(CartStateFailed()));

      await tester.pumpWidget(testableWidget);

      expect(find.text('!'), findsOneWidget);
    });

    testWidgets('show 1 when state is loaded with 1 item', (tester) async {
      final mockCartCubit = MockCartCubit();
      final testableWidget = BlocProvider<CartCubit>(
        create: (_) => mockCartCubit,
        child: const MaterialApp(home: CartButton()),
      );

      final mockProductList = [MockProduct()];
      when(mockCartCubit.state).thenReturn(CartStateLoaded(mockProductList));
      when(mockCartCubit.stream)
          .thenAnswer((_) => Stream.value(CartStateLoaded(mockProductList)));

      await tester.pumpWidget(testableWidget);

      expect(find.text('1'), findsOneWidget);
    });
  });
}
