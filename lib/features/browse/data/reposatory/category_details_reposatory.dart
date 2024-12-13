import 'package:movies/features/browse/data/data_source/Category_details/category_details_data_source.dart';
import 'package:movies/features/home/data/models/popular_models/movie.dart';

class CategoryDetailsReposatory {
  final CategoryDetailsDataSource categoryDetailsDataSource;

  CategoryDetailsReposatory(this.categoryDetailsDataSource);

  Future<List<Movie>> getmovies(String categoryId) async {
    return categoryDetailsDataSource.getmovies(categoryId);
  }
}
