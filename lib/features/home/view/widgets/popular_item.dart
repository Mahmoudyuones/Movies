import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/models/popular_models/movie.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/screens/movie_details.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class PopularItem extends StatelessWidget {
  final Movie movie;
  const PopularItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routeName,
            arguments: movie.id);
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 217.h,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: movie.backdropPath.isNotEmpty
                  ? 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'
                  : '',
              height: 217.h,
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
            top: 90.h,
            start: 10.w,
            child: SizedBox(
              height: 199.h,
              width: 129.w,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                    placeholder: (context, url) => const LoadingIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image_not_supported),
                  ),
                  PositionedDirectional(
                    end:81.w,
                    bottom: 148.h,
                    child: const Add(),
                  ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            top: 230.h,
            start: 164.w,
            child: Text(
              movie.title,
              style: titleLarge,
            ),
          ),
          PositionedDirectional(
            top: height * 0.3,
            start: width * 0.4,
            child: Row(
              children: [
                Text(
                  movie.releaseDate,
                  style: titleSmall?.copyWith(fontSize: 10),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  movie.adult ? 'Pg-13' : 'R',
                  style: titleSmall?.copyWith(fontSize: 10),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '2h 7m',
                  style: titleSmall?.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
