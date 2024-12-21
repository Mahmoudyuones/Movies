import 'package:movies/shared/models/movie_model.dart';

class UpcomingResponse {
  final Map<String, String> dates;
  final int page;
  final List<Movie> results;

  UpcomingResponse({
    required this.dates,
    required this.page,
    required this.results,
  });

  factory UpcomingResponse.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List;
    List<Movie> resultObjects =
        resultsList.map((e) => Movie.fromJson(e)).toList();

    return UpcomingResponse(
      dates: Map<String, String>.from(json['dates']),
      page: json['page'],
      results: resultObjects,
    );
  }
}
