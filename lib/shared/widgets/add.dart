import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/watch_list/view_model/watch_list_state.dart';
import 'package:movies/features/watch_list/view_model/watch_list_view_model.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

import '../../features/watch_list/data/models/watch_list_model.dart';

class Add extends StatelessWidget {
  final int movieId;
  final String title;
  final String releaseDate;
  final String imageUrl;

  const Add({
    super.key,
    required this.movieId,
    required this.title,
    required this.releaseDate,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListViewModel, WatchListState>(
      builder: (context, state) {
        final watchListViewModel = context.read<WatchListViewModel>();
        final isInWatchList = watchListViewModel.isInWatchList(movieId);

        return IconButton(
          onPressed: () {
            if (isInWatchList) {
              watchListViewModel.removeMovie(movieId);
            } else {
              watchListViewModel.addMovie(
                WatchListModel(
                  id: movieId,
                  title: title,
                  releaseDate: releaseDate,
                  imageUrl: imageUrl,
                ),
              );
            }
          },
          icon: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.bookmark,
                color: isInWatchList
                    ? AppColors.yellow
                    : const Color.fromARGB(214, 81, 79, 79),
                size: 50,
              ),
              Icon(
                isInWatchList ? Icons.check : Icons.add,
                color: AppColors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
