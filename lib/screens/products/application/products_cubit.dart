import 'package:bloc/bloc.dart';
import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:ecommerce/screens/products/infrastructure/products_facade.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final String category;

  final ProductsFacade _productsFacade;

  ProductsCubit({
    required this.category,
    ProductsFacade? productsFacade,
  })  : _productsFacade = productsFacade ?? ProductsFacade(),
        super(ProductsStateInitial());

  Future<void> fetchProducts() async {
    emit(ProductsStateLoading());
    final result = await _productsFacade.fetchProducts(category: category);
    result.fold(
      (errorMessage) => emit(ProductsStateFailed(errorMessage)),
      (products) => emit(ProductsStateLoaded(products)),
    );
  }
}
