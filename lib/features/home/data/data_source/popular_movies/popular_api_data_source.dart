import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/features/home/data/data_source/popular_movies/popular_data_source.dart';
import 'package:movies/features/home/data/models/popular_models/movie.dart';
import 'package:movies/features/home/data/models/popular_models/movie_response.dart';
import 'package:movies/shared/api_constans/api_constants.dart';

class PopularApiDataSource extends PopularDataSource {
  @override
  Future<List<Movie>> getMovies() async {
    final uri = Uri.http(
      ApiConstans.baseURL,
      ApiConstans.popularEndPoint,
      {
        'Authorization': ApiConstans.header,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final movieResponse = MoviesResponse.fromJson(json);

    if (response.statusCode == 200 && movieResponse.results != null) {
      return movieResponse.results!;
    } else {
      throw Exception('Failed to get Movies');
    }
  }
}
