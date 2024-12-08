import 'package:movies/features/home/data/models/top_rated_models/top_rated_results.dart';

abstract class TopRatedDataSource {
  Future<List<TopRatedResults>> getMovies();
}
