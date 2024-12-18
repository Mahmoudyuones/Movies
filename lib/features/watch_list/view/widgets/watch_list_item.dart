import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies/features/watch_list/data/models/watch_list_model.dart';
import 'package:movies/shared/api_constans/api_constants.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({
    super.key,
    required this.movie,
  });
  final WatchListModel movie;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      height: height * 0.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  height: height * 0.15,
                  width: width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CachedNetworkImage(
                      imageUrl: '${ApiConstans.baseImageURl}${movie.imageUrl}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: height * 0.08,
                child: Add(
                  imageUrl: movie.imageUrl,
                  movieId: movie.id,
                  releaseDate: movie.releaseDate,
                  title: movie.title,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  movie.title,
                  style: titleLarge?.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  DateFormat('yyyy').format(DateTime.parse(movie.releaseDate)),
                  style: titleLarge?.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
