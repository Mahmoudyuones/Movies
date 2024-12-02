import 'package:flutter/material.dart';
import 'package:movies/home/view/screens/home_screen.dart';
import 'package:movies/shared/app_theme/app_theme.dart';


void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName : (_) => const HomeScreen()},
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightPrimary,
      themeMode: ThemeMode.light,
    );
  }
}