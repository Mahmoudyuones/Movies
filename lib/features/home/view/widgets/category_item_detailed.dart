import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies/features/home/data/models/top_rated_models/top_rated_results.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/screens/movie_details.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class CategoryItemDetailed extends StatelessWidget {
  final TopRatedResults topRated;
  const CategoryItemDetailed(this.topRated, {super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetails.routeName,
          arguments: topRated.id,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 15.h,
            ),
            width: 97.w,
            height: 184.h,
            child: Column(
              children: [
                SizedBox(
                  height: 128.h,
                  width: 97.w,
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
                  width: 97.w,
                  height: 57.h,
                  color: AppColors.grey,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
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
                            SizedBox(
                              width: 3.7.w,
                            ),
                            Text(
                              topRated.voteAverage != null
                                  ? topRated.voteAverage!.toStringAsFixed(1)
                                  : "N/A",
                              style: titleLarge?.copyWith(
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          topRated.title ?? "No title",
                          style: titleLarge?.copyWith(
                            fontSize: 10.sp,
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
      ),
    );
  }
}
