import 'package:movies/features/movie_details/data/models/movie_details_response.dart';

abstract class MovieDetailsDataSource {
  Future<MovieDetailsResponse> getMovies(int movieId);
}
