import 'package:movies/features/home/data/data_source/popular_movies/popular_data_source.dart';

import 'package:movies/shared/models/movie_model.dart';

class PopularRepository {
  final PopularDataSource dataSource;

  PopularRepository(this.dataSource);

  Future<List<Movie>> getMovies() async {
    return dataSource.getMovies();
  }
}
