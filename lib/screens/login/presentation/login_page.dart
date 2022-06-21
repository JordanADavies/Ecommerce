import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/screens/login/application/login_cubit.dart';
import 'package:ecommerce/screens/login/presentation/login_form.dart';
import 'package:ecommerce/shared/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.router.root.replaceAll([
            const CartWrapperRoute(children: [CategoriesRoute()])
          ]);
        }
      },
      child: const Scaffold(
        body: SafeArea(
          child: LoginForm(),
        ),
      ),
    );
  }
}
