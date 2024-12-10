import 'package:movies/features/home/data/models/popular_models/movie.dart';

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
