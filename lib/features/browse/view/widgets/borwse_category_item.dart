import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

// ignore: must_be_immutable
class BorwseCategoryItem extends StatelessWidget {
  BorwseCategoryItem(
      {super.key, required this.imageName, required this.categoryName});
  final String imageName;
  final String categoryName;
  List<String> imageNames = [
    'Action',
    'Animation',
    'Comedy',
    'Drama',
    'Fantasy',
    'Music',
    'Romance',
    'War'
  ];

  @override
  Widget build(BuildContext context) {
    bool isInList = imageNames.contains(imageName);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(isInList
                ? 'assets/images/$imageName.webp'
                : 'assets/images/category_item.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              AppColors.primary.withOpacity(0.2),
              BlendMode.multiply,
            ),
          ),
        ),
        child: Center(
          child: Text(
            categoryName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
