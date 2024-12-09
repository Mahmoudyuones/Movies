import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/top_rated_models/top_rated_results.dart';
import 'package:movies/features/home/data/repositories/top_rated_repository.dart';
import 'package:movies/features/home/view_model/top_rated_view_model/top_rated_states.dart';
import 'package:movies/shared/service_locator.dart';

class TopRatedViewModel extends Cubit<TopRatedStates> {
  late final TopRatedRepository repository;

  TopRatedViewModel() : super(TopRatedInitailState()) {
    repository = TopRatedRepository(ServiceLocator.topRatedDataSource);
  }
  Future<void> getMovies() async {
    emit(TopRatedLoadingState());
    try {
      final List<TopRatedResults> topRatedList = await repository.getMovies();
      emit(
        TopRatedSuccessState(
          topRatedList,
        ),
      );
    } catch (e) {
      print(e);
      emit(
        TopRatedErrorState(
          e.toString(),
        ),
      );
    }
  }
}
