import 'package:movies/features/home/data/models/popular_models/movie.dart';

abstract class PopularDataSource {
  Future <List<Movie>> getMovies();
}
