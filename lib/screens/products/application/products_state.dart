part of 'products_cubit.dart';

abstract class ProductsState {}

class ProductsStateInitial extends ProductsState {}

class ProductsStateLoading extends ProductsState {}

class ProductsStateLoaded extends ProductsState {
  final List<Product> products;

  ProductsStateLoaded(this.products);
}

class ProductsStateFailed extends ProductsState {
  final String errorMessage;

  ProductsStateFailed(this.errorMessage);
}
