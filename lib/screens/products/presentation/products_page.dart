import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/screens/products/application/products_cubit.dart';
import 'package:ecommerce/screens/products/presentation/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget with AutoRouteWrapper {
  final String category;

  const ProductsPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit(category: category)..fetchProducts(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.toUpperCase()),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (_, state) {
          if (state is ProductsStateLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (_, index) =>
                  ProductListItem(product: state.products[index]),
            );
          }

          if (state is ProductsStateFailed) {
            return Center(child: Text(state.errorMessage));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
