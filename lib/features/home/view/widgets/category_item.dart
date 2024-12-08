import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/upcoming_models/results.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class CategoryItem extends StatelessWidget {
  final Results results;
  const CategoryItem(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            height: height * 0.25,
            width: width * 0.3,
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500/${results.posterPath}' ,
              fit: BoxFit.cover,
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported),
            ),
          ),
        ),
        PositionedDirectional(
          top: height * 0.001,
          end: width * 0.2,
          child: Add(),
        ),
      ],
    );
  }
}
