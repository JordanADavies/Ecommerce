import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/categories/infrastructure/remote/categories_api.dart';

class CategoriesFacade {
  final CategoriesApi _categoriesApi;

  CategoriesFacade({CategoriesApi? categoriesApi})
      : _categoriesApi = categoriesApi ?? CategoriesApi();

  Future<Either<String, List<String>>> fetchCategories() async {
    try {
      final categories = await _categoriesApi.fetchCategories();
      if (categories == null) return left('No categories');
      return right(categories);
    } catch (e) {
      return left('$e');
    }
  }
}
