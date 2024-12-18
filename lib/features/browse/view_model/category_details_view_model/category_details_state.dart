import 'package:movies/shared/models/movie_model.dart';

abstract class CategoryDetailsState {}

class CategoryDetailsIntitialState extends CategoryDetailsState {}

class CategoryDetailsLoadingState extends CategoryDetailsState {}

class CategoryDetailsErrorState extends CategoryDetailsState {
  final String errorMessage;

  CategoryDetailsErrorState({required this.errorMessage});
}

class CategoryDetailsSuccesseState extends CategoryDetailsState {
  final List<Movie> moviesList;

  CategoryDetailsSuccesseState({required this.moviesList});
}
