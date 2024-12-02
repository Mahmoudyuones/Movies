import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

class AppTheme {
  static ThemeData lightPrimary = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.white,
      centerTitle: true,
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.darkGrey,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.greyIcons,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 13,
        color: AppColors.greyText,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        color: AppColors.greyText,
      ),
    ),
  );
}
