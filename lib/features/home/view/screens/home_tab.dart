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
  bool _allApisSuccessful = false; 

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
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentPopularIndex++;
        if (_currentPopularIndex >= 5) {
          _currentPopularIndex = 0;
        }
      });
    });
  }

  void _checkApisSuccess() {
    final popularSuccess = popularViewModel.state is PopularSuccessState;
    final upcomingSuccess = upcomingViewModel.state is UpcomingSuccessState;
    final topRatedSuccess = topRatedViewModel.state is TopRatedSuccessState;

    if (popularSuccess && upcomingSuccess && topRatedSuccess) {
      if (!_allApisSuccessful) {
        setState(() {
          _allApisSuccessful = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => popularViewModel),
        BlocProvider(create: (_) => upcomingViewModel),
        BlocProvider(create: (_) => topRatedViewModel),
      ],
      child: BlocListener<PopularViewModel, PopularStates>(
        listener: (_, state) => _checkApisSuccess(),
        child: BlocListener<UpcomingViewModel, UpcomingStates>(
          listener: (_, state) => _checkApisSuccess(),
          child: BlocListener<TopRatedViewModel, TopRatedStates>(
            listener: (_, state) => _checkApisSuccess(),
            child: _allApisSuccessful
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        BlocBuilder<PopularViewModel, PopularStates>(
                          builder: (_, state) {
                            if (state is PopularSuccessState) {
                              final popularList = state.popularList;
                              _currentPopularIndex %= popularList.length;

                              return PopularItem(
                                  popularList[_currentPopularIndex]);
                            } else if (state is PopularErrorState) {
                              return ErrorIndicator(
                                  errMessage: state.errMessage);
                            } else {
                              return const SizedBox();
                            }
                          },
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 8),
                                child: Text(
                                  "New Releases",
                                  style: titleLarge?.copyWith(fontSize: 15),
                                ),
                              ),
                              BlocBuilder<UpcomingViewModel, UpcomingStates>(
                                builder: (_, state) {
                                  if (state is UpcomingSuccessState) {
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
                                  } else if (state is UpcomingErrorState) {
                                    return ErrorIndicator(
                                        errMessage: state.errMessage);
                                  } else {
                                    return const SizedBox();
                                  }
                                },
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 8),
                                child: Text(
                                  "Recommended",
                                  style: titleLarge?.copyWith(fontSize: 15),
                                ),
                              ),
                              BlocBuilder<TopRatedViewModel, TopRatedStates>(
                                builder: (_, state) {
                                  if (state is TopRatedSuccessState) {
                                    final topRatedList = state.topRatedList;

                                    return SizedBox(
                                      height: height * 0.3,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: topRatedList.length,
                                        itemBuilder: (context, index) =>
                                            CategoryItemDetailed(
                                                topRatedList[index]),
                                      ),
                                    );
                                  } else if (state is TopRatedErrorState) {
                                    return ErrorIndicator(
                                        errMessage: state.errMessage);
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                :const LoadingIndicator(),
          ),
        ),
      ),
    );
  }
}
