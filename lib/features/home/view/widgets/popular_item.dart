import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies/features/watch_list/data/models/watch_list_model.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/models/movie_model.dart';
import 'package:movies/shared/screens/movie_details.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class PopularItem extends StatelessWidget {
  final Movie movie;
  const PopularItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetails.routeName,
          arguments: WatchListModel(
            id: movie.id ?? 0,
            title: movie.title ?? "Unknown Title",
            imageUrl: movie.backdropPath ?? '',
            releaseDate: movie.releaseDate ?? "Unknown Date",
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: height * 0.25,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: movie.backdropPath != null
                  ? 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'
                  : '',
              height: height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported),
            ),
          ),
          const Icon(
            Icons.play_circle_filled,
            color: AppColors.white,
            size: 80,
          ),
          PositionedDirectional(
            top: height * 0.12,
            start: width * 0.02,
            child: SizedBox(
              height: height * 0.3,
              width: width * 0.3,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: movie.posterPath != null
                        ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
                        : '',
                    placeholder: (context, url) => const LoadingIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image_not_supported),
                  ),
                  PositionedDirectional(
                    end: width * 0.18,
                    bottom: height * 0.24,
                    child: Add(
                      imageUrl: movie.backdropPath ?? '',
                      movieId: movie.id ?? 0,
                      title: movie.title ?? "Unknown Title",
                      releaseDate: movie.releaseDate ?? "Unknown Date",
                    ),
                  ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            top: height * 0.255,
            start: width * 0.4,
            child: Text(
              movie.title ?? "Unknown Title",
              style: titleLarge,
            ),
          ),
          PositionedDirectional(
            top: height * 0.3,
            start: width * 0.4,
            child: Row(
              children: [
                Text(
                  movie.releaseDate != null
                      ? DateFormat('yyyy')
                          .format(DateTime.parse(movie.releaseDate!))
                      : "No date",
                  style: titleSmall?.copyWith(fontSize: 10),
                ),
                const SizedBox(width: 5),
                Text(
                  movie.adult == true ? 'R' : 'PG-13',
                  style: titleSmall?.copyWith(fontSize: 10),
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
