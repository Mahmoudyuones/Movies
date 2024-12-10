import 'package:movies/features/home/data/models/popular_models/movie.dart';

class CategoryRespnse {
  int? page;
  List<Movie>? movies;
  int? totalPages;
  int? totalResults;

  CategoryRespnse({this.page, this.movies, this.totalPages, this.totalResults});

  CategoryRespnse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movies = <Movie>[];
      json['results'].forEach((v) {
        movies!.add( Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
