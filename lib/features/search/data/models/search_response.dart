import 'package:movies/shared/models/movie_model.dart';

class SearchResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  SearchResponse({this.page, this.results, this.totalPages, this.totalResults});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results!.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
