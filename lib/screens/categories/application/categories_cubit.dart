import 'package:bloc/bloc.dart';
import 'package:ecommerce/screens/categories/infrastructure/categories_facade.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesFacade _categoriesFacade;

  CategoriesCubit({CategoriesFacade? categoriesFacade})
      : _categoriesFacade = categoriesFacade ?? CategoriesFacade(),
        super(CategoriesStateInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesStateLoading());
    final result = await _categoriesFacade.fetchCategories();
    result.fold(
      (errorMessage) => emit(CategoriesStateFailed(errorMessage)),
      (categories) => emit(CategoriesStateLoaded(categories)),
    );
  }
}
