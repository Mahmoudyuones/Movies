
import 'package:movies/features/similar/data/models/results.dart';

class SimilarResponse {
  int? page;
  List<SimilarResults>? results;
  int? totalPages;
  int? totalResults;

  SimilarResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  SimilarResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <SimilarResults>[];
      json['results'].forEach((v) {
        results!.add(SimilarResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
