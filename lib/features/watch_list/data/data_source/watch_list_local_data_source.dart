import 'package:hive/hive.dart';
import 'package:movies/features/watch_list/data/data_source/watch_list_data_source.dart';
import 'package:movies/features/watch_list/data/models/watclist_model.dart';

class WatchListLocalDataSource extends WatchListDataSource {
  final Box _favoritBox;

  WatchListLocalDataSource({required Box favoritBox})
      : _favoritBox = favoritBox;

  @override
  List<WatchListModel> getWhatchList() {
    final watchList = _favoritBox.values.toList();
    return watchList.map((item) => WatchListModel.fromMap(item)).toList();
  }
}
