import 'package:movies/features/browse/data/data_source/Category_details/category_details_data_source.dart';
import 'package:movies/features/home/data/models/popular_models/movie.dart';

class CategoryDetailsReposatory {
  final CategoryDetailsDataSource categoryDetailsDataSource;

  CategoryDetailsReposatory({required this.categoryDetailsDataSource});

  Future<List<Movie>> getmovies() async {
    return categoryDetailsDataSource.getmovies();
  }
}
