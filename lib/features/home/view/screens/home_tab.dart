import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/view/widgets/category_item.dart';
import 'package:movies/features/home/view/widgets/category_item_detailed.dart';
import 'package:movies/features/home/view/widgets/popular_item.dart';
import 'package:movies/features/home/view_model/popular_view_model/popular_states.dart';
import 'package:movies/features/home/view_model/popular_view_model/popular_view_model.dart';
import 'package:movies/features/home/view_model/top_rated_view_model/top_rated_states.dart';
import 'package:movies/features/home/view_model/top_rated_view_model/top_rated_view_model.dart';
import 'package:movies/features/home/view_model/upcoming_movies_view_model/upcoming_states.dart';
import 'package:movies/features/home/view_model/upcoming_movies_view_model/upcoming_view_model.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final popularViewModel = PopularViewModel();
  final upcomingViewModel = UpcomingViewModel();
  final topRatedViewModel = TopRatedViewModel();
  late Timer _timer;
  int _currentPopularIndex = 0;

  @override
  void initState() {
    super.initState();
    popularViewModel.getMovies();
    upcomingViewModel.getMovies();
    topRatedViewModel.getMovies();
    _startPopularItemTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startPopularItemTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        _currentPopularIndex++;
        if (_currentPopularIndex >= 5) {
          _currentPopularIndex = 0;
        }
      });
    });
  }


  void _goToNextItem() {
    setState(() {
      if (_currentPopularIndex < 4) {
        _currentPopularIndex++;
      } else {
        _currentPopularIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          BlocProvider(
            create: (context) => popularViewModel,
            child: BlocBuilder<PopularViewModel, PopularStates>(
              builder: (_, state) {
                if (state is PopularLoadingState) {
                  return const LoadingIndicator();
                } else if (state is PopularErrorState) {
                  return ErrorIndicator(errMessage: state.errMessage);
                } else if (state is PopularSuccessState) {
                  final popularList = state.popularList;
                  _currentPopularIndex %= popularList.length;

                  return Column(
                    children: [
                      Stack(
                        children: [
                          PopularItem(popularList[_currentPopularIndex]),
                          Positioned(
                            right: 10,
                            top: 82,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_rounded,
                                size: 50,
                                color: AppColors.white,
                              ),
                              onPressed: _goToNextItem,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          SizedBox(height: height * 0.1),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.darkGrey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    "New Releases",
                    style: titleLarge?.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context) => upcomingViewModel,
                  child: BlocBuilder<UpcomingViewModel, UpcomingStates>(
                    builder: (_, state) {
                      debugPrint('Upcoming state: $state');

                      if (state is UpcomingLoadingState) {
                        return const LoadingIndicator();
                      } else if (state is UpcomingErrorState) {
                        return ErrorIndicator(errMessage: state.errMessage);
                      } else if (state is UpcomingSuccessState) {
                        final upcomingList = state.upcomingList;

                        return SizedBox(
                          height: height * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: upcomingList.length,
                            itemBuilder: (context, index) =>
                                CategoryItem(upcomingList[index]),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          height: 180,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.05),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.darkGrey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    "Recommended",
                    style: titleLarge?.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context) => topRatedViewModel,
                  child: BlocBuilder<TopRatedViewModel, TopRatedStates>(
                    builder: (_, state) {
                      debugPrint('Upcoming state: $state');

                      if (state is TopRatedLoadingState) {
                        return const LoadingIndicator();
                      } else if (state is TopRatedErrorState) {
                        return ErrorIndicator(errMessage: state.errMessage);
                      } else if (state is TopRatedSuccessState) {
                        final topRatedList = state.topRatedList;

                        return SizedBox(
                          height: height * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: topRatedList.length,
                            itemBuilder: (context, index) =>
                                CategoryItemDetailed(topRatedList[index]),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          height: 180,
                        );
                      }
                    },
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
