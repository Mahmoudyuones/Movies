
import 'package:movies/features/similar/data/models/results.dart';

abstract class SimilarDataSource {
  Future<List<SimilarResults>> getMovies(int movieId);
}
