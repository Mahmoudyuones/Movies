import 'package:movies/features/home/data/models/upcoming_models/results.dart';

abstract class UpcomimgDataSource {
  Future<List<Results>> getMovies();
}
