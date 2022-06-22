import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/screens/cart/application/cart_cubit.dart';
import 'package:ecommerce/screens/cart/presentation/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartWrapperPage extends StatelessWidget with AutoRouteWrapper {
  const CartWrapperPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit()..fetchProducts(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
      floatingActionButton: CartButton(),
    );
  }
}
