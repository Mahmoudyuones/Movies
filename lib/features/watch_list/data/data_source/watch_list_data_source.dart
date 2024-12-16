import 'package:movies/features/watch_list/data/models/watclist_model.dart';

abstract class WatchListDataSource {
  List<WatchListModel> getWhatchList();
}
