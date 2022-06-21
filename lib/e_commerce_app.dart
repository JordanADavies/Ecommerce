import 'package:ecommerce/shared/routing/app_router.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  final _appRouter = AppRouter();

  final bool userLoggedIn;

  ECommerceApp({
    Key? key,
    required this.userLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(
        initialRoutes: [
          if (userLoggedIn)
            const CartWrapperRoute(children: [CategoriesRoute()])
          else
            const LoginRoute()
        ],
      ),
      routeInformationParser:
          _appRouter.defaultRouteParser(includePrefixMatches: true),
    );
  }
}
