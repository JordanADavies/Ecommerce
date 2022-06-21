// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WrappedRoute(child: const LoginPage()));
    },
    CartWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CartWrapperPage());
    },
    CategoriesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WrappedRoute(child: const CategoriesPage()));
    },
    ProductsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProductsPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LoginRoute.name, path: '/'),
        RouteConfig(CartWrapperRoute.name,
            path: '/cart-wrapper-page',
            children: [
              RouteConfig(CategoriesRoute.name,
                  path: 'categories-page', parent: CartWrapperRoute.name),
              RouteConfig(ProductsRoute.name,
                  path: 'products-page', parent: CartWrapperRoute.name)
            ])
      ];
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [CartWrapperPage]
class CartWrapperRoute extends PageRouteInfo<void> {
  const CartWrapperRoute({List<PageRouteInfo>? children})
      : super(CartWrapperRoute.name,
            path: '/cart-wrapper-page', initialChildren: children);

  static const String name = 'CartWrapperRoute';
}

/// generated route for
/// [CategoriesPage]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute()
      : super(CategoriesRoute.name, path: 'categories-page');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [ProductsPage]
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute() : super(ProductsRoute.name, path: 'products-page');

  static const String name = 'ProductsRoute';
}
