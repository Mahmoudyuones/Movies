import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/browse/view/screens/catedory_details.dart';
import 'package:movies/shared/screens/movie_details.dart';
import 'package:movies/features/home/view/screens/home_screen.dart';
import 'package:movies/shared/app_theme/app_theme.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(412, 892) ,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          MovieDetails.routeName: (_) => const MovieDetails(),
          CatedoryDetails.routeName: (_) => const CatedoryDetails(),
        },
        initialRoute: HomeScreen.routeName,
        theme: AppTheme.lightPrimary,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
