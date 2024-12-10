import 'package:movies/features/search/data/models/results.dart';

abstract class SearchStates {}
class SearchInitailState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchErrorState extends SearchStates {
  final String errMessage;

  SearchErrorState(this.errMessage);
}

class SearchSuccessState extends SearchStates {
  final List<Results> searchResults;

  SearchSuccessState(this.searchResults);
}
class SearchEmptyState extends SearchStates {}


