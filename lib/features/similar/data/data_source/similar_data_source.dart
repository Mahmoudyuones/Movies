import 'package:movies/shared/models/movie_model.dart';

abstract class SimilarDataSource {
  Future<List<Movie>> getMovies(int movieId);
}
