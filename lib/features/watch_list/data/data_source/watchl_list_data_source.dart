import 'package:movies/features/watch_list/data/models/watch_list_model.dart';

abstract class WatchListDataSource {
  Future<void> addToWatchList(WatchListModel movie);
  Future<void> removeFromWatchList(int movieId);
  List<WatchListModel> getWatchList();
  bool isMovieInWatchList(int movieId);
}
