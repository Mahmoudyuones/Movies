import 'dart:convert';

import 'package:movies/features/home/data/data_source/top_rated_movies/top_rated_data_source.dart';
import 'package:movies/features/home/data/models/top_rated_models/top_rated_response.dart';
import 'package:movies/features/home/data/models/top_rated_models/top_rated_results.dart';
import 'package:movies/shared/api_constans/api_constants.dart';
import 'package:http/http.dart' as http;

class TopRatedApiDataSource extends TopRatedDataSource {
  @override
  Future<List<TopRatedResults>> getMovies() async {
    final uri = Uri.https(
      ApiConstans.baseURL,
      ApiConstans.topRatedEndPoint,
    );
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer ${ApiConstans.header}',
      'Accept': 'application/json',
    });
    final json = jsonDecode(response.body);
    final topRatedResponse = TopRatedResponse.fromJson(json);

    if (response.statusCode == 200 && topRatedResponse.results != null) {
      return topRatedResponse.results!;
    } else {
      throw Exception('Failed to get Movies');
    }
  }
}
