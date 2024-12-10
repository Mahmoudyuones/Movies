import 'package:movies/features/browse/data/models/categories/category.dart';

class CategoryResponse {
  List<Categorey>? genres;

  CategoryResponse({this.genres});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <Categorey>[];
      json['genres'].forEach((v) {
        genres!.add(Categorey.fromJson(v));
      });
    }
  }
}
