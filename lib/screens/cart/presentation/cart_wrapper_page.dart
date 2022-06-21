import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/screens/cart/presentation/cart_button.dart';
import 'package:flutter/material.dart';

class CartWrapperPage extends StatelessWidget {
  const CartWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
      floatingActionButton: CartButton(),
    );
  }
}
