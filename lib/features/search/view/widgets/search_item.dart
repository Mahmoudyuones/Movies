import 'package:flutter/material.dart';
import 'package:movies/shared/models/movie_model.dart';

class SearchItem extends StatelessWidget {
  final Movie searchMovie;
  const SearchItem({super.key, required this.searchMovie});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final String imageUrl = searchMovie.posterPath != null
        ? 'https://image.tmdb.org/t/p/w500/${searchMovie.posterPath}'
        : 'https://th.bing.com/th/id/OIP.nKHjaZVhPgLKjjntUMpmXwHaHa?rs=1&pid=ImgDetMain';

    return SizedBox(
      height: height * 0.15,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: height * 0.14,
            width: width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          SizedBox(width: width * 0.05),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  searchMovie.title ?? '',
                  style: Theme.of(context).textTheme.titleLarge,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 5),
                Text(
                  searchMovie.releaseDate ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
