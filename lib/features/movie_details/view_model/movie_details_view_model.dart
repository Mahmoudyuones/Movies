import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
import 'package:movies/features/movie_details/data/repository/movie_details_repository.dart';
import 'package:movies/features/movie_details/view_model/movie_details_state.dart';
import 'package:movies/shared/service_locator.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  late final MovieDetailsRepository _repository;
  MovieDetailsViewModel() : super(MovieDetailsInitailState()) {
    _repository = MovieDetailsRepository(ServiceLocator.movieDetailsDataSource);
  }
  Future<void> getMovies(int movieId) async {
    emit(MovieDetailsLoadingState());
    try {
      final MovieDetailsResponse movieDetailsResults =
          await _repository.getMovies(movieId);
      emit(MovieDetailsSuccessState(movieDetailsResults));
    } catch (errorMessage) {
      emit(MovieDetailsErrorState(errorMessage.toString()));
    }
  }
}
