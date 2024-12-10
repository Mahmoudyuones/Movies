import 'dart:convert';

import 'package:movies/features/browse/data/data_source/cateogories/categories_data_source.dart';
import 'package:movies/features/browse/data/models/categories/category.dart';
import 'package:http/http.dart' as http;
import 'package:movies/features/browse/data/models/categories/category_response.dart';
import 'package:movies/shared/api_constans/api_constants.dart';

class CategoriesApiDateSource extends CategoriesDataSource {
  @override
  Future<List<Categorey>> getCategories() async {
    final uri = Uri.https(
      ApiConstans.baseURL,
      ApiConstans.categoriesEndPoint,
    );
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer ${ApiConstans.header}',
      'Accept': 'application/json',
    });
    final json = jsonDecode(response.body);
    final categoriesRespons = CategoryResponse.fromJson(json);

    if (response.statusCode == 200) {
      return categoriesRespons.genres!;
    } else {
      throw Exception('Failed to get categories');
    }
  }
}
