import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/screens/cart/presentation/cart_wrapper_page.dart';
import 'package:ecommerce/screens/categories/presentation/categories_page.dart';
import 'package:ecommerce/screens/login/presentation/login_page.dart';
import 'package:ecommerce/screens/products/presentation/products_page.dart';
import 'package:flutter/widgets.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(
      page: CartWrapperPage,
      children: [
        AutoRoute(page: CategoriesPage),
        AutoRoute(page: ProductsPage),
      ],
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
