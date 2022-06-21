import 'package:ecommerce/screens/categories/application/categories_cubit.dart';
import 'package:ecommerce/screens/categories/presentation/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_page_test.mocks.dart';

@GenerateMocks([CategoriesCubit])
void main() {
  group('Categories Page - State', () {
    testWidgets('shows progress indicator when state is initial',
        (tester) async {
      final mockCategoriesCubit = MockCategoriesCubit();
      final testableWidget = BlocProvider<CategoriesCubit>(
        create: (_) => mockCategoriesCubit,
        child: const MaterialApp(
          home: CategoriesPage(),
        ),
      );

      when(mockCategoriesCubit.state).thenReturn(CategoriesStateInitial());
      when(mockCategoriesCubit.stream)
          .thenAnswer((_) => Stream.value(CategoriesStateInitial()));

      await tester.pumpWidget(testableWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows progress indicator when state is loading',
        (tester) async {
      final mockCategoriesCubit = MockCategoriesCubit();
      final testableWidget = BlocProvider<CategoriesCubit>(
        create: (_) => mockCategoriesCubit,
        child: const MaterialApp(
          home: CategoriesPage(),
        ),
      );

      when(mockCategoriesCubit.state).thenReturn(CategoriesStateLoading());
      when(mockCategoriesCubit.stream)
          .thenAnswer((_) => Stream.value(CategoriesStateLoading()));

      await tester.pumpWidget(testableWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when state is failed', (tester) async {
      final mockCategoriesCubit = MockCategoriesCubit();
      final testableWidget = BlocProvider<CategoriesCubit>(
        create: (_) => mockCategoriesCubit,
        child: const MaterialApp(
          home: CategoriesPage(),
        ),
      );

      when(mockCategoriesCubit.state)
          .thenReturn(CategoriesStateFailed('Error'));
      when(mockCategoriesCubit.stream)
          .thenAnswer((_) => Stream.value(CategoriesStateFailed('Error')));

      await tester.pumpWidget(testableWidget);

      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('shows number of list tiles when state is success',
        (tester) async {
      final mockCategoriesCubit = MockCategoriesCubit();
      final testableWidget = BlocProvider<CategoriesCubit>(
        create: (_) => mockCategoriesCubit,
        child: const MaterialApp(
          home: CategoriesPage(),
        ),
      );

      when(mockCategoriesCubit.state)
          .thenReturn(CategoriesStateLoaded(const ['1', '2']));
      when(mockCategoriesCubit.stream).thenAnswer(
          (_) => Stream.value(CategoriesStateLoaded(const ['1', '2'])));

      await tester.pumpWidget(testableWidget);

      expect(find.byType(ListTile), findsNWidgets(2));
    });
  });
}
