import 'package:movies/features/home/data/models/upcoming_models/results.dart';

abstract class UpcomingStates {}

class UpcomingInitailState extends UpcomingStates {}

class UpcomingLoadingState extends UpcomingStates {}

class UpcomingErrorState extends UpcomingStates {
  final String errMessage;

  UpcomingErrorState(this.errMessage);
}

class UpcomingSuccessState extends UpcomingStates {
  final List<Results> upcomingList;

  UpcomingSuccessState(this.upcomingList);
}
