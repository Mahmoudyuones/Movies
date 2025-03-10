import "package:movies/shared/models/movie_model.dart";

class MoviesResponse {
  final int? page;
  final List<Movie>? results;

  MoviesResponse({required this.page, required this.results});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      page: json['page'],
      results: List<Movie>.from(
        json['results'].map((movie) => Movie.fromJson(movie)),
      ),
    );
  }
}
