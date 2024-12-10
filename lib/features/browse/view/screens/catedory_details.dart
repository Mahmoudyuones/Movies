import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/browse/data/models/categories/category.dart';
import 'package:movies/features/browse/view_model/category_details_view_model/category_details_state.dart';
import 'package:movies/features/browse/view_model/category_details_view_model/category_details_view_model.dart';
import 'package:movies/features/home/view/widgets/popular_item.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class CatedoryDetails extends StatefulWidget {
  static const String routeName = '/Category details';
  const CatedoryDetails({super.key});

  @override
  State<CatedoryDetails> createState() => _CatedoryDetailsState();
}

class _CatedoryDetailsState extends State<CatedoryDetails> {
  @override
  Widget build(BuildContext context) {
    final categorey = ModalRoute.of(context)!.settings.arguments as Categorey;
    final categoryDetailsViewModel =
        CategoryDetailsViewModel(categoryId: categorey.id.toString());
    categoryDetailsViewModel.getmovies();
    return Scaffold(
      appBar: AppBar(
        title: Text(categorey.name ?? ""),
      ),
      body: BlocProvider(
        create: (context) => categoryDetailsViewModel,
        child: BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
          builder: (_, state) {
            if (state is CategoryDetailsLoadingState) {
              return const LoadingIndicator();
            } else if (state is CategoryDetailsErrorState) {
              return ErrorIndicator(errMessage: state.errorMessage);
            } else if (state is CategoryDetailsSuccesseState) {
              return ListView.builder(
                itemBuilder: (_, index) => Column(
                  children: [
                    PopularItem(state.moviesList[index]),
                    const SizedBox(
                      height: 70,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
                itemCount: state.moviesList.length,
              );
            } else {
              return const LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
