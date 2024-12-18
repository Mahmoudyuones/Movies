import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/search/data/repository/search_repository.dart';
import 'package:movies/features/search/view_model/search_states.dart';
import 'package:movies/shared/models/movie_model.dart';
import 'package:movies/shared/service_locator.dart';

class SearchViewModel extends Cubit<SearchStates> {
  late final SearchRepository _repository;
  SearchViewModel() : super(SearchInitailState()) {
    _repository = SearchRepository(ServiceLocator.searchDataSource);
  }
  Future<void> getMovies(String query) async {
    if (query.isEmpty) {
      emit(SearchEmptyState());
      return;
    }
    emit(SearchLoadingState());
    try {
      final List<Movie> searchResults = await _repository.getMovies(query);
      emit(SearchSuccessState(searchResults));
    } catch (errorMessage) {
      emit(SearchErrorState(errorMessage.toString()));
    }
  }
}
