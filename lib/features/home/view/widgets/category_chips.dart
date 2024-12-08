import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

class CategoryChips extends StatelessWidget {
  final List<String> categories;

  const CategoryChips({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 10,
        runSpacing: 5,
        children: categories.map((category) {
          return Container(
            height: 30,
            width: 75,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.addGrey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                category,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 10,
                    ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
