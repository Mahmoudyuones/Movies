import 'package:movies/features/watch_list/data/models/watclist_model.dart';

abstract class WatchListState {}

class WatchListIntiState extends WatchListState {}

class WatchListStateLoading extends WatchListState {}

class WatchListSuccessState extends WatchListState {
  final List<WatchListModel> watchList;

  WatchListSuccessState(this.watchList);
}

class WatchListErrorState extends WatchListState {
  final String error;

  WatchListErrorState(this.error);
}
