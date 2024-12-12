import 'package:movies/features/movie_details/data/models/movie_details_response.dart';

abstract class MovieDetailsStates {}

class MovieDetailsInitailState extends MovieDetailsStates {}

class MovieDetailsLoadingState extends MovieDetailsStates {}

class MovieDetailsErrorState extends MovieDetailsStates {
  final String errMessage;

  MovieDetailsErrorState(this.errMessage);
}

class MovieDetailsSuccessState extends MovieDetailsStates {
  final MovieDetailsResponse movieDetailsResults;

  MovieDetailsSuccessState(this.movieDetailsResults);
}
