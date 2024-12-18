import 'package:movies/features/search/data/data_source/search_data_source.dart';
import 'package:movies/shared/models/movie_model.dart';

class SearchRepository {
  final SearchDataSource _dataSource;

  SearchRepository(this._dataSource);

  Future<List<Movie>> getMovies(String query) {
    return _dataSource.getMovies(query);
  }
}
