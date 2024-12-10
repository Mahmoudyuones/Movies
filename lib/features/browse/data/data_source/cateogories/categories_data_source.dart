import 'package:movies/features/browse/data/models/categories/category.dart';

abstract class CategoriesDataSource {
  Future <List<Categorey>> getCategories();
}
