import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/watch_list/data/reposatory/watch_list_reposatory.dart';
import 'package:movies/features/watch_list/view_model/watch_list_state.dart';
import 'package:movies/shared/service_locator.dart';

class WatchListViewModel extends Cubit<WatchListState> {
  late final WatchListReposatory _reposatory;

  WatchListViewModel() : super(WatchListIntiState()) {
    _reposatory = WatchListReposatory(
        watchListLocalDataSource: ServiceLocator.watchListLocalDataSource);
  }

  Future<void> getWatchList() async {
    emit(WatchListStateLoading());
    try {
      final watchList = _reposatory.getWatchList();
      emit(WatchListSuccessState(watchList));
    } catch (e) {
      emit(WatchListErrorState(e.toString()));
    }
  }
}
