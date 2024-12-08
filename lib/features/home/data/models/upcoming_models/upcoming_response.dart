import 'package:movies/features/home/data/models/upcoming_models/results.dart';

class UpcomingResponse {
  final Map<String, String> dates;
  final int page;
  final List<Results> results;

  UpcomingResponse({
    required this.dates,
    required this.page,
    required this.results,
  });

  factory UpcomingResponse.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List;
    List<Results> resultObjects = resultsList.map((e) => Results.fromJson(e)).toList();

    return UpcomingResponse(
      dates: Map<String, String>.from(json['dates']),
      page: json['page'],
      results: resultObjects,
    );
  }
}
