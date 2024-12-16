import 'package:movies/features/watch_list/data/data_source/watch_list_local_data_source.dart';
import 'package:movies/features/watch_list/data/models/watclist_model.dart';

class WatchListReposatory {
  final WatchListLocalDataSource watchListLocalDataSource;

  WatchListReposatory({required this.watchListLocalDataSource});

  List<WatchListModel> getWatchList() {
    return watchListLocalDataSource.getWhatchList();  
  }
}
