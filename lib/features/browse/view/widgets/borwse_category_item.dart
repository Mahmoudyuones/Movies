import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

class BorwseCategoryItem extends StatelessWidget {
  const BorwseCategoryItem(
      {super.key, required this.imageName, required this.categoryName});
  final String imageName;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/$imageName.webp',
            ),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                AppColors.primary.withOpacity(0.2), BlendMode.multiply),
          ),
        ),
        child: Center(
          child: Text(
            categoryName,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
