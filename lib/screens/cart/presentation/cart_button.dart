import 'package:ecommerce/screens/cart/application/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (_, state) {
        return Stack(
          children: [
            const FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.shopping_cart),
            ),
            if (state is CartStateFailed) const _CartBadge(title: '!'),
            if (state is CartStateLoaded)
              _CartBadge(title: '${state.products.length}'),
          ],
        );
      },
    );
  }
}

class _CartBadge extends StatelessWidget {
  final String title;

  const _CartBadge({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
