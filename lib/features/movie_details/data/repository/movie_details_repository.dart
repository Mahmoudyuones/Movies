import 'package:movies/features/movie_details/data/data_source/movie_details_data_source.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';

class MovieDetailsRepository {
  final MovieDetailsDataSource _dataSource;

  MovieDetailsRepository(this._dataSource);

  Future<MovieDetailsResponse> getMovies(int movieId) async {
    return _dataSource.getMovies(movieId);
  }
}
