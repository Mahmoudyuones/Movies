import "package:movies/shared/models/movie_model.dart";

class TopRatedResponse {
  int? page;
  List<Movie>? results;
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
      results = <Movie>[];
      json['results'].forEach((v) {
        results!.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
