import 'package:movies/features/home/data/data_source/upcoming_movies/upcomimg_data_source.dart';
import 'package:movies/features/home/data/models/upcoming_models/results.dart';

class UpcomingRepository {
  final UpcomimgDataSource dataSource;

  UpcomingRepository(this.dataSource);

  Future<List<Results>> getMovies() async {
    return dataSource.getMovies();
  }
}
