import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies/features/home/data/models/top_rated_models/top_rated_results.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class CategoryItemDetailed extends StatelessWidget {
  final TopRatedResults topRated;
  const CategoryItemDetailed(this.topRated, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    double width = MediaQuery.sizeOf(context).width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          width: width * 0.3,
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500/${topRated.posterPath}',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_not_supported),
                ),
              ),
              Container(
                width: width * 0.3,
                height: height * 0.1,
                color: AppColors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.yellow,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            topRated.voteAverage != null
                                ? topRated.voteAverage!.toStringAsFixed(1)
                                : "N/A",
                            style: titleLarge?.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          topRated.title ?? "No title",
                          style: titleLarge?.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                            topRated.releaseDate != null
                                ? DateFormat('yyyy').format(
                                    DateTime.parse(topRated.releaseDate!))
                                : "No date",
                            style: titleSmall,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            topRated.adult == true ? 'Pg-13' : 'R',
                            style: titleSmall,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Positioned(
          top: 5,
          left: 1,
          child: Add(),
        ),
      ],
    );
  }
}

