import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/browse/data/models/categories/category.dart';
import 'package:movies/features/browse/view/screens/catedory_details.dart';
import 'package:movies/features/browse/view/widgets/borwse_category_item.dart';
import 'package:movies/features/browse/view_model/categories/categories_state.dart';
import 'package:movies/features/browse/view_model/categories/categories_view_model.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final categoriesViewModel = CategoriesViewModel();
  @override
  void initState() {
    super.initState();
    categoriesViewModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: BlocProvider(
          create: (context) => categoriesViewModel,
          child: BlocBuilder<CategoriesViewModel, CategoriesState>(
              builder: (_, state) {
            if (state is CategoriesLoadingState) {
              return const LoadingIndicator();
            } else if (state is CategoriesErrorState) {
              return ErrorIndicator(errMessage: state.errorMessage);
            } else if (state is CategoriesSuccessState) {
              final List<Categorey> categoriesList = state.categoriesList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      'Browse Category ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 150 / 100,
                              crossAxisCount: 2,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 10),
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, CatedoryDetails.routeName,
                              arguments: categoriesList[index]);
                        },
                        child: BorwseCategoryItem(
                            categoryName:
                                categoriesList[index].name ?? "Other ",
                            imageName: categoriesList[index].name! ),
                      ),
                      itemCount: categoriesList.length,
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          })),
    );
  }
}
