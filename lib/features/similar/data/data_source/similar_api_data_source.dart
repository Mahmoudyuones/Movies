import 'dart:convert';

import 'package:movies/features/similar/data/data_source/similar_data_source.dart';
import 'package:movies/features/similar/data/models/results.dart';
import 'package:movies/features/similar/data/models/similar_response.dart';
import 'package:movies/shared/api_constans/api_constants.dart';
import 'package:http/http.dart' as http;

class SimilarApiDataSource extends SimilarDataSource {
  @override
  Future<List<SimilarResults>> getMovies(int movieId) async {
    final uri = Uri.https(
      ApiConstans.baseURL,
      ApiConstans.similarEndPoint(movieId),
      {},
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
      SimilarResponse similarResponse = SimilarResponse.fromJson(json);
      List<SimilarResults> similarResults = similarResponse.results!;
      return similarResults;
    } else {
      throw Exception('Failed to get Movies');
    }
  }
}
