import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/similar/data/models/results.dart';
import 'package:movies/features/similar/data/repository/similar_repository.dart';
import 'package:movies/features/similar/view_model/similar_states.dart';
import 'package:movies/shared/service_locator.dart';

class SimilarViewModel extends Cubit<SimilarStates> {
  late final SimilarRepository repository;
  SimilarViewModel() : super(SimilarInitailState()) {
    repository = SimilarRepository(ServiceLocator.similarDataSource);
  }

  Future<void> getMovies(int movieId) async {
    emit(SimilarLoadingState());
    try {
      final List<SimilarResults> similarList =
          await repository.getMovies(movieId);
      emit(
        SimilarSuccessState(
          similarList,
        ),
      );
    } catch (e) {
      emit(
        SimilarErrorState(
          e.toString(),
        ),
      );
    }
  }
}
