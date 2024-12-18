import 'package:movies/shared/models/movie_model.dart';

abstract class UpcomimgDataSource {
  Future<List<Movie>> getMovies();
}
