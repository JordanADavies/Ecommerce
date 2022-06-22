import 'package:ecommerce/screens/products/application/products_cubit.dart';
import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:ecommerce/screens/products/presentation/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_page_test.mocks.dart';

@GenerateMocks([ProductsCubit, Product])
void main() {
  group('Products Page - State', () {
    testWidgets('shows progress indicator when state is initial',
        (tester) async {
      final mockProductsCubit = MockProductsCubit();
      final testableWidget = BlocProvider<ProductsCubit>(
        create: (_) => mockProductsCubit,
        child: const MaterialApp(home: ProductsPage(category: 'category')),
      );

      when(mockProductsCubit.state).thenReturn(ProductsStateInitial());
      when(mockProductsCubit.stream)
          .thenAnswer((_) => Stream.value(ProductsStateInitial()));

      await tester.pumpWidget(testableWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows progress indicator when state is loading',
        (tester) async {
      final mockProductsCubit = MockProductsCubit();
      final testableWidget = BlocProvider<ProductsCubit>(
        create: (_) => mockProductsCubit,
        child: const MaterialApp(home: ProductsPage(category: 'category')),
      );

      when(mockProductsCubit.state).thenReturn(ProductsStateLoading());
      when(mockProductsCubit.stream)
          .thenAnswer((_) => Stream.value(ProductsStateLoading()));

      await tester.pumpWidget(testableWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when state is failed', (tester) async {
      final mockProductsCubit = MockProductsCubit();
      final testableWidget = BlocProvider<ProductsCubit>(
        create: (_) => mockProductsCubit,
        child: const MaterialApp(home: ProductsPage(category: 'category')),
      );

      when(mockProductsCubit.state).thenReturn(ProductsStateFailed('Error'));
      when(mockProductsCubit.stream)
          .thenAnswer((_) => Stream.value(ProductsStateFailed('Error')));

      await tester.pumpWidget(testableWidget);

      expect(find.text('Error'), findsOneWidget);
    });
  });
}
