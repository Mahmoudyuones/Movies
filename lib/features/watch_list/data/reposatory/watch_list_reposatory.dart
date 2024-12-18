import 'package:movies/features/watch_list/data/data_source/watchl_list_data_source.dart';
import 'package:movies/features/watch_list/data/models/watch_list_model.dart';


class WatchListRepository {
  final WatchListDataSource localDataSource;

  WatchListRepository({required this.localDataSource});

  Future<void> addMovie(WatchListModel movie) => localDataSource.addToWatchList(movie);

  Future<void> removeMovie(int movieId) => localDataSource.removeFromWatchList(movieId);

  List<WatchListModel> getWatchList() => localDataSource.getWatchList();

  bool isInWatchList(int movieId) => localDataSource.isMovieInWatchList(movieId);
}
