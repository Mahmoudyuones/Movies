import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Divider(
        thickness: 1,
        color: AppColors.dividerGrey,
      ),
    );
  }
}
