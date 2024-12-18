
import 'package:movies/shared/models/movie_model.dart';

abstract class SearchStates {}

class SearchInitailState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchErrorState extends SearchStates {
  final String errMessage;

  SearchErrorState(this.errMessage);
}

class SearchSuccessState extends SearchStates {
  final List<Movie> searchResults;

  SearchSuccessState(this.searchResults);
}

class SearchEmptyState extends SearchStates {}
