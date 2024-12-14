import 'package:movies/features/similar/data/models/results.dart';

abstract class SimilarStates {}

class SimilarInitailState extends SimilarStates {}

class SimilarLoadingState extends SimilarStates {}

class SimilarErrorState extends SimilarStates {
  final String errMessage;

  SimilarErrorState(this.errMessage);
}

class SimilarSuccessState extends SimilarStates {
  final List<SimilarResults> similarResults;

  SimilarSuccessState(this.similarResults);
}

class SimilarEmptyState extends SimilarStates {}
