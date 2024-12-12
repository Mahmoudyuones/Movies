import 'dart:convert';

import 'package:movies/features/browse/data/data_source/Category_details/category_details_data_source.dart';
import 'package:movies/features/browse/data/models/category_details/category_response.dart';
import 'package:movies/features/home/data/models/popular_models/movie.dart';
import 'package:movies/shared/api_constans/api_constants.dart';
import 'package:http/http.dart' as http;

class CategoryDetailsApiDataSource extends CategoryDetailsDataSource {
  final String categoryId;

  CategoryDetailsApiDataSource({required this.categoryId});
  @override
  Future<List<Movie>> getmovies() async {
    final uri = Uri.https(
      ApiConstans.baseURL,
      ApiConstans.categoriyDetailsEndPoint,
      {'with_genres': categoryId},
    );

    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer ${ApiConstans.header}',
      'Accept': 'application/json',
    });
    final json = jsonDecode(response.body);
    final categoreyrsponse = CategoryRespnse.fromJson(json);

    if (response.statusCode == 200) {
      return categoreyrsponse.movies!;
    } else {
      throw Exception('Failed to get movies');
    }
  }
}
