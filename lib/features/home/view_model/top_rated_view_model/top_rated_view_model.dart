import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/shared/models/movie_model.dart';
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
      final List<Movie> topRatedList = await repository.getMovies();
      emit(
        TopRatedSuccessState(
          topRatedList,
        ),
      );
    } on SocketException {
      emit(
        TopRatedErrorState(
          'No Internet Connection. Please try again.',
        ),
      );
    } catch (e) {
      emit(
        TopRatedErrorState(
          e.toString(),
        ),
      );
    }
  }
}
