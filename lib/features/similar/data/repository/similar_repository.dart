import 'package:movies/features/similar/data/data_source/similar_data_source.dart';
import 'package:movies/shared/models/movie_model.dart';

class SimilarRepository {
  final SimilarDataSource dataSource;

  SimilarRepository(this.dataSource);

  Future<List<Movie>> getMovies(int movieId) async {
    return dataSource.getMovies(movieId);
  }
}
