import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/features/browse/data/reposatory/category_details_reposatory.dart';
import 'package:movies/features/browse/view_model/category_details_view_model/category_details_state.dart';
import 'package:movies/shared/models/movie_model.dart';
import 'package:movies/shared/service_locator.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  late final CategoryDetailsReposatory reposatory;
  CategoryDetailsViewModel() : super(CategoryDetailsIntitialState()) {
    reposatory =
        CategoryDetailsReposatory(ServiceLocator.categoryDetailsDataSource);
  }
  Future<void> getmovies(String categoryId) async {
    emit(CategoryDetailsLoadingState());
    try {
      final List<Movie> moviesList = await reposatory.getmovies(categoryId);
      emit(CategoryDetailsSuccesseState(moviesList: moviesList));
    } catch (e) {
      emit(CategoryDetailsErrorState(errorMessage: e.toString()));
    }
  }
}
