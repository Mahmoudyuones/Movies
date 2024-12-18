import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/shared/models/movie_model.dart';
import 'package:movies/features/home/data/repositories/upcoming_repository.dart';
import 'package:movies/features/home/view_model/upcoming_movies_view_model/upcoming_states.dart';
import 'package:movies/shared/service_locator.dart';

class UpcomingViewModel extends Cubit<UpcomingStates> {
  late final UpcomingRepository repository;

  UpcomingViewModel() : super(UpcomingInitailState()) {
    repository = UpcomingRepository(ServiceLocator.upcomimgDataSource);
  }
  Future<void> getMovies() async {
    emit(UpcomingLoadingState());
    try {
      final List<Movie> upcomingList = await repository.getMovies();
      emit(
        UpcomingSuccessState(
          upcomingList,
        ),
      );
    } on SocketException {
      emit(
        UpcomingErrorState(
          'No Internet Connection. Please try again.',
        ),
      );
    } 
    catch (e) {
      emit(
        UpcomingErrorState(
          e.toString(),
        ),
      );
    }
  }
}
