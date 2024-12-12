import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/browse/data/data_source/Category_details/category_details_api_data_source.dart';
import 'package:movies/features/browse/data/reposatory/category_details_reposatory.dart';
import 'package:movies/features/browse/view_model/category_details_view_model/category_details_state.dart';
import 'package:movies/features/home/data/models/popular_models/movie.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  final String categoryId;
  late final CategoryDetailsReposatory reposatory;
  CategoryDetailsViewModel({required this.categoryId})
      : super(CategoryDetailsIntitialState()) {
    reposatory = CategoryDetailsReposatory(
        categoryDetailsDataSource:
            CategoryDetailsApiDataSource(categoryId: categoryId));
  }
  Future<void> getmovies() async {
    emit(CategoryDetailsLoadingState());
    try {
      final List<Movie> moviesList = await reposatory.getmovies();
      emit(CategoryDetailsSuccesseState(moviesList: moviesList));
    } catch (e) {
      emit(CategoryDetailsErrorState(errorMessage: e.toString()));
    }
  }
}
