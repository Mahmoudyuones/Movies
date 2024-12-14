import 'package:movies/features/similar/data/data_source/similar_data_source.dart';
import 'package:movies/features/similar/data/models/results.dart';

class SimilarRepository {
  final SimilarDataSource dataSource;

  SimilarRepository(this.dataSource);

  Future<List<SimilarResults>> getMovies(int movieId) async {
    return dataSource.getMovies(movieId);
  }
}
