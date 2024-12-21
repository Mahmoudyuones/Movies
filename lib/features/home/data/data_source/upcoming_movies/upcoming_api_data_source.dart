import 'dart:convert';

import 'package:movies/features/home/data/data_source/upcoming_movies/upcomimg_data_source.dart';
import 'package:movies/features/home/data/models/upcoming_models/upcoming_response.dart';
import 'package:movies/shared/api_constans/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:movies/shared/models/movie_model.dart';

class UpcomingApiDataSource extends UpcomimgDataSource {
  @override
  Future<List<Movie>> getMovies() async {
    final uri = Uri.https(
      ApiConstans.baseURL,
      ApiConstans.upcomingEndPoint,
    );
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer ${ApiConstans.header}',
      'Accept': 'application/json',
    });
    final json = jsonDecode(response.body);
    final upcomingResponse = UpcomingResponse.fromJson(json);

    if (response.statusCode == 200) {
      return upcomingResponse.results;
    } else {
      throw Exception('Failed to get Movies');
    }
  }
}
