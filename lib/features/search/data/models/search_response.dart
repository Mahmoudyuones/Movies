import 'package:movies/features/search/data/models/results.dart';

class SearchResponse {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  SearchResponse({this.page, this.results, this.totalPages, this.totalResults});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
