import 'package:movies/shared/models/movie_model.dart';

abstract class UpcomingStates {}

class UpcomingInitailState extends UpcomingStates {}

class UpcomingLoadingState extends UpcomingStates {}

class UpcomingErrorState extends UpcomingStates {
  final String errMessage;

  UpcomingErrorState(this.errMessage);
}

class UpcomingSuccessState extends UpcomingStates {
  final List<Movie> upcomingList;

  UpcomingSuccessState(this.upcomingList);
}
