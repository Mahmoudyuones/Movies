import 'package:movies/shared/models/movie_model.dart';

abstract class CategoryDetailsDataSource {
  Future<List<Movie>> getmovies(String categoryId);
}
