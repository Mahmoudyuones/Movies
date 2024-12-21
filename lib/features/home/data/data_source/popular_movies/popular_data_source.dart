import 'package:movies/shared/models/movie_model.dart';

abstract class PopularDataSource {
  Future<List<Movie>> getMovies();
}
