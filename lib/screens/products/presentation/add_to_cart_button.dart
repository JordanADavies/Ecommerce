import 'package:ecommerce/screens/cart/application/cart_cubit.dart';
import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartStateLoaded && state.products.contains(product)) {
          return TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () => context
                .read<CartCubit>()
                .removeProductFromCart(product: product),
            icon: const Icon(Icons.remove_shopping_cart),
            label: const Text('Remove from Cart'),
          );
        }

        return TextButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () =>
              context.read<CartCubit>().addProductToCart(product: product),
          icon: const Icon(Icons.add_shopping_cart),
          label: const Text('Add to Cart'),
        );
      },
    );
  }
}
