import 'package:movies/shared/models/movie_model.dart';

abstract class SearchDataSource {
  Future<List<Movie>> getMovies(String query);
}
