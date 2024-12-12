import 'package:movies/features/search/data/models/results.dart';

abstract class SearchDataSource {
  Future<List<Results>> getMovies(String query);
}
