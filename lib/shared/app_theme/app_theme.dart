import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

class AppTheme {
  static ThemeData lightPrimary = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    primaryColor: AppColors.primary,
    appBarTheme:  AppBarTheme(
      foregroundColor: AppColors.white,
      centerTitle: true,
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.darkGrey,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.greyIcons,
      
    ),
    textTheme:  TextTheme(
      displayLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 13.sp,
        color: AppColors.greyText,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.greyText,
      ),
    ),
  );
}
