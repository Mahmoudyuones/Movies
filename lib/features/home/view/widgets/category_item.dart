import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/models/upcoming_models/results.dart';
import 'package:movies/shared/screens/movie_details.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class CategoryItem extends StatelessWidget {
  final Results results;
  const CategoryItem(this.results, {super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MovieDetails.routeName,
                arguments: results.id);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 13.73.w, vertical: 8),
            height: 127.74.h,
            width: 96.87.w,
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500/${results.posterPath}',
              fit: BoxFit.cover,
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported),
            ),
          ),
        ),
        PositionedDirectional(
          top: -7.h,
          start:-5.w ,
          child: const Add(),
        ),
      ],
    );
  }
}
