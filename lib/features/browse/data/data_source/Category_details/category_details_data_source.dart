import 'package:movies/features/home/data/models/popular_models/movie.dart';

abstract class CategoryDetailsDataSource {
  Future<List<Movie>> getmovies(String categoryId);
}
