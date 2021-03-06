// Mocks generated by Mockito 5.2.0 from annotations
// in ecommerce/test/screens/products/infrastructure/products_facade_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:ecommerce/screens/products/infrastructure/remote/products_api.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [ProductsApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductsApi extends _i1.Mock implements _i2.ProductsApi {
  MockProductsApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<Map<String, dynamic>>?> fetchProducts({String? category}) =>
      (super.noSuchMethod(
              Invocation.method(#fetchProducts, [], {#category: category}),
              returnValue: Future<List<Map<String, dynamic>>?>.value())
          as _i3.Future<List<Map<String, dynamic>>?>);
}
