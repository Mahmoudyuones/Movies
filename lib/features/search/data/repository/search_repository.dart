import 'package:movies/features/search/data/data_source/search_data_source.dart';
import 'package:movies/features/search/data/models/results.dart';

class SearchRepository {
  final SearchDataSource _dataSource;

  SearchRepository(this._dataSource);

  Future<List<Results>> getMovies(String query) {
    return _dataSource.getMovies(query);
  }
}
