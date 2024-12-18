import 'package:movies/shared/models/movie_model.dart';

abstract class TopRatedStates {}

class TopRatedInitailState extends TopRatedStates {}

class TopRatedLoadingState extends TopRatedStates {}

class TopRatedErrorState extends TopRatedStates {
  final String errMessage;

  TopRatedErrorState(this.errMessage);
}

class TopRatedSuccessState extends TopRatedStates {
  final List<Movie> topRatedList;

  TopRatedSuccessState(this.topRatedList);
}
