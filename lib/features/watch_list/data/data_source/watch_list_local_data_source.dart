import 'package:hive/hive.dart';
import 'package:movies/features/watch_list/data/data_source/watchl_list_data_source.dart';
import 'package:movies/features/watch_list/data/models/watch_list_model.dart';

class WatchListLocalDataSource  extends WatchListDataSource{
  final Box _favoritesBox;

  WatchListLocalDataSource(this._favoritesBox);

  @override
  Future<void> addToWatchList(WatchListModel movie) async {
    await _favoritesBox.put(movie.id, movie.toMap());
  }

  @override
  Future<void> removeFromWatchList(int movieId) async {
    await _favoritesBox.delete(movieId);
  }

  @override
  List<WatchListModel> getWatchList() {
    return _favoritesBox.values
        .map((item) => WatchListModel.fromMap(item))
        .toList();
  }

  @override
  bool isMovieInWatchList(int movieId) {
    return _favoritesBox.containsKey(movieId);
  }
  

}
