import 'package:movies/features/browse/data/models/categories/category.dart';

abstract class CategoriesState {}

class CategoriesInitalState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesErrorState extends CategoriesState {
  final String errorMessage;

  CategoriesErrorState({required this.errorMessage});
}

class CategoriesSuccessState extends CategoriesState {
  final List<Categorey> categoriesList;

  CategoriesSuccessState({required this.categoriesList});
}
