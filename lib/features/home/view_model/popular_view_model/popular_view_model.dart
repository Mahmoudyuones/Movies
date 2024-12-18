import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/shared/models/movie_model.dart';
import 'package:movies/features/home/data/repositories/popular_repository.dart';
import 'package:movies/features/home/view_model/popular_view_model/popular_states.dart';
import 'package:movies/shared/service_locator.dart';

class PopularViewModel extends Cubit<PopularStates> {
  late final PopularRepository repository;

  PopularViewModel() : super(PopularInitailState()) {
    repository = PopularRepository(ServiceLocator.popularDataSource);
  }

  Future<void> getMovies() async {
    emit(PopularLoadingState());
    try {
      final List<Movie> popularList = await repository.getMovies();
      emit(PopularSuccessState(popularList));
    } on SocketException {
      emit(
        PopularErrorState(
          'No Internet Connection. Please try again.',
        ),
      );
    } catch (e) {
      emit(
        PopularErrorState(
          'Something went wrong. Please try again later.',
        ),
      );
    }
  }
}
