import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/screens/categories/application/categories_cubit.dart';
import 'package:ecommerce/shared/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPage extends StatelessWidget with AutoRouteWrapper {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesCubit()..fetchCategories(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (_, state) {
          if (state is CategoriesStateLoaded) {
            return ListView(
              children: state.categories
                  .map(
                    (e) => ListTile(
                      title: Text(e.toUpperCase()),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () =>
                          context.router.navigate(ProductsRoute(category: e)),
                    ),
                  )
                  .toList(),
            );
          }

          if (state is CategoriesStateFailed) {
            return Center(child: Text(state.errorMessage));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
