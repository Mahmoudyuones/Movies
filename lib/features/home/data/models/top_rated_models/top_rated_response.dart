import 'package:movies/features/home/data/models/top_rated_models/top_rated_results.dart';

class TopRatedResponse {
  int? page;
  List<TopRatedResults>? results;
  int? totalPages;
  int? totalResults;

  TopRatedResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  TopRatedResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TopRatedResults>[];
      json['results'].forEach((v) {
        results!.add(TopRatedResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
