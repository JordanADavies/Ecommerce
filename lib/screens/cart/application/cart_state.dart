part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartStateInitial extends CartState {}

class CartStateLoaded extends CartState {
  final List<Product> products;

  CartStateLoaded(this.products);
}

class CartStateFailed extends CartState {}
