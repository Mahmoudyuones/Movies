import 'package:movies/features/home/data/data_source/top_rated_movies/top_rated_data_source.dart';
import 'package:movies/shared/models/movie_model.dart';

class TopRatedRepository {
  final TopRatedDataSource dataSource;

  TopRatedRepository(this.dataSource);

  Future<List<Movie>> getMovies() async {
    return dataSource.getMovies();
  }
}
