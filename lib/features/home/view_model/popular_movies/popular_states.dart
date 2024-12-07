import 'package:movies/features/home/data/models/popular_models/movie.dart';

abstract class PopularStates {}

class PopularInitailState extends PopularStates {}

class PopularLoadingState extends PopularStates {}

class PopularErrorState extends PopularStates {
  final String errMessage;

  PopularErrorState(this.errMessage);
}

class PopularSuccessState extends PopularStates {
  final List<Movie> popularList;

  PopularSuccessState(this.popularList);
}
