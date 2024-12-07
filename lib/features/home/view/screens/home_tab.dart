import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/view/widgets/category_item.dart';
import 'package:movies/features/home/view/widgets/category_item_detailed.dart';
import 'package:movies/features/home/view/widgets/popular_item.dart';
import 'package:movies/features/home/view_model/popular_movies/popular_states.dart';
import 'package:movies/features/home/view_model/popular_movies/popular_view_model.dart';
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
  late Timer _timer;
  int _currentPopularIndex = 0;

  @override
  void initState() {
    super.initState();
    popularViewModel.getMovies();
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

  void _goToPreviousItem() {
    setState(() {
      if (_currentPopularIndex > 0) {
        _currentPopularIndex--;
      } else {
        _currentPopularIndex = 4;
      }
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
                SizedBox(
                  height: height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => const CategoryItem(),
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
                SizedBox(
                  height: height * 0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        const CategoryItemDetailed(),
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
