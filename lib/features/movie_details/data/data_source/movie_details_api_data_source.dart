import 'dart:convert';

import 'package:movies/features/movie_details/data/data_source/movie_details_data_source.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
import 'package:http/http.dart' as http;
import 'package:movies/shared/api_constans/api_constants.dart';

class MovieDetailsAPIDataSource extends MovieDetailsDataSource {
  @override
  Future<MovieDetailsResponse> getMovies(int movieId) async {
    final uri = Uri.https(
      ApiConstans.baseURL,
      ApiConstans.movieDetailsEndPoint(movieId),
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
      MovieDetailsResponse movieDetailsResponse =
          MovieDetailsResponse.fromJson(json);

      return movieDetailsResponse;
    } else {
      var errorMessage = 'Failed to get Movies';
      throw Exception(errorMessage);
    }
  }
}
