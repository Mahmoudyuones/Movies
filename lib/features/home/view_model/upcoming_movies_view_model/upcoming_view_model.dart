import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/upcoming_models/results.dart';
import 'package:movies/features/home/data/repositories/upcoming_repository.dart';
import 'package:movies/features/home/view_model/upcoming_movies_view_model/upcoming_states.dart';
import 'package:movies/shared/service_locator.dart';

class UpcomingViewModel extends Cubit<UpcomingStates> {
  late final UpcomingRepository repository;

  UpcomingViewModel() : super(UpcomingInitailState()) {
    repository = UpcomingRepository(ServiceLocator.upcomimgDataSource);
  }
  Future<void> getMovies() async {
    emit(UpcomingLoadingState());
    try {
      final List<Results> upcomingList = await repository.getMovies();
      emit(
        UpcomingSuccessState(
          upcomingList,
        ),
      );
    } catch (e) {
      emit(
        UpcomingErrorState(
          e.toString(),
        ),
      );
    }
  }
}
