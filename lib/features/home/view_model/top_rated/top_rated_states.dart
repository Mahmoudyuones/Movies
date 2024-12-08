import 'package:movies/features/home/data/models/top_rated_models/top_rated_results.dart';

abstract class TopRatedStates {}

class TopRatedInitailState extends TopRatedStates {}

class TopRatedLoadingState extends TopRatedStates {}

class TopRatedErrorState extends TopRatedStates {
  final String errMessage;

  TopRatedErrorState(this.errMessage);
}

class TopRatedSuccessState extends TopRatedStates {
  final List<TopRatedResults> topRatedList;

  TopRatedSuccessState(this.topRatedList);
}
