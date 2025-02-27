import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/features/watch_list/data/models/watch_list_model.dart';
import 'package:movies/features/watch_list/view_model/watch_list_state.dart';
import 'package:movies/features/watch_list/view_model/watch_list_view_model.dart';

import 'package:movies/features/watch_list/view/widgets/watch_list_item.dart';
import 'package:movies/shared/screens/movie_details.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class WatchListTab extends StatefulWidget {
  const WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  late Box favoritesBox;
  final watchListViewModel = WatchListViewModel();
  @override
  void initState() {
    watchListViewModel.getWatchList();
    super.initState();
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    await Hive.initFlutter();
    favoritesBox = await Hive.openBox('favorites');
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    return BlocProvider(
      create: (context) => watchListViewModel,
      child: BlocBuilder<WatchListViewModel, WatchListState>(
        builder: (context, state) {
          if (state is WatchListStateLoading) {
            return const LoadingIndicator();
          } else if (state is WatchListErrorState) {
            return ErrorIndicator(errMessage: state.error);
          } else if (state is WatchListSuccessState) {
            final watchList = state.watchList;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    'Watchlist',
                    style: titleLarge?.copyWith(fontSize: 22),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      final watchlistmodel = watchList[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MovieDetails.routeName,
                            arguments: WatchListModel(
                              id: watchlistmodel.id,
                              title: watchlistmodel.title,
                              imageUrl: watchlistmodel.imageUrl,
                              releaseDate: watchlistmodel.releaseDate,
                            ),
                          );
                        },
                        child: WatchListItem(
                          movie: watchlistmodel,
                        ),
                      );
                    },
                    itemCount: watchList.length,
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
