import 'package:ecommerce/screens/cart/infrastructure/cart_facade.dart';
import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartFacade _cartFacade;

  CartCubit({CartFacade? cartFacade})
      : _cartFacade = cartFacade ?? CartFacade(),
        super(CartStateInitial());

  Future<void> fetchProducts() async {
    final result = await _cartFacade.fetchProducts();
    result.fold(
      (_) => emit(CartStateFailed()),
      (numberOfProducts) => emit(CartStateLoaded(numberOfProducts)),
    );
  }

  Future<void> addProductToCart({required Product product}) async {
    final result = await _cartFacade.addProduct(product);
    await result.fold<Future<void>>(
      (_) async => emit(CartStateFailed()),
      (_) async => await fetchProducts(),
    );
  }

  Future<void> removeProductFromCart({required Product product}) async {
    final result = await _cartFacade.removeProduct(product);
    await result.fold<Future<void>>(
      (_) async => emit(CartStateFailed()),
      (_) async => await fetchProducts(),
    );
  }
}
