import 'dart:convert';

import 'package:movies/features/search/data/data_source/search_data_source.dart';
import 'package:movies/features/search/data/models/results.dart';
import 'package:movies/features/search/data/models/search_response.dart';
import 'package:movies/shared/api_constans/api_constants.dart';
import 'package:http/http.dart' as http;

class SearchApiDataSource extends SearchDataSource {
  @override
  Future<List<Results>> getMovies(String query) async {
    final uri = Uri.https(
      ApiConstans.baseURL,
      ApiConstans.searchEndPoint,
      {
        'query': query,
      },
    );
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer ${ApiConstans.header}',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      SearchResponse searchResponse = SearchResponse.fromJson(json);
      List<Results> searchResults = searchResponse.results!;
      return searchResults;
    } else {
      throw Exception('Failed to get Movies');
    }
  }
}
