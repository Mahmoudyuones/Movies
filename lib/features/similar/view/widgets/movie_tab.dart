import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies/features/similar/data/models/results.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/box_details_wanted.dart';
import 'package:movies/shared/screens/movie_details.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class MovieTab extends StatelessWidget {
  final SimilarResults similarResults;
  const MovieTab(this.similarResults, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    double width = MediaQuery.sizeOf(context).width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetails.routeName,
          arguments: BoxDetailsWanted(
              movieId: similarResults.id!,
              titel: similarResults.title!,
              imageURL: similarResults.backdropPath!,
              releasDate: similarResults.releaseDate!),
        );
      },
      child: Stack(
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
                        'https://image.tmdb.org/t/p/w500/${similarResults.posterPath}',
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
                              similarResults.voteAverage != null
                                  ? similarResults.voteAverage!
                                      .toStringAsFixed(1)
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
                            similarResults.title ?? "No title",
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
                              similarResults.releaseDate != null &&
                                      similarResults.releaseDate!.isNotEmpty
                                  ? DateFormat('yyyy').format(DateTime.parse(
                                      similarResults.releaseDate!))
                                  : "No date",
                              style: titleSmall,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              similarResults.adult == true ? 'Pg-13' : 'R',
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
          Positioned(
            top: 5,
            left: 1,
            child: Add(
              imageUrl: similarResults.backdropPath!,
              movieId: similarResults.id!,
              title: similarResults.title!,
              releaseDate: similarResults.releaseDate!,
            ),
          ),
        ],
      ),
    );
  }
}
