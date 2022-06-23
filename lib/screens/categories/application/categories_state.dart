part of 'categories_cubit.dart';

abstract class CategoriesState {}

class CategoriesStateInitial extends CategoriesState {}

class CategoriesStateLoading extends CategoriesState {}

class CategoriesStateLoaded extends CategoriesState {
  final List<String> categories;

  CategoriesStateLoaded(this.categories);
}

class CategoriesStateFailed extends CategoriesState {
  final String errorMessage;

  CategoriesStateFailed(this.errorMessage);
}
