import 'package:movies/shared/models/movie_model.dart';

abstract class TopRatedDataSource {
  Future<List<Movie>> getMovies();
}
