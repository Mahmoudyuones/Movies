import 'package:movies/shared/models/movie_model.dart';

class CategoryDetailsResponse {
  int? page;
  List<Movie>? movies;
  int? totalPages;
  int? totalResults;

  CategoryDetailsResponse(
      {this.page, this.movies, this.totalPages, this.totalResults});

  CategoryDetailsResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movies = <Movie>[];
      json['results'].forEach((v) {
        movies!.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
