import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/search/view_model/search_states.dart';
import 'package:movies/features/search/view_model/search_view_model.dart';
import 'package:movies/features/search/view/widgets/search_item.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/box_details_wanted.dart';
import 'package:movies/shared/screens/movie_details.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/features/search/view/widgets/no_search_results.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final SearchViewModel searchViewModel = SearchViewModel();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    searchViewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchViewModel,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: _searchController,
              onChanged: (value) {
                EasyDebounce.debounce(
                  'search',
                  const Duration(milliseconds: 500),
                  () => searchViewModel.getMovies(value),
                );
              },
              style: Theme.of(context).textTheme.titleLarge,
              cursorColor: AppColors.white,
              decoration: InputDecoration(
                fillColor: AppColors.addGrey,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: AppColors.white,
                hintText: 'Search',
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w200),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: AppColors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<SearchViewModel, SearchStates>(
            builder: (context, state) {
              if (state is SearchInitailState || state is SearchEmptyState) {
                return const NoSearchResults();
              } else if (state is SearchLoadingState) {
                return const LoadingIndicator();
              } else if (state is SearchErrorState) {
                return ErrorIndicator(errMessage: state.errMessage);
              } else if (state is SearchSuccessState) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.05),
                    child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MovieDetails.routeName,
                                arguments: BoxDetailsWanted(
                                  movieId: state.searchResults[index].id!,
                                  titel: state.searchResults[index].title!,
                                  imageURL: state.searchResults[index].backdropPath!,
                                  releasDate: state.searchResults[index].releaseDate!),
                            );
                          },
                          child: SearchItem(
                              searchMovie: state.searchResults[index])),
                      itemCount: state.searchResults.length,
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
