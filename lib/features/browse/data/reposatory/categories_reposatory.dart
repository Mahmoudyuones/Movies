import 'package:movies/features/browse/data/data_source/cateogories/categories_data_source.dart';
import 'package:movies/features/browse/data/models/categories/category.dart';

class CategoriesReposatory {
  final CategoriesDataSource categoriesDataSource;

  CategoriesReposatory({required this.categoriesDataSource});

  Future<List<Categorey>> getCategories() async {
   return categoriesDataSource.getCategories();
  }
}
