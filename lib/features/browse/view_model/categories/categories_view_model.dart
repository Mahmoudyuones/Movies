import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/browse/data/models/categories/category.dart';
import 'package:movies/features/browse/data/reposatory/categories_reposatory.dart';
import 'package:movies/features/browse/view_model/categories/categories_state.dart';
import 'package:movies/shared/service_locator.dart';

class CategoriesViewModel extends Cubit<CategoriesState> {
  late final CategoriesReposatory reposatory;

  CategoriesViewModel() : super(CategoriesInitalState()) {
    reposatory = CategoriesReposatory(
        categoriesDataSource: ServiceLocator.categoriesDataSource);
  }
  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    try {
      final List<Categorey> categoriesList = await reposatory.getCategories();
      emit(CategoriesSuccessState(categoriesList: categoriesList));
    } catch (e) {
      emit(CategoriesErrorState(errorMessage: e.toString()));
    }
  }
}
