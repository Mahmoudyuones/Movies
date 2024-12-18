import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/watch_list/data/models/watch_list_model.dart';
import 'package:movies/features/watch_list/data/reposatory/watch_list_reposatory.dart';
import 'package:movies/features/watch_list/view_model/watch_list_state.dart';
import 'package:movies/shared/service_locator.dart';

class WatchListViewModel extends Cubit<WatchListState> {
  late final WatchListRepository _repository;

  WatchListViewModel() : super(WatchListIntiState()) {
    _repository = WatchListRepository(
        localDataSource: ServiceLocator.watchListDataSource);
  }

  Future<void> getWatchList() async {
    try {
      emit(WatchListStateLoading());
      final watchList = _repository.getWatchList();
      emit(WatchListSuccessState(watchList));
    } catch (e) {
      emit(WatchListErrorState(e.toString()));
    }
  }

  Future<void> addMovie(WatchListModel movie) async {
    await _repository.addMovie(movie);
    getWatchList();
  }

  Future<void> removeMovie(int movieId) async {
    await _repository.removeMovie(movieId);
    getWatchList();
  }

  bool isInWatchList(int movieId) {
    return _repository.isInWatchList(movieId);
  }
}
