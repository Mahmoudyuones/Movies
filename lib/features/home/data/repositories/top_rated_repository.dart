import 'package:movies/features/home/data/data_source/top_rated_movies/top_rated_data_source.dart';
import 'package:movies/features/home/data/models/top_rated_models/top_rated_results.dart';

class TopRatedRepository {
  final TopRatedDataSource dataSource;

  TopRatedRepository(this.dataSource);

  Future<List<TopRatedResults>> getMovies() async {
    return dataSource.getMovies();
  }
}
