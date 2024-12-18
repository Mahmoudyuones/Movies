import 'package:movies/features/home/data/data_source/upcoming_movies/upcomimg_data_source.dart';
import 'package:movies/shared/models/movie_model.dart';

class UpcomingRepository {
  final UpcomimgDataSource dataSource;

  UpcomingRepository(this.dataSource);

  Future<List<Movie>> getMovies() async {
    return dataSource.getMovies();
  }
}
