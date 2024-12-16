
import 'package:movies/features/watch_list/data/models/watch_list_model.dart';


abstract class WatchListDataSource {
  List<WatchListModel> getWhatchList();
}
