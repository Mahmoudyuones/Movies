import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movies/features/home/view/widgets/category_chips.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
import 'package:movies/features/movie_details/view_model/movie_details_state.dart';
import 'package:movies/features/movie_details/view_model/movie_details_view_model.dart';
import 'package:movies/features/similar/view/widgets/movie_tab.dart';
import 'package:movies/features/similar/view_model/similar_states.dart';
import 'package:movies/features/similar/view_model/similar_view_model.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class MovieDetails extends StatefulWidget {
  static const String routeName = 'Details';
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final MovieDetailsViewModel viewModel = MovieDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    final int movieId = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (_) => MovieDetailsViewModel()..getMovies(movieId),
      child: BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
        builder: (context, state) {
          if (state is MovieDetailsLoadingState) {
            return const Scaffold(
              body: Center(child: LoadingIndicator()),
            );
          } else if (state is MovieDetailsErrorState) {
            return Scaffold(
              appBar: AppBar(title: const Text('Movie Details')),
              body: Center(child: ErrorIndicator(errMessage: state.errMessage)),
            );
          } else if (state is MovieDetailsSuccessState) {
            return _buildDetailsScreen(context, state.movieDetailsResults);
          }

          return const Scaffold(
            body: Center(child: Text('Something went wrong.')),
          );
        },
      ),
    );
  }

  Widget _buildDetailsScreen(BuildContext context, MovieDetailsResponse movie) {
    final int movieId = ModalRoute.of(context)!.settings.arguments as int;

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    final String imageUrl = movie.posterPath != null
        ? 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'
        : 'https://th.bing.com/th/id/OIP.nKHjaZVhPgLKjjntUMpmXwHaHa?rs=1&pid=ImgDetMain';
    String formatTime(int minutes) {
      int hours = minutes ~/ 60;
      int remainingMinutes = minutes % 60;
      return '${hours}h ${remainingMinutes}m';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title ?? '',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.25,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                movie.title ?? '',
                style: titleLarge?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      movie.releaseDate != null
                          ? DateFormat('yyyy')
                              .format(DateTime.parse(movie.releaseDate!))
                          : "No date",
                      style: titleSmall?.copyWith(fontSize: 10),
                    ),
                    Text(
                      movie.adult == true ? 'Pg-13' : 'R',
                      style: titleSmall?.copyWith(fontSize: 10),
                    ),
                    Text(
                      formatTime(movie.runtime ?? 0),
                      style: titleSmall?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      child: SizedBox(
                        height: height * 0.28,
                        width: width * 0.4,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              const LoadingIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                    const Add(),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryChips(
                        categories: movie.genres!
                            .map((geners) => geners.name ?? '')
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.overview ?? '',
                          style: titleSmall?.copyWith(
                            fontSize: 13,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.yellow,
                          ),
                          Text(
                            movie.voteAverage != null
                                ? movie.voteAverage!.toStringAsFixed(1)
                                : "N/A",
                            style: titleLarge?.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: height * 0.44,
              width: double.infinity,
              color: AppColors.darkGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'More Like This',
                      style: titleLarge?.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) {
                      final similarViewModel = SimilarViewModel();
                      similarViewModel.getMovies(
                          movieId); 
                      return similarViewModel; 
                    },
                    child: BlocBuilder<SimilarViewModel, SimilarStates>(
                      builder: (context, state) {
                        if (state is SimilarLoadingState) {
                          return const LoadingIndicator();
                        } else if (state is SimilarErrorState) {
                          return ErrorIndicator(errMessage: state.errMessage);
                        } else if (state is SimilarSuccessState) {
                          final similarList = state.similarResults;
                          return SizedBox(
                            height: height * 0.4,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: similarList.length,
                              itemBuilder: (context, index) =>
                                  MovieTab(similarList[index]),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
